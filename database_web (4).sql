-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 24, 2022 at 07:50 PM
-- Server version: 10.4.25-MariaDB-1:10.4.25+maria~focal
-- PHP Version: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `database_web`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_artikel`
--

CREATE TABLE `tb_artikel` (
  `id_artikel` int(10) UNSIGNED NOT NULL,
  `judul` char(255) NOT NULL,
  `slug` varchar(300) NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `id_kategori` int(10) UNSIGNED DEFAULT NULL,
  `tags` varchar(300) DEFAULT NULL,
  `konten` longtext NOT NULL,
  `tgl_publish` datetime NOT NULL,
  `edit_by` char(255) DEFAULT NULL,
  `tgl_edit` datetime DEFAULT NULL,
  `status` enum('publish','draft') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_artikel`
--

INSERT INTO `tb_artikel` (`id_artikel`, `judul`, `slug`, `user_id`, `id_kategori`, `tags`, `konten`, `tgl_publish`, `edit_by`, `tgl_edit`, `status`) VALUES
(3, 'Testing Artikel 1', 'testing-artikel-1', 1, 2, 'testing, keamanan informasi, cyber security', 'Konten Testing Artikel 1', '2021-12-08 18:51:26', NULL, NULL, 'publish'),
(4, 'Testing Artikel 2', 'testing-artikel-2', 2, 2, 'testing, pemrograaman web', 'Konten Testing Artikel 2', '2022-01-11 18:51:22', NULL, NULL, 'publish'),
(5, 'Testing Artikel 3', 'testing-artikel-3', 2, 2, 'testing, tips dan trick', 'Konten Testing Artikel 3', '2022-02-01 17:08:20', NULL, NULL, 'publish');

-- --------------------------------------------------------

--
-- Table structure for table `tb_kategori`
--

CREATE TABLE `tb_kategori` (
  `id_kategori` int(10) UNSIGNED NOT NULL,
  `kategori` char(255) NOT NULL,
  `slug` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_kategori`
--

INSERT INTO `tb_kategori` (`id_kategori`, `kategori`, `slug`) VALUES
(1, 'pemrograman web', 'pemrograman-web'),
(2, 'Linux Server', 'linux-server'),
(3, 'keamanan informasi', 'keamanan-informasi'),
(4, 'system administrator', 'system-administrator'),
(5, 'Tips dan Trick', 'tips-dan-trik');

-- --------------------------------------------------------

--
-- Table structure for table `tb_kontak`
--

CREATE TABLE `tb_kontak` (
  `id_kontak` int(10) UNSIGNED NOT NULL,
  `email` char(100) NOT NULL,
  `nama_lengkap` char(100) NOT NULL,
  `alamat` char(255) NOT NULL,
  `no_whatsapp` char(14) NOT NULL,
  `kota` char(80) NOT NULL,
  `kecamatan` char(80) NOT NULL,
  `kode_pos` char(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_kontak`
--

INSERT INTO `tb_kontak` (`id_kontak`, `email`, `nama_lengkap`, `alamat`, `no_whatsapp`, `kota`, `kecamatan`, `kode_pos`) VALUES
(6, 'mrnaeem@tutanota.com', 'MUHAMMAD RIDWAN NAIM', 'Someplace', '08958273984', 'KOTA TANGERANG', 'KECAMATAN KARANG TENGAH', '15112'),
(8, 'teleconference@tangerangkota.go.id', 'SUGIONO', 'Someplace in the World', '081318094337', 'KOTA TANGERANG', 'KECAMATAN BATUCEPER', '15113');

-- --------------------------------------------------------

--
-- Table structure for table `tb_level`
--

CREATE TABLE `tb_level` (
  `level_id` int(10) UNSIGNED NOT NULL,
  `level` char(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_level`
--

INSERT INTO `tb_level` (`level_id`, `level`) VALUES
(1, 'admin'),
(3, 'user');

-- --------------------------------------------------------

--
-- Table structure for table `tb_menu`
--

CREATE TABLE `tb_menu` (
  `menu_id` int(10) UNSIGNED NOT NULL,
  `menu_label` char(255) NOT NULL,
  `menu_link` char(255) NOT NULL,
  `menu_icon` char(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_menu`
--

INSERT INTO `tb_menu` (`menu_id`, `menu_label`, `menu_link`, `menu_icon`) VALUES
(1, 'Dasboard', 'dashboard', ''),
(2, 'Manajemen User', 'manajemen-user', ''),
(3, 'Pengaturan Web', 'pengaturan-web', ''),
(4, 'Manajemen Artikel', 'manajemen-artikel', ''),
(5, 'Kategori', 'kategori', ''),
(6, 'Galeri', 'galeri', ''),
(7, 'Manajemen Akses', 'manajemen-akses', '');

-- --------------------------------------------------------

--
-- Table structure for table `tb_mitra`
--

CREATE TABLE `tb_mitra` (
  `id_mitra` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `nama_mitra` char(255) NOT NULL,
  `logo_mitra` char(255) NOT NULL,
  `date_regist` datetime NOT NULL,
  `alamat_mitra` varchar(255) NOT NULL,
  `email_mitra` char(255) NOT NULL,
  `website_mitra` char(255) DEFAULT NULL,
  `testimoni` varchar(512) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_mitra`
--

INSERT INTO `tb_mitra` (`id_mitra`, `user_id`, `nama_mitra`, `logo_mitra`, `date_regist`, `alamat_mitra`, `email_mitra`, `website_mitra`, `testimoni`) VALUES
(1, 2, 'Mitra A', 'logo.png', '2021-09-08 11:39:13', 'somewhere', 'mitra1@gmail.com', NULL, NULL),
(2, 2, 'Mitra B', 'logo.png', '2021-09-09 11:39:13', 'someplace', 'mitra2@gmail.com', NULL, NULL),
(3, 2, 'Mitra C', 'logo.png', '2021-10-06 11:49:08', 'somewhere', 'mitra3@gmail.com', NULL, NULL),
(4, 1, 'Mitra D', 'logo.png', '2021-10-20 11:49:13', 'someplace', 'mitra4@gmail.com', NULL, NULL),
(5, 1, 'Mitra E', 'logo.png', '2021-11-01 11:39:13', 'somewhere', 'mitra5@gmail.com', NULL, NULL),
(6, 1, 'Mitra F', 'logo.png', '2021-11-01 11:39:13', 'someplace', 'mitra6@gmail.com', NULL, NULL),
(7, 2, 'Mitra G', 'logo.png', '2021-12-23 11:39:13', 'somewhere', 'mitra7@gmail.com', NULL, NULL),
(8, 1, 'Mitra H', 'logo.png', '2021-12-31 06:39:13', 'someplace', 'mitra8@gmail.com', NULL, NULL),
(9, 2, 'Mitra I', 'logo.png', '2021-12-31 11:39:13', 'somewhere', 'mitra9@gmail.com', NULL, NULL),
(10, 2, 'Mitra J', 'logo.png', '2022-01-01 11:39:13', 'someplace', 'mitra10@gmail.com', NULL, NULL),
(11, 2, 'Mitra K', 'logo.png', '2022-01-03 11:39:13', 'somewhere', 'mitra11@gmail.com', NULL, NULL),
(12, 1, 'Mitra L', 'logo.png', '2022-01-03 06:39:13', 'someplace', 'mitra12@gmail.com', NULL, NULL),
(13, 1, 'Mitra M', 'logo.png', '2022-01-04 11:39:13', 'somewhere', 'mitra13@gmail.com', NULL, NULL),
(14, 1, 'Mitra N', 'logo.png', '2022-01-11 11:39:13', 'someplace', 'mitra14@gmail.com', NULL, NULL),
(15, 2, 'Mitra O', 'logo.png', '2022-01-26 11:39:13', 'somewhere', 'mitra15@gmail.com', NULL, NULL),
(16, 1, 'Mitra P', 'logo.png', '2022-01-31 06:39:13', 'someplace', 'mitra16@gmail.com', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tb_produk`
--

CREATE TABLE `tb_produk` (
  `id_produk` int(10) UNSIGNED NOT NULL,
  `nama_produk` char(255) NOT NULL,
  `klasifikasi` enum('colocation','hosting','vps','firewall','security audit') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_produk`
--

INSERT INTO `tb_produk` (`id_produk`, `nama_produk`, `klasifikasi`) VALUES
(1, 'Paket Colocation 1', 'colocation'),
(2, 'Paket Colocation 2', 'colocation'),
(3, 'Hosting Reguler', 'hosting'),
(4, 'Hosting Premium', 'hosting'),
(5, 'Hosting Super', 'hosting'),
(6, 'VPS Hore', 'vps'),
(7, 'VPS Gokil', 'vps'),
(8, 'VPS Ajib', 'vps'),
(9, 'Juniper', 'firewall'),
(10, 'Paket Pentesting', 'security audit'),
(11, 'Paket Forensik', 'security audit');

-- --------------------------------------------------------

--
-- Table structure for table `tb_produk_mitra`
--

CREATE TABLE `tb_produk_mitra` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_mitra` int(10) UNSIGNED NOT NULL,
  `id_produk` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_produk_mitra`
--

INSERT INTO `tb_produk_mitra` (`id`, `id_mitra`, `id_produk`) VALUES
(1, 1, 1),
(2, 1, 11);

-- --------------------------------------------------------

--
-- Table structure for table `tb_roles`
--

CREATE TABLE `tb_roles` (
  `role_id` int(11) NOT NULL,
  `level_id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_roles`
--

INSERT INTO `tb_roles` (`role_id`, `level_id`, `menu_id`) VALUES
(1, 1, 6),
(2, 1, 7),
(3, 1, 1),
(4, 1, 5),
(5, 1, 4),
(6, 1, 3),
(7, 1, 2),
(8, 3, 1),
(9, 3, 4),
(10, 3, 5),
(11, 3, 6);

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE `tb_user` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `nama` char(150) NOT NULL,
  `username` char(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` char(100) NOT NULL,
  `telepon` char(20) NOT NULL,
  `foto` char(255) NOT NULL,
  `status_akun` tinyint(1) NOT NULL,
  `level_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_user`
--

INSERT INTO `tb_user` (`user_id`, `nama`, `username`, `password`, `email`, `telepon`, `foto`, `status_akun`, `level_id`) VALUES
(1, 'Ridwan', 'ridwan', '$argon2id$v=19$m=16,t=2,p=1$TEtuRms5VmZsY1BBUzMzQQ$odDQ/jjukJIpkWWueF4kVA', 'muhammadridwannaim@gmail.com', '+627777777777', 'foto.jpg', 1, 1),
(2, 'Naim', 'naim', '$argon2id$v=19$m=16,t=2,p=1$TEtuRms5VmZsY1BBUzMzQQ$odDQ/jjukJIpkWWueF4kVA', 'mrnaeem@tutanota.com', '+62888888888', 'foto.jpg', 1, 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_artikel`
--
ALTER TABLE `tb_artikel`
  ADD PRIMARY KEY (`id_artikel`),
  ADD KEY `tb_user` (`user_id`),
  ADD KEY `tb_kategori` (`id_kategori`);

--
-- Indexes for table `tb_kategori`
--
ALTER TABLE `tb_kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `tb_kontak`
--
ALTER TABLE `tb_kontak`
  ADD PRIMARY KEY (`id_kontak`);

--
-- Indexes for table `tb_level`
--
ALTER TABLE `tb_level`
  ADD PRIMARY KEY (`level_id`);

--
-- Indexes for table `tb_menu`
--
ALTER TABLE `tb_menu`
  ADD PRIMARY KEY (`menu_id`);

--
-- Indexes for table `tb_mitra`
--
ALTER TABLE `tb_mitra`
  ADD PRIMARY KEY (`id_mitra`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `tb_produk`
--
ALTER TABLE `tb_produk`
  ADD PRIMARY KEY (`id_produk`);

--
-- Indexes for table `tb_produk_mitra`
--
ALTER TABLE `tb_produk_mitra`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_mitra` (`id_mitra`),
  ADD KEY `id_produk` (`id_produk`);

--
-- Indexes for table `tb_roles`
--
ALTER TABLE `tb_roles`
  ADD PRIMARY KEY (`role_id`),
  ADD KEY `level_id` (`level_id`),
  ADD KEY `menu_id` (`menu_id`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `level_id` (`level_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_artikel`
--
ALTER TABLE `tb_artikel`
  MODIFY `id_artikel` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tb_kategori`
--
ALTER TABLE `tb_kategori`
  MODIFY `id_kategori` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tb_kontak`
--
ALTER TABLE `tb_kontak`
  MODIFY `id_kontak` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tb_level`
--
ALTER TABLE `tb_level`
  MODIFY `level_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tb_menu`
--
ALTER TABLE `tb_menu`
  MODIFY `menu_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tb_mitra`
--
ALTER TABLE `tb_mitra`
  MODIFY `id_mitra` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `tb_produk`
--
ALTER TABLE `tb_produk`
  MODIFY `id_produk` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tb_produk_mitra`
--
ALTER TABLE `tb_produk_mitra`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_roles`
--
ALTER TABLE `tb_roles`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `user_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_artikel`
--
ALTER TABLE `tb_artikel`
  ADD CONSTRAINT `tb_kategori` FOREIGN KEY (`id_kategori`) REFERENCES `tb_kategori` (`id_kategori`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_user` FOREIGN KEY (`user_id`) REFERENCES `tb_user` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `tb_mitra`
--
ALTER TABLE `tb_mitra`
  ADD CONSTRAINT `tb_mitra_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tb_user` (`user_id`);

--
-- Constraints for table `tb_produk_mitra`
--
ALTER TABLE `tb_produk_mitra`
  ADD CONSTRAINT `tb_produk_mitra_ibfk_1` FOREIGN KEY (`id_mitra`) REFERENCES `tb_mitra` (`id_mitra`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_produk_mitra_ibfk_2` FOREIGN KEY (`id_produk`) REFERENCES `tb_produk` (`id_produk`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_roles`
--
ALTER TABLE `tb_roles`
  ADD CONSTRAINT `tb_roles_ibfk_1` FOREIGN KEY (`level_id`) REFERENCES `tb_level` (`level_id`),
  ADD CONSTRAINT `tb_roles_ibfk_2` FOREIGN KEY (`menu_id`) REFERENCES `tb_menu` (`menu_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD CONSTRAINT `tb_user_ibfk_1` FOREIGN KEY (`level_id`) REFERENCES `tb_level` (`level_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
