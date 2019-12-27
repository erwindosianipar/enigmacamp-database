-- -----------------------------------------------------
-- Schema showroom
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema showroom
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `showroom` DEFAULT CHARACTER SET utf8 ;
USE `showroom` ;
-- -----------------------------------------------------
-- Table `showroom`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `showroom`.`customer` (
  `id_customer` INT NOT NULL AUTO_INCREMENT,
  `no_identitas` VARCHAR(16) NOT NULL,
  `nama` VARCHAR(32) NOT NULL,
  `alamat` VARCHAR(50),
  `telepon` VARCHAR(15),
  PRIMARY KEY (`id_customer`)
);

-- -----------------------------------------------------
-- Table `showroom`.`detail_mobil`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `showroom`.`detail_mobil` (
  `id_detail_mobil` INT NOT NULL AUTO_INCREMENT,
  `nomor_mesin` VARCHAR(10),
  `Merek` VARCHAR(50),
  `tahun_rakit` YEAR,
  `warna` VARCHAR(30),
  PRIMARY KEY (`id_detail_mobil`)
);

-- -----------------------------------------------------
-- Table `showroom`.`mobil`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `showroom`.`mobil` (
  `id_mobil` INT NOT NULL AUTO_INCREMENT,
  `nama` VARCHAR(30) NOT NULL,
  `nomor_polisi` VARCHAR(10) NULL,
  `harga` INT NULL,
  `id_detail_mobil` INT NOT NULL,
  PRIMARY KEY (`id_mobil`),
  CONSTRAINT `fk_mobil_detail_mobil`
    FOREIGN KEY (`id_detail_mobil`)
    REFERENCES `showroom`.`detail_mobil` (`id_detail_mobil`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `showroom`.`tipe_pembayaran`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `showroom`.`tipe_pembayaran` (
  `id_tipe` INT NOT NULL AUTO_INCREMENT,
  `nama` VARCHAR(30) NULL,
  `bunga` INT NULL,
  PRIMARY KEY (`id_tipe`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `showroom`.`transaksi`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `showroom`.`transaksi` (
  `id_transaksi` INT NOT NULL AUTO_INCREMENT,
  `tanggal` DATE NULL,
  `lunas` TINYINT NULL,
  `id_tipe_pembayaran` INT NOT NULL,
  `id_customer` INT NOT NULL,
  `id_mobil` INT NOT NULL,
  `total_pembayaran` INT NULL,
  PRIMARY KEY (`id_transaksi`),
  CONSTRAINT `fk_transaksi_tipe_pembayaran1`
    FOREIGN KEY (`id_tipe_pembayaran`)
    REFERENCES `showroom`.`tipe_pembayaran` (`id_tipe`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_transaksi_customer1`
    FOREIGN KEY (`id_customer`)
    REFERENCES `showroom`.`customer` (`id_customer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_transaksi_mobil1`
    FOREIGN KEY (`id_mobil`)
    REFERENCES `showroom`.`mobil` (`id_mobil`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SELECT * FROM customer;

SELECT * FROM mobil;

SELECT * FROM detail_mobil;

SELECT * FROM tipe_pembayaran;

SELECT * FROM transaksi;

INSERT INTO customer VALUES
(1, '123123123', 'Andi Budianto', 'Jakarta Selatan', '081200001111'),
(2, '123123777', 'Daniel Budiman', 'Jakarta Utara', '081300012431'),
(3, '123123890', 'Riani Wijaya', 'Jakarta Selatan', '081200003452');

INSERT INTO detail_mobil VALUES
(1, 'SZ-0001', 'Suzuki', 2018, 'Silver'),
(2, 'TY-0001', 'Toyota', 2018, 'Silver'),
(3, 'SMK-0001', 'Esemka', 2019, 'Putih');

INSERT INTO mobil VALUES
(1, 'Suzuki Expander', 'B 1234 KIJ', 150000000, 1),
(2, 'Toyota Kijang Rusa', 'B 6789 SAP', 130000000, 2),
(3, 'Esemka v1.0', 'B 345 FKU', 100000000, 3);

INSERT INTO tipe_pembayaran VALUES
(1, 'Cash', 0),
(2, 'Kredit 12 bulan', 0.05),
(3, 'Kredit 60 bulan', 0.2);

INSERT INTO transaksi VALUES
(1, '2019-12-25', 1, 1, 1, 1, 150000000),
(2, '2019-12-26', 0, 2, 2, 2, 10000000),
(3, '2019-12-27', 0, 3, 3, 3, 5000000),
(4, '2019-12-29', 1, 2, 2, 2, 3000000);

-- Menampilkan detail mobil
SELECT m.nama, dm.merek, dm.nomor_mesin, dm.warna, m.nomor_polisi, dm.tahun_rakit, m.harga
FROM mobil m INNER JOIN detail_mobil dm ON m.id_detail_mobil = dm.id_detail_mobil;

-- Menampilkan transaksi / invoice
SELECT t.id_transaksi, t.tanggal, dm.merek, m.nama, m.nomor_polisi, t.lunas, tp.nama,
m.harga, t.total_pembayaran, c.id_customer, c.nama, c.alamat, c.telepon
FROM transaksi t INNER JOIN customer c INNER JOIN tipe_pembayaran tp INNER JOIN mobil m INNER JOIN detail_mobil dm
ON t.id_customer = c.id_customer AND t.id_tipe_pembayaran = tp.id_tipe AND t.id_mobil = m.id_mobil
AND m.id_detail_mobil = dm.id_detail_mobil;
