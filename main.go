package main

import (
    "io"
    "net/http"
    "strings"
    "os"
    "html/template"

    "github.com/gorilla/mux"
    "gorm.io/driver/mysql"
    "gorm.io/gorm"
)

type Blog struct {
    ID      uint   `gorm:"primaryKey"`
    Title   string `gorm:"not null"`
    Content string `gorm:"not null"`
    Image   string
}

var db *gorm.DB

func init() {
    var err error
    dsn := "username:password@tcp(127.0.0.1:3306)/dbname?charset=utf8mb4&parseTime=True&loc=Local"
    db, err = gorm.Open(mysql.Open(dsn), &gorm.Config{})
    if err != nil {
        panic("failed to connect to database")
    }
    db.AutoMigrate(&Blog{})
}

func main() {
    r := mux.NewRouter()
	r.PathPrefix("/static/").Handler(http.StripPrefix("/static/", http.FileServer(http.Dir("static/"))))
    r.HandleFunc("/", listBlogs).Methods("GET")
    r.HandleFunc("/blog/{id}", blogDetail).Methods("GET")
    r.HandleFunc("/dashboard", dashboard).Methods("GET")
    r.HandleFunc("/dashboard/add", addBlog).Methods("GET", "POST")
    r.HandleFunc("/dashboard/edit/{id}", editBlog).Methods("GET", "POST")
    r.HandleFunc("/dashboard/delete/{id}", deleteBlog).Methods("GET")

    http.Handle("/", r)
    http.ListenAndServe(":8080", nil)
}

func styleContent(content string) template.HTML {
    styledContent := strings.ReplaceAll(content, "<h1>", "<h1 class=\"text-4xl font-bold mt-6 mb-4\">")
    styledContent = strings.ReplaceAll(styledContent, "<h2>", "<h2 class=\"text-3xl font-bold mt-4 mb-2\">")
    return template.HTML(styledContent)
}

func listBlogs(w http.ResponseWriter, r *http.Request) {
    var blogs []Blog
    db.Find(&blogs)
    tmpl := template.Must(template.ParseFiles("templates/list_blogs.html"))
    tmpl.Execute(w, blogs)
}

func blogDetail(w http.ResponseWriter, r *http.Request) {
    vars := mux.Vars(r)
    var blog Blog
    db.First(&blog, vars["id"])
    tmpl := template.Must(template.New("blog_detail.html").Funcs(template.FuncMap{
        "styleContent": styleContent,
    }).ParseFiles("templates/blog_detail.html"))
    tmpl.Execute(w, blog)
}

func dashboard(w http.ResponseWriter, r *http.Request) {
    var blogs []Blog
    db.Find(&blogs)
    tmpl := template.Must(template.ParseFiles("templates/dashboard.html"))
    tmpl.Execute(w, blogs)
}

func addBlog(w http.ResponseWriter, r *http.Request) {
    if r.Method == http.MethodPost {
        title := r.FormValue("title")
        content := r.FormValue("content")

        err := r.ParseMultipartForm(10 << 20)
        if err != nil {
            http.Error(w, "Unable to parse form", http.StatusBadRequest)
            return
        }

        file, fileHeader, err := r.FormFile("image")
        if err != nil {
            http.Error(w, "File upload failed", http.StatusBadRequest)
            return
        }
        defer file.Close()

        uploadPath := "static/uploads/"
        if _, err := os.Stat(uploadPath); os.IsNotExist(err) {
            err = os.MkdirAll(uploadPath, os.ModePerm)
            if err != nil {
                http.Error(w, "Failed to create directory", http.StatusInternalServerError)
                return
            }
        }

        dst, err := os.Create(uploadPath + fileHeader.Filename)
        if err != nil {
            http.Error(w, "Failed to create file", http.StatusInternalServerError)
            return
        }
        defer dst.Close()

        if _, err := io.Copy(dst, file); err != nil {
            http.Error(w, "Failed to copy file", http.StatusInternalServerError)
            return
        }

        blog := Blog{Title: title, Content: content, Image: fileHeader.Filename}
        db.Create(&blog)
        http.Redirect(w, r, "/dashboard", http.StatusSeeOther)
    } else {
        tmpl := template.Must(template.ParseFiles("templates/add_blog.html"))
        tmpl.Execute(w, nil)
    }
}

func editBlog(w http.ResponseWriter, r *http.Request) {
    vars := mux.Vars(r)
    var blog Blog
    db.First(&blog, vars["id"])

    if r.Method == http.MethodPost {
        blog.Title = r.FormValue("title")
        blog.Content = r.FormValue("content")

        err := r.ParseMultipartForm(10 << 20)
        if err != nil {
            http.Error(w, "Unable to parse form", http.StatusBadRequest)
            return
        }

        if file, fileHeader, err := r.FormFile("image"); err == nil {
            defer file.Close()
            dst, err := os.Create("static/uploads/" + fileHeader.Filename)
            if err == nil {
                defer dst.Close()
                if _, err := io.Copy(dst, file); err == nil {
                    blog.Image = fileHeader.Filename
                }
            }
        }

        db.Save(&blog)
        http.Redirect(w, r, "/dashboard", http.StatusSeeOther)
    } else {
        tmpl := template.Must(template.ParseFiles("templates/edit_blog.html"))
        tmpl.Execute(w, blog)
    }
}

func deleteBlog(w http.ResponseWriter, r *http.Request) {
    vars := mux.Vars(r)
    db.Delete(&Blog{}, vars["id"])
    http.Redirect(w, r, "/dashboard", http.StatusSeeOther)
}
