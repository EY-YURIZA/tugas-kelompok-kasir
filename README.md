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


| Skenario Uji | Total Belanja | Status Member | Persen Diskon | Perhitungan Nominal | Batas Maks (25rb) | Harga Final (Bayar) |
| :---: | :--- | :---: | :---: | :--- | :--- | :--- |
| **1** | Rp 80.000 | `false` | 0% | 0 × 80.000 = Rp 0 | Tidak kena batas | **80000.0** |
| **2** | Rp 150.000 | `false` | 10% | 0.10 × 150.000 = Rp 15.000 | Aman | **135000.0** |
| **3** | Rp 150.000 | `true` | 15% | 0.15 × 150.000 = Rp 22.500 | Aman | **127500.0** |
| **4** | Rp 300.000 | `true` | 15% | 0.15 × 300.000 = Rp 45.000 | Terkena batas (jadi 25k) | **275000.0** |


// Pertama Cek dulu pembelinya dapet diskon berapa persen
double hitungPersenDiskon(double totalBelanja, bool membership){
  // Kalo belanja 100rb ke atas dan dia punya kartu member, dapet diskon 15% (10% + tambahan 5%)
  if (totalBelanja >= 100000 && membership == true) {
    return 0.15;
  }
  // Kalo belanjanya 100rb ke atas tapi bukan member, dapetnya 10% aja
  if (totalBelanja >= 100000 && membership == false) {
    return 0.10;
  }
  // Kalo belanjanya di bawah 100rb, gak dapet diskon sama sekali
  return 0;
}

// Kedua  Ngitung jumlah uang potongannya dari persenan di atas
double hitungPotongan(double diskon, double totalBelanja) {
  double potongan = diskon * totalBelanja;
  
  // Sesuai aturan toko, maksimal potongannya cuma mentok di 25.000, gak boleh lebih
  if (potongan >= 25000){
    return 25000;
  }
  return potongan;
}

// Ketiga Ngitung total akhir uang yang harus dibayar pembeli
double hitungTotalBayar(double totalBelanja, bool membership){
  
  // Panggil fungsi diskon buat nyari persenannya
  double persen = hitungPersenDiskon(totalBelanja, membership);
  
  // Panggil fungsi potongan buat nyari nominal uang potongannya
  double potongan = hitungPotongan(persen, totalBelanja);

  // Harga belanjaan asli tinggal dikurangin sama potongannya
  double totalBayar = totalBelanja - potongan;

  return totalBayar;
}

void main() {
  // Langsung print semuanya 
  print(hitungTotalBayar(80000,false));
  print(hitungTotalBayar(150000,false));
  print(hitungTotalBayar(150000,true));
  print(hitungTotalBayar(300000,true));
}