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


### 5. Simulasi & Verifikasi Uji Kasus (Trace Table)

| Kasus Uji | Total Belanja | Membership | Persen Diskon | Perhitungan Awal | Batas Maks (Rp 25.000) | Potongan Akhir | Total Bayar |
| :---: | :--- | :---: | :---: | :--- | :--- | :--- | :--- |
| **Kasus 1** | Rp 80.000 | `false` | 0 | 0 × 80.000 = 0 | Tidak terkena batas | Rp 0 | Rp 80.000 |
| **Kasus 2** | Rp 150.000 | `false` | 10 | 0.10 × 150.000 = 15.000 | Belum capai batas | Rp 15.000 | Rp 135.000 |
| **Kasus 3** | Rp 150.000 | `true` | 15 | 0.15 × 150.000 = 22.500 | Belum capai batas | Rp 22.500 | Rp 127.500 |
| **Kasus 4** | Rp 300.000 | `true` | 15 | 0.15 × 300.000 = 45.000 | Kena batas ≥ 25.000 | Rp 25.000 | Rp 275.000 |



### 6. Flowchart Logika Program

```text
[ MULAI ]
    |
    v
( Input: Total Belanja & Status Member )
    |
    v
[ Apakah Total Belanja >= 100.000? ]
    |-- (TIDAK) ---------------------> Diskon = 0%
    |                                      |
    v (YA)                                 |
[ Apakah Status Member = True? ]           |
    |-- (TIDAK) -> Diskon = 10%            |
    |                  |                   |
    v (YA)             |                   |
Diskon = 15%           |                   |
    |                  |                   |
    +------------------+-------------------+
    | (Semua alur diskon kumpul di sini)
    v
[ Hitung: Potongan = Diskon x Total Belanja ]
    |
    v
[ Apakah Potongan > 25.000? ]
    |-- (YA) ----> Potongan dipaksa jadi 25.000
    |                  |
    v (TIDAK)          |
    |                  |
    +------------------+
    |
    v
[ Hitung: Total Bayar = Total Belanja - Potongan ]
    |
    v
( Tampilkan Harga Final ke Layar )
    |
    v
[ SELESAI ]

