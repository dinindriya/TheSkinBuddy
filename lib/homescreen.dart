import 'package:flutter/material.dart';
import 'package:flutter_application_4/DetailLike.dart';
import 'package:flutter_application_4/DetailTop.dart';
import 'package:flutter_application_4/model/LikeProducts.dart';
import 'package:flutter_application_4/model/TopProducts.dart';
import 'explorescreen.dart';

class ScrollingScreen extends StatelessWidget {
  const ScrollingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed, // Mengatur tipe menjadi fixed
          selectedItemColor:
              const Color.fromRGBO(162, 170, 123, 1), // Warna ikon yang dipilih
          unselectedItemColor: Colors.grey, // Warna ikon yang tidak dipilih
          currentIndex:
              0, // Indeks item yang aktif saat pertama kali ditampilkan
          onTap: (index) {
            if (index == 1) {
              // Indeks 1 adalah "Explore"
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      explorescreen(),
                ),
              );
            }
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

        body: ListView(children: [
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
                    hintText: 'Search Products',
                    hintStyle: TextStyle(fontFamily: 'Poppins', fontSize: 14),
                    prefixIcon: Icon(Icons.search),
                    border: InputBorder.none),
                cursorColor: Color.fromRGBO(54, 57, 41, 1),
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft, // Mengatur teks ke kiri
            padding:
                EdgeInsets.fromLTRB(16, 10, 16, 8), // Padding sesuai kebutuhan
            child: Text(
              "Top 5 Products ⭐",
              style: TextStyle(
                fontSize: 20, // Ukuran font
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Container(
            height: 367,
            child: ListView(
                scrollDirection: Axis.horizontal,
                children: TopProductsList.map((top) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(236, 238, 229, 1),
                        shadowColor: Colors.transparent),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return DetailTop(place: top);
                      }));
                    },
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(4, 8, 0, 20),
                      child: Container(
                        width: 250,
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
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              top.image, // Gantilah dengan path gambar yang sesuai
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    top.brand,
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    top.name,
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    top.desc,
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 12,
                                      color: Colors.black,
                                    ),
                                  ),
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
          Container(
            alignment: Alignment.centerLeft, // Mengatur teks ke kiri
            padding:
                EdgeInsets.fromLTRB(16, 0, 16, 8), // Padding sesuai kebutuhan
            child: Text(
              "Products You May Like",
              style: TextStyle(
                fontSize: 16, // Ukuran font
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            height: 550,
            child: ListView(
                shrinkWrap: true, // Mengatur shrinkWrap menjadi true
                physics:
                    NeverScrollableScrollPhysics(), // Menghilangkan kemampuan scroll
                children: LikeProductsList.map((like) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(236, 238, 229, 1),
                        shadowColor: Colors.transparent),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return DetailLike(
                          placelike: like,
                        );
                      }));
                    },
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(2, 4, 2, 6),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              like.image,
                              height: 88,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                // color: Colors.amber,
                                width: 200,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      like.brand,
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      like.name,
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      like.desc,
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 11,
                                          color: Colors.grey),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList()),
          ),
        ]));
  }
}
