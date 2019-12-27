CREATE DATABASE turing;

USE turing;

CREATE TABLE karyawan (
id int(5) NOT NULL PRIMARY KEY AUTO_INCREMENT,
nama varchar(30) NOT NULL,
alamat varchar(50),
gaji int(10)
);

INSERT INTO turing.karyawan (id, nama, alamat, gaji) VALUES
(100, 'Arif', 'Surabaya',  10000),
(101, 'Andi', 'Jakarta',  14000),
(102, 'Burhan', 'Malam',  12000),
(103, 'Fikri', 'Madiun',  15000),
(104, 'Fariz', 'Malang',  17000),
(105, 'Sigit', 'Surabaya',  20000),
(106, 'Ifan', 'Kediri',  16000),
(107, 'Hanif', 'Yogjakarta',  12000),
(108, 'Zakiuddin', 'Surabaya',  21000);

SELECT id, nama, alamat FROM karyawan WHERE alamat='Surabaya';

SELECT nama, gaji FROM karyawan WHERE gaji > 15000;

SELECT nama FROM karyawan WHERE nama LIKE 'f%';

SELECT nama FROM karyawan WHERE nama LIKE '%f';

CREATE TABLE departemen(
ID_Dept int(5) NOT NULL AUTO_INCREMENT PRIMARY KEY,
Nama_Dept varchar(30) NOT NULL,
Lokasi varchar(50)
);

CREATE TABLE pegawai(
ID_Peg int(5) NOT NULL AUTO_INCREMENT PRIMARY KEY,
Nama varchar(30) NOT NULL,
Alamat varchar(50),
ID_Dept int(5) NOT NULL,
FOREIGN KEY (ID_Dept) REFERENCES Departemen(ID_Dept)
);

INSERT INTO departemen VALUES
(1000, 'Keuangan', 'Jakarta'),
(1001, 'Teknikal', 'Jakarta'),
(1002, 'Manajemen', 'Jakarta');

SELECT * FROM departemen;

INSERT INTO pegawai VALUES
(100, 'Andi', 'Jakarta', 1000),
(101, 'Budi', 'Surabaya', 1001),
(102, 'Lani', 'Surabaya', 1001),
(103, 'Vani', 'Jakarta', 1002),
(104, 'Dian', 'Jakarta', 1000);

SELECT * FROM pegawai;

UPDATE departemen SET Nama_Dept = 'Teknikal Support', Lokasi = 'Depok' WHERE ID_Dept = '1001';

SELECT * FROM departemen;

SELECT * FROM pegawai;

DELETE FROM pegawai WHERE Alamat = 'Surabaya';

SELECT * FROM pegawai;

SELECT p.Nama, p.Alamat, d.Nama_Dept AS 'Departemen'
FROM pegawai p INNER JOIN departemen d WHERE p.ID_Dept = d.ID_Dept AND p.Alamat = 'Jakarta';

CREATE TABLE Mahasiswa(
NRP varchar(5) NOT NULL PRIMARY KEY,
Nama varchar(30) NOT NULL,
Alamat varchar(50),
Hobby varchar(30)
);

CREATE TABLE MTKuliah(
Kode_MK varchar(5) NOT NULL PRIMARY KEY,
Nama_MK varchar(30) NOT NULL,
SKS int(3)
);

CREATE TABLE NilaiMHS(
NRP varchar(5) NOT NULL,
Kode_MK varchar(5) NOT NULL,
Nilai int(3),
FOREIGN KEY (NRP) REFERENCES Mahasiswa(NRP),
FOREIGN KEY (Kode_MK) REFERENCES MTKuliah(Kode_MK)
);

INSERT INTO Mahasiswa VALUES
(1000, 'Anton', 'Jakarta Selatan', 'Basket'),
(1001, 'Andi', 'Jakarta Selatan', 'Berenang'),
(1002, 'Anita', 'Bogor', 'Membaca'),
(1003, 'Bianca', 'Jakarta Utara', 'Badminton'),
(1004, 'Refa', 'Jakarta Pusat', 'Basket');

SELECT * FROM Mahasiswa;

INSERT INTO MTKuliah VALUES
('VT000', 'Pemrograman Go', 4),
('VT001', 'Database', 4),
('VT002', 'UI/UX', 2);

SELECT * FROM MTKuliah;

DELETE FROM NilaiMHS;

INSERT INTO NilaiMHS VALUES
(1000, 'VT000', 90), (1000, 'VT001', 80), (1000, 'VT002', 80),
(1001, 'VT000', 60), (1001, 'VT001', 90), (1001, 'VT002', 90),
(1002, 'VT000', 90), (1002, 'VT001', 90), (1002, 'VT002', 90),
(1003, 'VT000', 70), (1003, 'VT001', 80), (1003, 'VT002', 100),
(1004, 'VT000', 70), (1004, 'VT001', 80), (1004, 'VT002', 70);

SELECT * FROM NilaiMHS;

UPDATE NilaiMHS SET Nilai = 90 WHERE Kode_MK = 'VT000' AND NRP = 1004;

SELECT * FROM NilaiMHS;

DELETE FROM NilaiMHS WHERE Kode_MK = 'VT001';
DELETE FROM MTKuliah WHERE Kode_MK = 'VT001';

SELECT * FROM MTKuliah;

SELECT m.Nama, m.Alamat, mk.Nama_MK AS 'Mata Kuliah', mk.SKS, n.Nilai
FROM Mahasiswa m JOIN MtKuliah mk JOIN NilaiMHS n;