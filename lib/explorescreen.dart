import 'package:flutter/material.dart';
import 'package:flutter_application_4/DetailExplore.dart';
import 'package:flutter_application_4/model/Explore.dart';
import 'homescreen.dart';

class explorescreen extends StatelessWidget {
  const explorescreen({super.key});

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
            icon: Icon(Icons.menu),
            color: Colors.black,
            onPressed: () {
              // Aksi yang ingin Anda tambahkan ketika ikon menu ditekan.
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
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 8, 12, 10),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 185, 184, 184)
                          .withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 4,
                      offset: Offset(0, 0.5), // Perubahan bayangan pada sumbu Y
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: TextField(
                  decoration: InputDecoration(
                      prefixIconColor: Color.fromRGBO(54, 57, 41, 1),
                      hintText: 'Search Articles',
                      hintStyle: TextStyle(fontFamily: 'Poppins', fontSize: 14),
                      prefixIcon: Icon(Icons.search),
                      border: InputBorder.none),
                  cursorColor: Color.fromRGBO(54, 57, 41, 1),
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft, // Mengatur teks ke kiri
              padding: EdgeInsets.fromLTRB(
                  20, 10, 16, 8), // Padding sesuai kebutuhan
              child: Text(
                "Headline Today ✨",
                style: TextStyle(
                  fontSize: 20, // Ukuran font
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Container(
              height: 1360,
              child: ListView(
                  shrinkWrap: true, // Mengatur shrinkWrap menjadi true
                  physics:
                      NeverScrollableScrollPhysics(), // Menghilangkan kemampuan scroll
                  children: ExploreList.map((explore) {
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(236, 238, 229, 1),
                          shadowColor: Colors.transparent),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return DetailExplore(
                            placeexplore: explore,
                          );
                        }));
                      },
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 8),
                        child: Container(
                          width: 600,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: const Color.fromARGB(255, 185, 184, 184)
                                    .withOpacity(0.1),
                                spreadRadius: 2,
                                blurRadius: 4,
                                offset: Offset(
                                    0, 0.5), // Perubahan bayangan pada sumbu Y
                              ),
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 500, // Lebar kontainer
                                height: 140, // Tinggi kontainer
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(
                                          20)), // Radius sudut bulat
                                  child: Image.asset(
                                    explore
                                        .image, // Gantilah dengan path gambar yang sesuai
                                    fit: BoxFit
                                        .cover, // Membuat gambar sesuai dengan kontainer
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      explore.title,
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 4),
                                      child: Row(
                                        children: [
                                          Row(
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons
                                                        .remove_red_eye_rounded,
                                                    size: 24,
                                                    color: Color.fromRGBO(
                                                        162, 170, 123, 1),
                                                  ),
                                                  Text(
                                                    explore.views,
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontFamily: 'Poppins',
                                                        color: Color.fromRGBO(
                                                            162, 170, 123, 1)),
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Icon(Icons.favorite_rounded,
                                                  size: 18, color: Colors.red),
                                              Text(
                                                explore.likes,
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontFamily: 'Poppins',
                                                    color: Color.fromRGBO(
                                                        162, 170, 123, 1)),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList()),
            ),
          ],
        ));
  }
}
