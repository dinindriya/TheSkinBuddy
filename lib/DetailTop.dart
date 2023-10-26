import 'package:flutter/material.dart';
import 'package:flutter_application_4/model/TopProducts.dart';

class DetailTop extends StatelessWidget {
  final TopProducts place;
  const DetailTop({Key? key, required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Mengatur tipe menjadi fixed
        selectedItemColor:
            const Color.fromRGBO(162, 170, 123, 1), // Warna ikon yang dipilih
        unselectedItemColor: Colors.grey, // Warna ikon yang tidak dipilih
        currentIndex: 0, // Indeks item yang aktif saat pertama kali ditampilkan
        onTap: (index) {
          // Aksi yang ingin Anda tambahkan ketika salah satu ikon navigasi ditekan
          // Anda dapat menambahkan penanganan navigasi di sini
          // Misalnya, mengganti tampilan halaman berdasarkan indeks yang dipilih.
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        unselectedLabelStyle: TextStyle(
          fontFamily: 'Poppins', // Menggunakan font 'Poppins' untuk label
          fontSize: 12, // Ukuran font
          fontWeight: FontWeight.bold, // Cetak tebal
        ),
      ),
      backgroundColor: Color.fromRGBO(236, 238, 229, 1), //
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color.fromRGBO(236, 238, 229, 1),
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // Tambahkan ikon back di sini
          color: Colors.black,
          onPressed: () {
            Navigator.pop(
                context); // Saat tombol back ditekan, kembali ke halaman sebelumnya
          },
        ),
        title: Text(
          "The SkinBuddy",
          style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold, // Menggunakan font Poppins
              fontSize: 14,
              color: Colors.black // Mengatur cetak tebal
              ),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications_none_outlined),
            color: Colors.black,
            onPressed: () {
              // Aksi yang ingin Anda tambahkan ketika ikon notifikasi ditekan.
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 4),
              Container(
                child: Container(
                  width: 500, // Ganti dengan lebar yang sesuai
                  height: 300, // Ganti dengan tinggi yang sesuai
                  child: Image.asset(
                    place.image,
                    fit: BoxFit
                        .cover, // Gambar akan mengisi Container tanpa mengubah rasio aspek
                  ),
                ),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: const Color.fromARGB(255, 185, 184, 184)
                            .withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset:
                            Offset(0, 0.5) // Perubahan bayangan pada sumbu Y
                        ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(42, 12, 42, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      place.brand,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      place.name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "Poppins",
                        ),
                        place.long

                        // "Suitable for oily skin and sensitive skin, this gentle and lightweight moisturizer provides hydration without clogging pores or causing irritation."
                        )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
