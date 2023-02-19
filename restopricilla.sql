-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 05 Agu 2022 pada 23.40
-- Versi server: 10.4.20-MariaDB
-- Versi PHP: 7.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `restopricilla`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `menu`
--

CREATE TABLE `menu` (
  `idMenu` int(11) NOT NULL,
  `nmMenu` char(50) NOT NULL,
  `harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `menu`
--

INSERT INTO `menu` (`idMenu`, `nmMenu`, `harga`) VALUES
(1, 'Nasi Goreng', 20000),
(2, 'Bebek Bakar', 25000),
(3, 'Es Kopi', 8000),
(4, 'jus jambu', 8000),
(5, 'soto betawi', 12000),
(6, 'bakso mercon', 10000),
(7, 'lumpia basah', 3000),
(8, 'sop buntut', 38000),
(9, 'capcay kuah', 12000),
(10, 'es duren', 5000),
(11, 'pudding mangga', 5000),
(12, 'sate usus', 5000),
(13, 'kwetiau seafood', 19000),
(14, 'cumi goreng', 29000),
(15, 'gurame asam manis', 40000),
(16, 'sayur lodeh', 12000),
(17, 'soto lamongan', 19000),
(18, 'wedang jahe', 5000),
(19, 'coca cola', 8000),
(20, 'ayam rica-rica', 38000),
(21, 'zupa sup', 18000),
(22, 'roti goreng', 10000),
(23, 'nasi kuning komplit', 20000),
(24, 'nasi uduk komplit', 2000),
(25, 'lele goreng', 7000),
(26, 'paket tahu tempe', 12000),
(27, 'ayam sambal matah', 25000),
(28, 'mie ayam', 18000),
(29, 'siomay batagor', 12000),
(30, 'tumis kangkung', 9000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

CREATE TABLE `pelanggan` (
  `idPelanggan` int(11) NOT NULL,
  `nmPelanggan` varchar(255) NOT NULL,
  `jk` char(10) NOT NULL,
  `noHP` char(13) NOT NULL,
  `alamat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pelanggan`
--

INSERT INTO `pelanggan` (`idPelanggan`, `nmPelanggan`, `jk`, `noHP`, `alamat`) VALUES
(1, 'chiquita', 'Perempuan', '0896340480', 'bekasi'),
(2, 'reno', 'Laki-Laki', '0846472038', 'jakarta'),
(3, 'rainer', 'Laki-Laki', '0856543865', 'depok'),
(4, 'alden', 'laki-laki', '0837584263', 'bogor'),
(5, 'anita', 'perempuan', '0837254823', 'cawang'),
(6, 'gloria', 'perempuan', '0897364782', 'jatiwaringin'),
(7, 'raul', 'laki-laki', '0827883468', 'cikarang'),
(8, 'fano', 'laki-laki', '0825374683', 'kalimalang'),
(9, 'resta', 'perempuan', '0897652656', 'kranggan'),
(10, 'aviva', 'perempuan', '0897864623', 'cibubur'),
(21, '', 'Laki-Laki', '', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pesanan`
--

CREATE TABLE `pesanan` (
  `idPesanan` int(11) NOT NULL,
  `idMenu` int(11) NOT NULL,
  `idPelanggan` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pesanan`
--

INSERT INTO `pesanan` (`idPesanan`, `idMenu`, `idPelanggan`, `jumlah`) VALUES
(1, 1, 1, 2),
(4, 6, 5, 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `idTransaksi` int(11) NOT NULL,
  `idPesanan` int(11) NOT NULL,
  `idPelanggan` int(11) NOT NULL,
  `nmMenu` char(55) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `bayar` int(11) NOT NULL,
  `kembalian` int(11) NOT NULL,
  `status` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`idTransaksi`, `idPesanan`, `idPelanggan`, `nmMenu`, `jumlah`, `harga`, `total`, `bayar`, `kembalian`, `status`) VALUES
(13, 1, 1, 'Nasi Goreng', 2, 20000, 40000, 100000, 60000, 'Paid'),
(14, 4, 5, 'bakso mercon', 2, 10000, 20000, 50000, 30000, 'Paid');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `idUser` int(11) NOT NULL,
  `nmUser` char(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `lvl` char(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`idUser`, `nmUser`, `password`, `lvl`) VALUES
(1, 'admin', '123', 'ADM'),
(2, 'waiter', '123', 'WAIT'),
(3, 'kasir', '123', 'KSR'),
(4, 'owner', '123', 'OWN');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`idMenu`);

--
-- Indeks untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`idPelanggan`);

--
-- Indeks untuk tabel `pesanan`
--
ALTER TABLE `pesanan`
  ADD PRIMARY KEY (`idPesanan`),
  ADD KEY `idMenu` (`idMenu`),
  ADD KEY `idPelanggan` (`idPelanggan`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`idTransaksi`),
  ADD KEY `idPesanan` (`idPesanan`),
  ADD KEY `idPelanggan` (`idPelanggan`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`idUser`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `menu`
--
ALTER TABLE `menu`
  MODIFY `idMenu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `idPelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT untuk tabel `pesanan`
--
ALTER TABLE `pesanan`
  MODIFY `idPesanan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `idTransaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `idUser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
