import 'package:flutter/material.dart';
import 'explorescreen.dart';
import 'homescreen.dart';
import 'model/Explore.dart';

class DetailExplore extends StatelessWidget {
  final Explore placeexplore;
  const DetailExplore({Key? key, required this.placeexplore});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed, // Mengatur tipe menjadi fixed
          selectedItemColor:
              const Color.fromRGBO(162, 170, 123, 1), // Warna ikon yang dipilih
          unselectedItemColor: Colors.grey, // Warna ikon yang tidak dipilih
          currentIndex:
              1, // Indeks item yang aktif saat pertama kali ditampilkan
          onTap: (index) {
            if (index == 0) {
              // Indeks 1 adalah "Explore"
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ScrollingScreen()));
            }
            if (index == 1) {
              // Indeks 1 adalah "Explore"
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => explorescreen()));
            }
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
                fontWeight: FontWeight.w700, // Menggunakan font Poppins
                fontSize: 14,
                color: Colors.black // Mengatur cetak tebal
                ),
          ),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                  Icons.notifications_none_sharp), // Menggunakan font Poppins),
              color: Colors.black,
              onPressed: () {
                // Aksi yang ingin Anda tambahkan ketika ikon notifikasi ditekan.
              },
            ),
          ],
        ),
        body: ListView(
          children: [
            Image.asset(
              placeexplore.image,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    placeexplore.title,
                    style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                    child: Row(
                      children: [
                        Row(
                          children: [
                            SizedBox(width: 8),
                            Row(
                              children: [
                                Icon(
                                  Icons.remove_red_eye_rounded,
                                  size: 24,
                                  color: Color.fromRGBO(162, 170, 123, 1),
                                ),
                                Text(
                                  placeexplore.views,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Poppins',
                                      color: Color.fromRGBO(162, 170, 123, 1)),
                                )
                              ],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(Icons.favorite_outlined,
                                size: 20, color: Colors.red),
                            Text(
                              placeexplore.likes,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Poppins',
                                  color: Color.fromRGBO(162, 170, 123, 1)),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 2, 20, 2),
              child: Text(
                textAlign: TextAlign.justify,
                placeexplore.text,
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 14,
                ),
              ),
            )
          ],
        ));
  }
}
