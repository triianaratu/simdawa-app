-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 10 Jul 2023 pada 06.26
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `beasiswa-app`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `beasiswa`
--

CREATE TABLE `beasiswa` (
  `id` int(11) NOT NULL,
  `nama_beasiswa` varchar(50) DEFAULT NULL,
  `tanggal_mulai` date DEFAULT NULL,
  `tanggal_selesai` date DEFAULT NULL,
  `jenis_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `beasiswa`
--

INSERT INTO `beasiswa` (`id`, `nama_beasiswa`, `tanggal_mulai`, `tanggal_selesai`, `jenis_id`) VALUES
(1, 'Bidikmisi 2023', '2023-06-04', '2023-06-14', 2),
(3, 'Prestasi', '2023-06-22', '2023-06-30', 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `jenis_beasiswa`
--

CREATE TABLE `jenis_beasiswa` (
  `id` int(11) NOT NULL,
  `nama_jenis` varchar(50) DEFAULT NULL,
  `keterangan` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `jenis_beasiswa`
--

INSERT INTO `jenis_beasiswa` (`id`, `nama_jenis`, `keterangan`) VALUES
(1, 'KIP Kuliah Banjarmasin', 'Beasiswa KIP Kuliah Uniska Banjmasin'),
(2, 'Bidikmisi', 'Bidikmisi Uniska'),
(3, 'Prestasi', 'Prestasi Akademik');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pendaftaran_pengguna`
--

CREATE TABLE `pendaftaran_pengguna` (
  `id` int(11) NOT NULL,
  `no_pendaftaran` varchar(20) DEFAULT NULL,
  `nama_lengkap` varchar(75) DEFAULT NULL,
  `no_handphone` varchar(15) DEFAULT NULL,
  `bukti_daftar` varchar(255) DEFAULT NULL,
  `prodi_id` int(11) DEFAULT NULL,
  `keterangan` enum('Belum Diverifikasi','Sudah Diverifikasi','Akun Dibatalkan') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pendaftaran_pengguna`
--

INSERT INTO `pendaftaran_pengguna` (`id`, `no_pendaftaran`, `nama_lengkap`, `no_handphone`, `bukti_daftar`, `prodi_id`, `keterangan`) VALUES
(1, '001', 'Nur Indah Triana Ratu', '087810621066', 'WhatsApp_Image_2020-09-23_at_05_46_58.jpeg', NULL, 'Sudah Diverifikasi'),
(2, '002', 'Aulia Andini', '089712321244', 'Background-Peserta.jpg', NULL, 'Akun Dibatalkan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengajuan_beasiswa`
--

CREATE TABLE `pengajuan_beasiswa` (
  `id` varchar(64) NOT NULL,
  `tanggal_pengajuan` date DEFAULT NULL,
  `pengguna_id` int(11) DEFAULT NULL,
  `beasiswa_id` int(11) DEFAULT NULL,
  `keterangan` enum('Diajukan','Ditolak','Diusulkan','Ditetapkan') DEFAULT 'Diajukan'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengguna`
--

CREATE TABLE `pengguna` (
  `id` int(11) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `peran` enum('ADMIN','USER','OPERATOR') DEFAULT NULL,
  `login_terakhir` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `pendaftaran_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pengguna`
--

INSERT INTO `pengguna` (`id`, `username`, `PASSWORD`, `peran`, `login_terakhir`, `pendaftaran_id`) VALUES
(1, 'triianaratu', '526fb2274d7c1d3f27ea5974a39d2063', 'USER', '2023-07-08 13:17:48', 1),
(2, 'auliaandini', '6522f2fcd48c1fbeb4cd18b8e8d7e59a', 'USER', '2023-07-08 13:18:02', 2),
(3, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'ADMIN', '2023-07-08 13:17:14', NULL),
(4, 'operator', '4b583376b2767b923c3e1da60d10de59', 'OPERATOR', '2023-07-08 13:17:28', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `persyaratan`
--

CREATE TABLE `persyaratan` (
  `id` int(11) NOT NULL,
  `nama_persyaratan` varchar(100) DEFAULT NULL,
  `keterangan` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `persyaratan`
--

INSERT INTO `persyaratan` (`id`, `nama_persyaratan`, `keterangan`) VALUES
(1, 'Mahasiswa Aktif', 'Uniska Mab'),
(2, 'Fotokopi  KTM', 'Slip pembayaran terakhir');

-- --------------------------------------------------------

--
-- Struktur dari tabel `persyaratan_beasiswa`
--

CREATE TABLE `persyaratan_beasiswa` (
  `id` int(11) NOT NULL,
  `beasiswa_id` int(11) DEFAULT NULL,
  `persyaratan_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `persyaratan_pengajuan`
--

CREATE TABLE `persyaratan_pengajuan` (
  `id` int(11) NOT NULL,
  `pengajuan_id` int(11) DEFAULT NULL,
  `persyaratan_id` int(11) DEFAULT NULL,
  `tanggal_upload` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `nama_file` varchar(255) DEFAULT NULL,
  `keterangan` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `prodi`
--

CREATE TABLE `prodi` (
  `id` int(11) NOT NULL,
  `nama_prodi` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `prodi`
--

INSERT INTO `prodi` (`id`, `nama_prodi`) VALUES
(1, 'Teknik Informatika'),
(2, 'Sistem Informasi'),
(3, 'Ilmu Komunikasi');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `beasiswa`
--
ALTER TABLE `beasiswa`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `jenis_beasiswa`
--
ALTER TABLE `jenis_beasiswa`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pendaftaran_pengguna`
--
ALTER TABLE `pendaftaran_pengguna`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pengajuan_beasiswa`
--
ALTER TABLE `pengajuan_beasiswa`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `persyaratan`
--
ALTER TABLE `persyaratan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `persyaratan_beasiswa`
--
ALTER TABLE `persyaratan_beasiswa`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `persyaratan_pengajuan`
--
ALTER TABLE `persyaratan_pengajuan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `prodi`
--
ALTER TABLE `prodi`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `beasiswa`
--
ALTER TABLE `beasiswa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `jenis_beasiswa`
--
ALTER TABLE `jenis_beasiswa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `pendaftaran_pengguna`
--
ALTER TABLE `pendaftaran_pengguna`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `pengguna`
--
ALTER TABLE `pengguna`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `persyaratan`
--
ALTER TABLE `persyaratan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `persyaratan_beasiswa`
--
ALTER TABLE `persyaratan_beasiswa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `persyaratan_pengajuan`
--
ALTER TABLE `persyaratan_pengajuan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `prodi`
--
ALTER TABLE `prodi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
