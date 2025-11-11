# EVAN HARYO WIDODO, 2406435824, PBP A

# Tugas - 7
## Widget Tree pada Flutter
- Widget adalah suatu elemen atau komponen representasi visual (user interface) yang dibangun oleh Flutter
- Setiap komponen visual pada Flutter dapat dikatakan sebagai widget
- Maka dari itu, akibatnya, widget-widget itu dapat terstuktur secara hierarkis yang menghadirkan konsep widget tree
- Widget tree sendiri adalah representasi logika dari keseluruhan widget
- Melalui konsep tree ini, widget yang terbungkus dalam widget lainnya akan menghadirkan role parent dan child pada tree tersebut
- Sebagai contoh,
    - Container(child: Column()); Container di sini adalah widget dan Column adalah widget. Oleh sebab itu, Container bertindak sebagai parent dari widget Column dan Column merupakan widget child dari Container.

## Hubungan Parent dan Child
- Dalam contoh Container(child: Column()), maka parent (Container) akan mengontrol layout dan posisi child. Maka dari itu, Column akan mengikuti semua arahan atau perubahan yang diinisiasi oleh Container (parent).
- Contoh lainnya,
  - Container(child: Text("halo"), padding: EdgeInsets.all(16.0)), container berperan sebagai parent dan Text sebagai child; Maka, Text akan mengisi konten dari Container, serta container mengatur bahwa childnya akan memiliki padding sebesar 16.0 untuk top, right, bottom, dan left.

## Widget yang digunakan pada tugas ini
- **Scaffold** --> kerangka utama halaman flutter dengan Material design yang berfungsi membagi struktur halaman, seperti appBar dan body
- **Container** --> widget yang umumnya digunakan untuk membungkus suatu komponen widget lainnya dengan kelebihan dapat mengatur padding, margin, ukuran, dan color 
- **Padding** --> widget yang dapat berfungsi, seperti Container dengan memberikan padding di dalamnya
- **Column** --> widget yang mengatur posisi widget childnya secara vertikal
- **Row** --> widget yang mengatur posisi widget childnya secara horizontal
- **Text** --> widget untuk menampilkan suatu teks / tulisan
- **Center** --> widget untuk menempatkan widget childnya di posisi tengah dari suatu halaman
- **GridView** --> widget untuk menampilkan setiap widget childrennya secara baris dan kolom
- **Material** --> basic widget surface bawaan dari Material Design yang dapat dimodifikasi
- **InkWell** --> widget yang mendeteksi adanya event tapping yang dilakukan oleh User ke suatu widget childnya
- **Icon** --> widget yang menampilkan icon dari material UI library
- **Snackbar** --> widget yang menampilkan temporary message di bagian bawah layar
- **ScaffoldMessenger** --> widget yang mengatur / mengelola kapan Snackbar tampil

## Fungsi dari widget MaterialApp
- MaterialApp sebagai pembungkus widget utama berfungsi untuk menerapkan suatu aplikasi akan mengikuti design dari bawaan Material UI library. Lalu, ia juga memberikan berbagai konfigurasi, seperti navigation route, tema aplikasi, dan juga pengaturan judul. MaterialApp sering digunakan sebagai pembungkus utama karena menyediakan berbagai komponen dari material UI, dapat mengatur navigasi halaman, memudahkan konfigurasi tema aplikasi, dan rata-rata sistem operasi mobile phone (Android / IOS) mendukung design dengan Material UI.

## Perbedaan Stateless dan Stateful Widget
- Stateless widget adalah widget yang menampilkan suatu state secara konstan / statis / tidak berubah sehingga tidak ada event yang dapat mempengaruhi kondisi state dari widget tersebut. Contoh implementasinya adalah penampilan suatu tulisan dengan widget Text.
- Stateful widget adalah widget yang menampilkan suatu state secara dinamis / state dapat berubah sesuai adanya kondisi / event tertentu. Contoh implementasinya adalah counter integer yang mana ketika user menekan button increment akan terdapat perubahan di suatu state widget.

## BuildContext
BuildContext adalah suatu objek yang merepresentasikan lokasi suatu widget dalam widget tree sehingga  Flutter mengetahui hubungan setiap widget dan widget child dengan BuildContext itu dapat mengakses setiap informasi yang terdapat pada parentnya. Cara implementasi BuildContext pada metode build adalah diletakkan pada parameter fungsi build dan memberikan variabel setelah BuildContext sebagai variabel yang dapat mengakses segala informasi dari BuildContext.

## Hot Reload dan Hot Restart
- Hot reload adalah operasi yang memperbarui perubahan kode ke dalam aplikasi tanpa memuat ulang aplikasi dari awal sehingga setiap state yang sudah mengalami perubahan sebelumnya tidak akan mengalami reset
- Hot restart adalah operasi yang memuat ulang seluruh aplikasi dari awal sehingga setiap perubahan tetap dapat terjadi dengan kondisi state akan mengalami reset.
- Maka dari itu, perbedaannya terletak pada hot reload yang mempertahankan state dan hot restart yang mengabaikan state yang sedang berlangsung. Lalu, hot reload umumnya digunakan ketika ada pembaharuan UI, sedangkan hot restart dilakukan ketika terdapat perubahan pada struktur main / root aplikasi.

# Tugas - 8
## Perbedaan Navigator.push() dan Navigator.pushReplacement()
Salah satu widget untuk navigasi di flutter adalah menggunakan Navigator. Widget ini memiliki konsep, seperti struktur data Stack atau tumpukan. Maka dari itu, Navigator menerapkan konsep LIFO (Last In First Out).

Metode untuk menginputkan suatu page / halaman ke dalam navigasi adalah diantaranya, .push() dan .pushReplacement(). Metode .push() berfungsi untuk menambahkan halaman baru di atas halaman sebelumnya, sedangkan .pushReplacement() berfungsi untuk mengganti halaman saat ini, yang sedang diakses, dengan halaman baru. Maka, halaman yang sebelumnya diakses akan hilang / tidak ditumpuk dengan halaman baru.

## Cara memanfaatkan hierarchy widget untuk membangun struktur halaman yang konsisten
- Setiap halaman pada folder screens, saya menerapkan Scaffold untuk membangun struktur dari halaman tersebut
- Di dalam Scaffold, saya menerapkan adanya appBar (seperti header halaman), drawer (seperti sidebar), dan body (isi konten)
- Setiap appBar akan inherit warna background / theme dari root context dengan tipe primary
- Implementasi drawer setiap halaman akan inisiasi kelas yang sama, yakni LeftDrawer (yang sudah terlebih dahulu saya buat di folder widgets)


## Kelebihan layout widget, seperti Padding, SingleChildScrollView, dan ListView
- **Padding** 
    - Widget yang berguna untuk mengatur jarak dalam sehingga widget anaknya dapat terlihat proporsional
    - Contoh penggunaanya adalah pada pembuatan setiap input Form menggunakan widget padding untuk membedakan form inputnya yang juga terikat sebagai children dari Column

- **SingleChildScrollView** 
    - Widget yang memungkinkan user untuk melakukan scrolling atau penggeseran terhadap konten yang tingginya melebihi batas. 
    - Saya mengimplementasikannya pada halaman pengisian form karena jika widget input formnya semakin banyak, maka user dapat melakukan scrolling ke atas.

- **ListView**
    - Widget yang digunakan untuk menampilkan daftar suatu item yang banyak dan tidak perlu menggunakan layouting dengan Column untuk mengatasi elemen widget child yang begitu banyak. Implementasi widget ini, saya lakukan di drawer karena umumnya drawer memiliki elemen navigasi yang banyak (diwakili dengan ListTile) dan setiap drawer memiliki header penamaannya.

## Cara saya menyesuaikan warna tema agar aplikasi memiliki identitas visual yang konsisten
- Membuat file bernama goalin_colors.dart pada folder lib/utils untuk menampung / membuat dictionary yang berisi kumpulan warna utama yang saya gunakan
- Mengimplementasikan warna-warna dari file tersebut pada setiap halaman dengan mengakses value berdasarkan key dari dictionary tersebut
- Selain itu, saya juga menggunakan Theme.of(context).colorScheme.primary pada setiap header halaman sehingga warnanya akan konsisten dengan root / parent utama.

