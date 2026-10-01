# Tugas Kelompok: Sistem Kasir Toko Kelontong

### Identitas Kelompok
| No | Nama Anggota |
| :-: | :--- |
| 1 | Muhammad Miftahul Ulum |
| 2 | Aditya Ramadhan Khiang |

---

### 1. Ketentuan Diskon Toko (Business Rules)
Logika dasar yang kita pakai buat nentuin potongan harga di toko kelontong ini:

| Kode | Aturan Perhitungan |
| :--- | :--- |
| **BR-01** | Kalau total belanjaan pembeli nyampe Rp 100.000 atau lebih, otomatis dapet diskon 10%. |
| **BR-02** | Kalau dia punya status member (`true`), dapet tambahan diskon 5% lagi, jadi totalnya 15%. |
| **BR-03** | Batas maksimal potongan uangnya dikunci mentok di angka Rp 25.000 saja. |

### 2. Analisis Data Masuk & Keluar
Variabel yang kita pakai di dalam program:

| Jenis Data | Nama Variabel | Tipe Data | Keterangan |
| :--- | :--- | :---: | :--- |
| **Input** | `totalBelanja` | `double` | Nominal uang belanjaan awal dari pembeli. |
| **Input** | `membership` | `bool` | Status keanggotaan (`true` jika member, `false` jika biasa). |
| **Output**| `hitungTotalBayar` | `double` | Hasil akhir uang bersih yang harus dibayar kasir. |

### 3. Pemecahan Fungsi (Decomposition)
Biar kodenya gampang dibaca dan nggak numpuk, kita bagi jadi 3 fungsi terpisah:

| Nama Fungsi | Penjelasan Alur Kerja |
| :--- | :--- |
| `hitungPersenDiskon` | Ngecek total belanjaan sama status member buat nentuin pembeli dapet diskon 0.15, 0.10, atau 0. |
| `hitungPotongan` | Mengubah persenan diskon jadi bentuk nominal rupiah, sekaligus ngecek biar nggak lewat dari batas 25rb. |
| `hitungTotalBayar` | Menggabungkan fungsi sebelumnya untuk mengurangi harga belanjaan awal dengan nominal potongan. |

### 4. Alur Logika Program (Algoritma)
Langkah-langkah program saat dijalankan:

| Tahapan | Proses Sistem |
| :---: | :--- |
| **1** | Masukin nilai `totalBelanja` dan status `membership` ke dalam fungsi utama. |
| **2** | Program ngecek syarat belanja (apakah >= 100rb) dan status member (`true`/`false`). |
| **3** | Menghitung nominal potongan uang dari hasil kali persen diskon dengan total belanja. |
| **4** | Validasi batas maksimal: jika hasil potongan >= 25.000, maka dipaksa balikkan nilai 25.000. |
| **5** | Total belanja awal dikurangi dengan nominal potongan, lalu kembalikan hasilnya. |
| **6** | Tampilkan hasil akhir lewat fungsi `print` di `main()`. |

### 5. Flowchart Logika Program

```text
[ MULAI ]
    |
    v
( Masukkan: totalBelanja & membership )
    |
    v
[ Cek: Apakah totalBelanja >= 100.000 & membership == true? ]
    |-- ( YA ) ---> Kembalikan Diskon 0.15 (15%)
    |
    v ( TIDAK )
[ Cek: Apakah totalBelanja >= 100.000 & membership == false? ]
    |-- ( YA ) ---> Kembalikan Diskon 0.10 (10%)
    |
    v ( TIDAK )
[ Kembalikan Diskon 0 (Tidak dapet) ]
    |
    v
[ Hitung: potongan = diskon * totalBelanja ]
    |
    v
[ Apakah potongan >= 25.000? ]
    |-- ( YA ) ---> Batasi potongan jadi 25.000
    |
    v ( TIDAK / Aman )
[ Hitung: totalBayar = totalBelanja - potongan ]
    |
    v
( Cetak hasil lewat print() )
    |
    v
[ SELESAI ]