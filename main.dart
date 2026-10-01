//Cek dulu pembelinya dapet diskon berapa persen
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
// 2. Ngitung jumlah uang potongannya dari persenan di atas
double hitungPotongan(double diskon, double totalBelanja) {
  double potongan = diskon * totalBelanja;
  
  // Sesuai aturan toko, maksimal potongannya cuma mentok di 25.000, gak boleh lebih
  if (potongan >= 25000){
    return 25000;
  }
  return potongan;
}
// 3. Ngitung total akhir uang yang harus dibayar pembeli
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