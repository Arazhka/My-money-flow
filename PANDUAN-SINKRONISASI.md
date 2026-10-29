# Panduan sinkronisasi antar perangkat (Supabase)

Tanpa langkah ini, data hanya tersimpan di browser masing-masing perangkat. Dengan Supabase (paket gratis; cek syarat terbarunya di situs mereka), akun Sakura dan Fuji bisa dibuka dari perangkat mana pun dan perubahan muncul langsung di semua perangkat yang sedang membuka akun yang sama.

## 1. Buat proyek
1. Daftar di https://supabase.com, lalu buat **New project** (pilih region terdekat, misalnya Singapore) dan catat kata sandi database-nya.
2. Tunggu proyek selesai dibuat.

## 2. Buat tabel
1. Buka **SQL Editor > New query**.
2. Tempel seluruh isi `supabase-setup.sql`, lalu klik **Run**.

## 3. Matikan konfirmasi email
Aplikasi memakai nama (bukan email asli), jadi konfirmasi email harus mati.
1. Buka **Authentication**, lalu bagian **Sign In / Providers** (atau Providers) dan pilih **Email**.
2. Matikan **Confirm email**, lalu simpan.

## 4. Salin alamat dan kunci
1. Buka **Project Settings > API** (atau API Keys).
2. Salin **Project URL** dan kunci publik (**anon** atau **publishable**).
3. Jangan salin kunci `service_role` / secret. Kunci itu tidak boleh ada di website.

## 5. Isi config.js
Di GitHub, buka `config.js`, klik ikon pensil, isi `url` dan `key`, lalu **Commit changes**. Tunggu 1-3 menit sampai GitHub Pages memperbarui website.

## 6. Pakai
- Buka website, pilih Sakura atau Fuji, lalu **Buat akun** (nama + kata sandi minimal 6 karakter). Data lama di perangkat Anda ikut terunggah saat akun dibuat.
- Teman Anda membuka link yang sama, memilih halaman yang sama, lalu **Masuk** dengan nama dan kata sandi yang sama. Mereka melihat isi yang sama, dan tambah/ubah/hapus tampil langsung di kedua perangkat.

## Catatan keamanan
- Siapa pun yang tahu nama dan kata sandi suatu akun bisa melihat dan mengubah datanya. Orang yang tidak tahu hanya bisa membuat akun baru dengan buku kosong sendiri; mereka tidak bisa melihat data akun lain (dijaga aturan Row Level Security di database).
- Kata sandi disimpan terenkripsi oleh Supabase. Karena memakai alamat email buatan, tidak ada fitur "lupa kata sandi" lewat email; pemilik proyek bisa mengatur ulang kata sandi lewat dashboard Supabase (Authentication > Users).
- Kunci publik di `config.js` memang boleh terlihat; yang melindungi data adalah aturan RLS dari `supabase-setup.sql`. Jangan lewatkan langkah 2.
