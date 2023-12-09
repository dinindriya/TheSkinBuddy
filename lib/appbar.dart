import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: Color.fromRGBO(236, 238, 229, 1),
      leading: IconButton(
        icon: Icon(Icons.menu),
        color: Colors.black,
        onPressed: () {
          // Aksi yang ingin Anda tambahkan ketika ikon menu ditekan.
        },
      ),
      title: Image.asset(
        'assets/image/logo2.png',
        width: 120,

        // Adjust width and height as needed
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
    );
  }@override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
