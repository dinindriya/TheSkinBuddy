import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_4/DetailTop.dart';
import 'package:flutter_application_4/appbar.dart';
import 'package:flutter_application_4/bottomnav.dart';
import 'package:flutter_application_4/model/viewmodels/fetch_data_products.dart';

class ScrollingScreen extends StatefulWidget {
  const ScrollingScreen({Key? key}) : super(key: key);

  @override
  _ScrollingScreenState createState() => _ScrollingScreenState();
}

class _ScrollingScreenState extends State<ScrollingScreen> {
  int _currentIndex = 0; // Add this line
  String _truncateWithEllipsis(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    }

    // Find the last space within the maxLength
    int lastSpace = text.substring(0, maxLength).lastIndexOf(' ');

    // If no space is found, truncate at maxLength
    if (lastSpace == -1) {
      return '${text.substring(0, maxLength)}...';
    }

    // Truncate at the last space
    return '${text.substring(0, lastSpace)}...';
  }

  @override
  Widget build(BuildContext context) {
    FirebaseAuth _auth = FirebaseAuth.instance;
    Repository repo = Repository();
    return Scaffold(
        bottomNavigationBar: BottomNavigationWidget(
          currentIndex: _currentIndex,
          onTap: (index) {
            // Handle navigation item tap
            setState(() {
              _currentIndex = index;
            });
          },
          context: context,
        ),
        appBar: AppBarWidget(),
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
            ),
          ),
          Container(
            alignment: Alignment.centerLeft, // Mengatur teks ke kiri
            padding:
                EdgeInsets.fromLTRB(16, 10, 16, 8), // Padding sesuai kebutuhan
            child: Text(
              "Top 5 Products ⭐",
              style: TextStyle(
                  fontSize: 25, // Ukuran font
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w900),
            ),
          ),
          Container(
            height: 365,
            child: FutureBuilder<List<dynamic>>(
              future: repo.fetchDataPlaces(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.all(10),
                      itemCount: min(5, snapshot.data.length),
                      // itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromRGBO(236, 238, 229, 1),
                              shadowColor: Colors.transparent),
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return DetailTop(place: snapshot.data[index]);
                            }));
                          },
                          child: Container(
                            height: 500,
                            width: 260,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      const Color.fromARGB(255, 185, 184, 184)
                                          .withOpacity(0.1),
                                  spreadRadius: 2,
                                  blurRadius: 4,
                                  offset: Offset(0,
                                      0.5), // Perubahan bayangan pada sumbu Y
                                ),
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: 235,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20.0),
                                      topRight: Radius.circular(20.0),
                                    ),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20.0),
                                      topRight: Radius.circular(20.0),
                                    ),
                                    child: Image.network(
                                      snapshot.data[index].image,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        snapshot.data[index].brand,
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        snapshot.data[index].name.length > 30
                                            ? '${snapshot.data[index].name.substring(0, 28)}'
                                            : snapshot.data[index].name,
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          // fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(height: 2),
                                      Text(
                                        snapshot.data[index].desc.length > 10
                                            ? '${snapshot.data[index].desc.substring(0, 60)}...'
                                            : snapshot.data[index].desc,
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
                        );
                      });
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
          Container(
            alignment: Alignment.centerLeft, // Mengatur teks ke kiri
            padding:
                EdgeInsets.fromLTRB(16, 20, 16, 8), // Padding sesuai kebutuhan
            child: Text(
              "Products You May Like 💖",
              style: TextStyle(
                  fontSize: 20, // Ukuran font
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w900),
            ),
          ),
          Container(
            child: FutureBuilder<List<dynamic>>(
                future: repo.fetchDataPlaces(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    int startIndex = 5;
                    int endIndex = 25;
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: min(
                            endIndex - startIndex + 1,
                            snapshot.data
                                .length), // Mengatur shrinkWrap menjadi true
                        physics:
                            NeverScrollableScrollPhysics(), // Menghilangkan kemampuan scroll
                        itemBuilder: (BuildContext context, int index) {
                          index += startIndex;
                          return ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Color.fromRGBO(236, 238, 229, 1),
                                shadowColor: Colors.transparent),
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                // return Container();
                                return DetailTop(
                                  place: snapshot.data[index],
                                );
                              }));
                            },
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(2, 4, 2, 6),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        bottomLeft: Radius.circular(10),
                                      ), // Menyesuaikan dengan borderRadius Container
                                      child: Image.network(
                                        snapshot.data[index].image,
                                        height: 100,
                                        width: 100,
                                        fit: BoxFit
                                            .cover, // Penting untuk memastikan gambar terisi di dalam ClipRRect
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        width: 255,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              snapshot.data[index].brand,
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w900,
                                                fontSize: 15,
                                                color: Colors.black,
                                              ),
                                            ),
                                            Text(
                                              snapshot.data[index].name,
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontSize: 12,
                                                color: Colors.black,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              (snapshot.data[index].desc
                                                          .length >
                                                      100)
                                                  ? '${_truncateWithEllipsis(snapshot.data[index].desc, 50)}'
                                                  : snapshot.data[index].desc,
                                              style: TextStyle(
                                                fontFamily: 'Poppins-Regular',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12,
                                                color: Colors.grey,
                                              ),
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
                        });
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                }),
          ),
        ]));
  }
}
