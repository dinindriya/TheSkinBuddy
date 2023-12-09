// bottom_navigation.dart

import 'package:flutter/material.dart';
import 'package:flutter_application_4/explorescreen.dart';
import 'package:flutter_application_4/homescreen.dart';
import 'package:flutter_application_4/profile2.dart';
import 'package:flutter_application_4/search.dart';

class BottomNavigationWidget extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  final BuildContext context;

  BottomNavigationWidget({
    required this.currentIndex,
    required this.onTap,
    required this.context,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed, // Mengatur tipe menjadi fixed
      selectedItemColor:
          const Color.fromRGBO(162, 170, 123, 1), // Warna ikon yang dipilih
      unselectedItemColor: Colors.grey, // Warna ikon yang tidak dipilih
      currentIndex:
          currentIndex, // Indeks item yang aktif saat pertama kali ditampilkan
      onTap: (index) {
        if (index == 0) {
          // Indeks 1 adalah "Explore"
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  ScrollingScreen(),
            ),
          );
        }
        if (index == 1) {
          // Indeks 1 adalah "Explore"
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  ExploreScreen(),
            ),
          );
        }
        if (index == 2) {
          // Indeks 2 adalah "search"
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  ScrollingScreen2(),
            ),
          );
        }
        if (index == 3) {
          // Indeks 3 adalah "profile"
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  Profile2(),
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
          icon: Icon(Icons.search),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
      unselectedLabelStyle: TextStyle(
        fontFamily: 'Poppins-Regular', // Menggunakan font 'Poppins' untuk label
        fontSize: 12, 
        // Cetak tebal
      ),
    );
  }
}
