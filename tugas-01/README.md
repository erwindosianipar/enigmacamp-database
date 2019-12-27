```
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

SELECT * FROM karyawan;
```
# Soal 01
## 1. Tampilkan data ID dan nama yang berdomisili di Surabaya.
```
SELECT id, nama, alamat FROM karyawan WHERE alamat='Surabaya';
```
![Menampilkan data](/images/soal01-01.png)

## 2. Tampilkan nama yang gajinya diatas 15000
```
SELECT nama FROM karyawan WHERE gaji > 15000;
```
![Menampilkan data](/images/soal01-02.png)

## 3. Tampilkan nama yang berawalan huruf F
```
SELECT nama FROM karyawan WHERE nama LIKE 'f%';
```
![Menampilkan data](/images/soal01-03.png)

## 4. Tampilkan nama yang berakhiran f
```
SELECT nama FROM karyawan WHERE nama LIKE '%f';
```
![Menampilkan data](/images/soal01-04.png)

# Soal 02

**Pertama buat tabel Departemen**
```
CREATE TABLE departemen(
ID_Dept int(5) NOT NULL AUTO_INCREMENT PRIMARY KEY,
Nama_Dept varchar(30) NOT NULL,
Lokasi varchar(50)
);
```
*Primary Key di tabel Departemen akan digunakan sebagai Foreign Key di tabel Pegawai*

**Selanjutnya buat tabel Pegawai**
```
CREATE TABLE pegawai(
ID_Peg int(5) NOT NULL AUTO_INCREMENT PRIMARY KEY,
Nama varchar(30) NOT NULL,
Alamat varchar(50),
ID_Dept int(5) NOT NULL,
FOREIGN KEY (ID_Dept) REFERENCES Departemen(ID_Dept)
);
```
*ID_Dept adalah Foreign Key yang akan digunakan sebagai rujukan/referensi ke tabel Departemen*

## 1. Menambahkan data di tabel Pegawai
*Sebelum melakukan penambahan data di tabel Pegawai, kita harus  mempunyai data di tabel Departemen terlebih dahulu agar di tabel Pegawai memiliki referensi ke tabel Departemen*

**Menambah data di tabel Departemen**
```
INSERT INTO departemen VALUES
(1000, 'Keuangan', 'Jakarta'),
(1001, 'Teknikal', 'Jakarta'),
(1002, 'Manajemen', 'Jakarta');
```
![Menambahkan data](/images/soal02-01a.png)

**Selanjutnya menambah data Pegawai**
```
INSERT INTO pegawai VALUES
(100, 'Andi', 'Jakarta', 1000),
(101, 'Budi', 'Surabaya', 1001),
(102, 'Lani', 'Surabaya', 1001),
(103, 'Vani', 'Jakarta', 1002),
(104, 'Dian', 'Jakarta', 1000);
```
![Menambahkan data](/images/soal02-01b.png)


## 2. Mengedit data di tabel Departemen
```
UPDATE departemen SET Nama_Dept = 'Teknikal Support', Lokasi = 'Depok' WHERE ID_Dept = '1001'
```
![Mengupdate data](/images/soal02-02.png)

## 3. Delete data di tabel Pegawai yang beralamat di Surabaya
```
DELETE FROM pegawai WHERE Alamat = 'Surabaya';
```
![Delete data](/images/soal02-03.png)

## 4. Tampilkan data Nama dan alamat pegawai dan nama departemen yang berdomisili di jakarta
```
SELECT p.Nama, p.Alamat, d.Nama_Dept AS 'Departemen' FROM pegawai p INNER JOIN departemen d WHERE p.ID_Dept = d.ID_Dept AND p.Alamat = 'Jakarta'; 
```
![Menampilkan data](/images/soal02-04.png)


# Soal 03

**Membuat tabel Mahasiswa**
```
CREATE TABLE Mahasiswa(
NRP varchar(5) NOT NULL PRIMARY KEY,
Nama varchar(30) NOT NULL,
Alamat varchar(50),
Hobby varchar(30)
);
```
**Membuat tabel Mata Kuliah**
```
CREATE TABLE MTKuliah(
Kode_MK varchar(5) NOT NULL PRIMARY KEY,
Nama_MK varchar(30) NOT NULL,
SKS int(3)
);
```
** Membuat tabel Nilai Mahasiswa***
```
CREATE TABLE NilaiMHS(
NRP varchar(5) NOT NULL,
Kode_MK varchar(5) NOT NULL,
Nilai int(3),
FOREIGN KEY (NRP) REFERENCES Mahasiswa(NRP),
FOREIGN KEY (Kode_MK) REFERENCES MTKuliah(Kode_MK)
);
```
*NRP adalah Foreign Key yang akan mereferensi dari tabel Nilai ke tabel Mahasiswa*
*Kode_MK adalah Foreign Key yang akan mereferensi dari tabel Nilai ke tabel Mata Kuliah*

## 1. Menambahkan data di tabel mahasiswa, nilaiMHS dan MtKuliah

**Menambah data tabel Mahasiswa**
```
INSERT INTO Mahasiswa VALUES
(1000, 'Anton', 'Jakarta Selatan', 'Basket'),
(1001, 'Andi', 'Jakarta Selatan', 'Berenang'),
(1002, 'Anita', 'Bogor', 'Membaca'),
(1003, 'Bianca', 'Jakarta Utara', 'Badminton'),
(1004, 'Refa', 'Jakarta Pusat', 'Basket');
```
![Menampilkan data](/images/soal03-01a.png)

**Menambah data tabel Mata Kuliah**
```
INSERT INTO MTKuliah VALUES
('VT000', 'Pemrograman Go', 4),
('VT001', 'Database', 4),
('VT002', 'UI/UX', 2);
```
![Menampilkan data](/images/soal03-01b.png)

**Menambah data tabel Nilai Mahasiswa**
```
INSERT INTO NilaiMHS VALUES
(1000, 'VT000', 90), (1000, 'VT001', 80), (1000, 'VT002', 80),
(1001, 'VT000', 60), (1001, 'VT001', 90), (1001, 'VT002', 90),
(1002, 'VT000', 90), (1002, 'VT001', 90), (1002, 'VT002', 90),
(1003, 'VT000', 70), (1003, 'VT001', 80), (1003, 'VT002', 100),
(1004, 'VT000', 70), (1004, 'VT001', 80), (1004, 'VT002', 70);
```
![Menampilkan data](/images/soal03-01c.png)

# 2. Mengedit data di tabel NilaiMHS
```
UPDATE NilaiMHS SET Nilai = 90 WHERE Kode_MK = 'VT000' AND NRP = 1004
```
![Menampilkan data](/images/soal03-02.png)

# 3. Delete data di tabel MtKuliah yang berkode VT001

**Untuk melakukan delete data pada tabel mata kuliah, data yang ada pada tabel Nilai harus dihapus juga karena tabel Nilai memiliki referensi ke tabel Mata Kuliah**

**Delete data pada tabel NilaiMHS**
```
DELETE FROM NilaiMHS WHERE Kode_MK = 'VT001';
```
**Delete data pada tabel Mata Kuliah**
```
DELETE FROM MTKuliah WHERE Kode_MK = 'VT001';
```
![Menampilkan data](/images/soal03-03.png)


# Tampilkan data Nama dan alamat mahasiwa, nama mata kuliah, SKS dan nilainya.
```
SELECT m.Nama, m.Alamat, mk.Nama_MK AS 'Mata Kuliah', mk.SKS, n.Nilai FROM Mahasiswa m JOIN MtKuliah mk JOIN NilaiMHS n;
```
![Menampilkan data](/images/soal03-04.png)