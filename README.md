# Blog Basic Golang

aplikasi blog sederhana yang dibangun menggunakan bahasa pemrograman Go (Golang). Aplikasi ini memanfaatkan framework Gorilla Mux untuk routing, serta GORM sebagai ORM untuk menghubungkan aplikasi dengan database MySQL.

## Fitur

- CRUD (Create, Read, Update, Delete) Postingan Blog
- Pengelolaan Database dengan GORM
- Routing dengan Gorilla Mux
- Templating HTML

## Persyaratan

Pastikan Anda memiliki hal berikut:

- Go 1.18 atau lebih baru [Unduh Go](https://golang.org/dl/)
- MySQL yang terpasang dan berjalan
- Git

## Atur Koneksi Database

```
dsn := "username:password@tcp(127.0.0.1:3306)/dbname?charset=utf8mb4&parseTime=True&loc=Local"
```

- username: Nama pengguna MySQL Anda
- password: Kata sandi MySQL Anda
- dbname: Nama database yang akan digunakan


## Import Database `.sql`

Pastikan Anda sudah melakukan import `database.sql` ke PHPMyAdmin.

## Instalasi

Ikuti langkah-langkah berikut untuk menjalankan aplikasi ini di komputer lokal Anda:

```
git clone https://github.com/fitri-hy/blog-basic-golang.git
cd blog-basic-golang
go mod tidy
go run main.go
```