--Buat Database TokoRetailDB--
 CREATE DATABASE TokoRetaiLDB;

 --Gunakan DB TokoRetailDB
 USE TokoRetailDB;

 --Membuat tabel KategoriProduk
  CREATE TABLE KategoriProduk (
	KategoriID INT IDENTITY(1,1) PRIMARY KEY,
	NamaKategori VARCHAR(100) NOT NULL UNIQUE
 );

 --Membuat Tabel Produk
 CREATE TABLE Produk(
	ProdukID INT IDENTITY(1001, 1) PRIMARY KEY,
		SKU VARCHAR(20) NOT NULL UNIQUE,
		NamaProduk VARCHAR(100) NOT NULL, 
		Harga DECIMAL(10, 2) NOT NULL,
		Stok INT NOT NULL,
		KategoriID INT NULL,


--Harganya gaboleh negatif
 CONSTRAINT CHK_HargaPositif CHECK (Harga >= 0),
--Stoknya gaboleh negatif
 CONSTRAINT CHK_StokPositif CHECK (Stok >= 0),
--Relasikan dengan tabel KategoriProduk mmelalui KategoriID
 CONSTRAINT FK_Produk_Kategori
	FOREIGN KEY (KategoriID)
	REFERENCES KategoriProduk(KategoriID)
);

--Memasukkan data ke tabel KategoriProduk
INSERT INTO KategoriProduk (NamaKategori)
VALUES 
('Eletronik');

INSERT INTO KategoriProduk (NamaKategori)
VALUES 
('Pakaian'),
('Buku');

--Menampilkan tabel KategoriProduk
SELECT *
FROM KategoriProduk;

--Menampilkan tabel NamaProduk
SELECT NamaKategori
FROM KategoriProduk;

--Menambahkan data ke tabel produk
INSERT INTO Produk (SKU, NamaProduk, Harga, Stok, KategoriID)
VALUES
('ELEC-001', 'Laptop gaming', 1500000.00, 50, 2);


INSERT INTO Produk (SKU, NamaProduk, Harga, Stok, KategoriID)
VALUES
('ELEC-002', 'HP gaming', 50000000.00, 50, 1);

--Menampilkan tabel Produk
SELECT *
FROM Produk;

--Mengubah data stok laptop gaming menjadi 30
UPDATE Produk 
SET Stok = 30
WHERE ProdukID = 1001;

--Menghapus data HP gaming
BEGIN TRANSACTION 

DELETE FROM Produk 
WHERE ProdukID = 1002;

--Cek apakah sudah terhapus atau belum
SELECT *
FROM Produk;

COMMIT TRANSACTION

--Menambah data lagi ke tabel produk
INSERT INTO Produk (SKU, NamaProduk, Harga, Stok, KategoriID)
VALUES
('BAJU-001', 'Kaos Putih', 50000.00, 30, 2);

INSERT INTO Produk (SKU, NamaProduk, Harga, Stok, KategoriID)
VALUES
('BAJU-002', 'Kaos Hitam', 50000.00, 30, 2);

--Menghapus kaos putih
BEGIN TRAN;

DELETE FROM Produk
WHERE ProdukID = 1003;

ROLLBACK TRANSACTION;

COMMIT TRANSACTION;