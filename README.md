# TREE TRUNK DETECTOR
![image](https://github.com/user-attachments/assets/627217b6-292e-4656-941d-ac4661284d03)
Tree Trunk Detector adalah sebuah program yang bertujuan untuk menghitung jumlah tumpukan kayu yang sangat banyak. Hal ini dapat mempermudah perusahaan menghitung jumlah kayu. Tujuan dari pengembangan sistem deteksi kayu pohon adalah memberikan solusi dalam mengatasi permasalahan pemantauan jumlah pohon pada tahap pengumpulan bahan baku. Dengan memanfaatkan teknologi deteksi visual, sistem ini bertujuan untuk menggantikan metode perhitungan manual yang rentan terhadap kesalahan dan memakan waktu. Dengan kemampuan mendeteksi jumlah batang pohon secara otomatis, aplikasi ini diharapkan dapat memberikan informasi yang cepat, akurat, dan reliabel kepada para pekerja industri produksi kertas dan sektor industri lainnya yang memiliki kebutuhan serupa, mendorong adopsi teknologi yang lebih efisien dan inovatif dalam proses mereka. 


# Tools
Tools yang akan digunakan adalah matlab yang menghasilkan sebuah program dengan tampilan GUI.

# Tahapan
1. Memilih gambar
   Memilih gambar kayu pohon yang ingin dianalisis. Gambar ini akan digunakan sebagai input utama untuk sistem pendeteksian lingkar kayu pohon.
2. Memotong (crop) gambar
   Setelah gambar dipilih, gambar akan dipotong sesuai area tertentu dari gambar untuk memastikan hanya bagian yang relevan yang dianalisis. Hal ini membantu meningkatkan akurasi dalam proses pendeteksian.
3. Cek Hasil
   Setelah gambar dipotong sesuai kebutuhan, pengguna menekan tombol ‘Cek Hasil’. Tombol ini berfungsi sebagai pemicu untuk memulai proses analisis dan pendeteksian lingkar kayu pohon oleh sistem.
4. Melakukan preprocessing gambar
   Sistem pertama-tama melakukan tahapan preprocessing, yaitu serangkaian teknik pengolahan awal pada gambar untuk mempersiapkannya sebelum analisis dilakukan. Preprocessing menerapkan filter gaussian untuk mengurangi noise.
5. Melakukan pendeteksian tepi (edge detection)
   Setelah preprocessing, sistem menerapkan metode pendeteksian tepi menggunakan operator Canny, untuk menyoroti garis dan bentuk dalam gambar. Tepi-tepi ini penting untuk mengenali pola lingkaran yang menjadi indikator jumlah lingkar kayu.
6. Menampilkan hasil
   Lingkar kayu yang berhasil dideteksi diberi tanda dengan viscircle (lingkaran warna merah) kemudian ditampilkan dan jumlah lingkaran yang terdeteksi ditampilkan di layar.

