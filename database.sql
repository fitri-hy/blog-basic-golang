-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 24 Sep 2024 pada 07.26
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `demo`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `blogs`
--

CREATE TABLE `blogs` (
  `id` int(11) NOT NULL,
  `title` longtext NOT NULL,
  `content` longtext NOT NULL,
  `image` longtext DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `content_list` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `blogs`
--

INSERT INTO `blogs` (`id`, `title`, `content`, `image`, `created_at`, `content_list`) VALUES
(2, 'Apa Itu Golang? Yuk, Pelajari Lebih Jauh!', '<p>Golang, atau yang juga dikenal sebagai <strong>Go</strong>, adalah bahasa pemrograman yang dikembangkan oleh Google pada tahun 2007 dan dirilis secara resmi pada tahun 2009. Bahasa ini dirancang untuk menyederhanakan proses pengembangan perangkat lunak yang skalabel dan efisien, terutama untuk aplikasi yang berjalan di server.</p><p><br></p><p>Berikut ini adalah beberapa alasan mengapa Golang semakin populer dan banyak digunakan oleh para developer:</p><p><br></p><h2>1. <strong>Ringkas dan Mudah Dipelajari</strong></h2><p><br></p><p>Salah satu kelebihan Golang adalah sintaksnya yang sederhana dan ringkas, sehingga mudah dipelajari bahkan bagi pemula. Meski mudah dipahami, Golang tetap powerful untuk membuat aplikasi yang kompleks. Contohnya, untuk menjalankan sebuah server web sederhana, Golang hanya membutuhkan beberapa baris kode.</p><h3><br></h3><h2>2. <strong>Kinerja Tinggi</strong></h2><p><br></p><p>Golang dikenal karena <strong>kecepatannya</strong>. Dibangun sebagai bahasa yang dikompilasi (compiled language), Golang dapat mengeksekusi kode lebih cepat dibandingkan bahasa yang diinterpretasi seperti Python. Oleh karena itu, Golang banyak digunakan untuk membangun aplikasi back-end yang membutuhkan performa tinggi, seperti server web, API, atau sistem komputasi besar.</p><p><br></p><h2>3. <strong>Concurrency yang Kuat</strong></h2><p><br></p><p>Salah satu fitur utama Golang adalah <strong>goroutines</strong>. Goroutines memungkinkan pemrograman konkuren (concurrent programming) secara mudah, di mana beberapa proses dapat berjalan secara paralel. Ini menjadikan Golang pilihan yang baik untuk aplikasi yang memerlukan multitasking atau pemrosesan paralel, seperti aplikasi web skala besar atau pemrosesan data dalam jumlah besar.</p><h3><br></h3><h2>4. <strong>Statically Typed</strong></h2><p><br></p><p>Golang menggunakan sistem <strong>tipe statis (statically typed)</strong>, yang berarti tipe data ditentukan sejak awal dan diverifikasi oleh compiler. Ini membantu menghindari kesalahan tipe data saat runtime dan memudahkan proses debugging serta meningkatkan keandalan aplikasi.</p><h3><br></h3><h2>5. <strong>Ekosistem yang Kuat</strong></h2><p><br></p><p>Dengan dukungan komunitas yang besar dan berbagai <strong>library</strong> dan <strong>framework</strong>, Golang memiliki ekosistem yang semakin matang. Golang juga menyediakan built-in <strong>garbage collector</strong>, yang memudahkan manajemen memori secara otomatis. Ditambah lagi, tools seperti <code>Go Modules</code> memudahkan manajemen dependency di Golang.</p><h3><br></h3><h2>6. <strong>Digunakan oleh Perusahaan Besar</strong></h2><p><br></p><p>Banyak perusahaan teknologi besar menggunakan Golang untuk infrastruktur mereka, seperti <strong>Google</strong>, <strong>Uber</strong>, <strong>Dropbox</strong>, dan <strong>SoundCloud</strong>. Hal ini menunjukkan bahwa Golang telah terbukti sebagai bahasa yang dapat diandalkan untuk pengembangan aplikasi berskala besar.</p><h3><br></h3><h2>7. <strong>Cocok untuk Berbagai Aplikasi</strong></h2><p><br></p><p>Golang cocok untuk berbagai macam aplikasi, terutama di area seperti:</p><ul><li><strong>Microservices</strong>: Arsitektur yang modular dan ringan sangat didukung oleh fitur-fitur Golang.</li><li><strong>API Back-end</strong>: Golang sangat baik dalam membangun API yang efisien dan cepat.</li><li><strong>Distributed Systems</strong>: Sistem terdistribusi yang membutuhkan skalabilitas dan efisiensi.</li></ul><h3><br></h3><h2><strong>Kesimpulan</strong></h2><p><br></p><p>Golang adalah bahasa pemrograman modern yang sangat cocok untuk pengembangan perangkat lunak berskala besar dan performa tinggi. Dengan sintaks yang sederhana, kemampuan concurrency yang kuat, dan ekosistem yang terus berkembang, Golang menjadi pilihan menarik bagi developer yang ingin membangun aplikasi yang cepat dan scalable. Jika kamu ingin meningkatkan skill di dunia pemrograman back-end, mempelajari Golang bisa menjadi langkah yang tepat!</p>', 'Screenshot.png', '2024-09-24 04:21:30', '');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
