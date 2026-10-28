# Saccoin – Catatan Pengeluaran

Aplikasi web satu halaman untuk mencatat pengeluaran bulanan, bertema Jepang (sakura atau salju Gunung Fuji).

## Fitur
- Modal bulanan ("modal bulan ini bos") sebagai dasar pengurangan pengeluaran
- Kategori otomatis dari keterangan (warteg, bensin, listrik, stockbit, kos, dan lainnya), bisa diubah manual
- Pie chart jenis pengeluaran, grafik pengeluaran per hari, dan tabel rincian
- Tambah, edit, dan hapus pengeluaran
- Dua buku catatan terpisah: Sakura (pink dan putih) dan Fuji (biru langit dan putih). Modal dan pengeluaran keduanya tidak saling terhubung

## Cara menjalankan
Buka `index.html` di browser. Tidak perlu instalasi. Perlu internet untuk memuat font Google dan Chart.js.

## Upload ke GitHub dan buka sebagai website
1. Buat repository baru di GitHub, misalnya `saccoin`.
2. Klik **Add file > Upload files**, unggah `index.html` dan `README.md`, lalu **Commit changes**.
3. Buka **Settings > Pages**, pada *Build and deployment* pilih **Deploy from a branch**, branch `main`, folder `/ (root)`, lalu **Save**.
4. Tunggu sekitar satu menit. Alamatnya: `https://NAMA-GITHUB-ANDA.github.io/saccoin/`

## Catatan
Data tersimpan di browser (localStorage) pada perangkat yang dipakai, tidak di server. Data tidak berpindah antar perangkat dan hilang jika data browser dihapus.

## Kompatibilitas
Berjalan di browser modern: Chrome, Safari, Edge, dan Firefox pada Windows, macOS (MacBook), iPhone (iOS), dan Android. Di HP, pilih **Tambahkan ke Layar Utama** agar bisa dibuka seperti aplikasi.

## Efek suara
Bunyi koin dibuat langsung di browser, jadi tidak butuh file. Ikon speaker di header untuk menyalakan atau mematikan suara. Jika Anda punya file suara sendiri yang boleh dipakai, simpan dengan nama `money.mp3` di folder yang sama dengan `index.html`; file itu akan diputar saat membuka halaman Sakura atau Fuji.
