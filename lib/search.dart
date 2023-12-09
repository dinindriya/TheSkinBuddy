import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_4/DetailTop.dart';
import 'package:flutter_application_4/appbar.dart';
import 'package:flutter_application_4/bottomnav.dart';
import 'package:flutter_application_4/model/Products.dart';
import 'package:flutter_application_4/model/viewmodels/fetch_data_products.dart';

class ScrollingScreen2 extends StatefulWidget {
  const ScrollingScreen2({Key? key}) : super(key: key);
  @override
  _ScrollingScreenState createState() => _ScrollingScreenState();
}

class _ScrollingScreenState extends State<ScrollingScreen2> {
  int _currentIndex = 2;
  Repository repo = Repository();
  String _searchQuery = '';
  late List<Products> _allProducts;
  late List<Products> _filteredProducts;

  @override
  void initState() {
    super.initState();
    _allProducts = []; // Initialize with your actual data
    _filteredProducts = _allProducts;
    _loadData();
  }

  List<Products> _shuffleProducts(List<Products> products) {
    var random = Random();
    List<Products> shuffledProducts = List.from(products);
    shuffledProducts.shuffle(random);
    return shuffledProducts;
  }

  Future<void> _loadData() async {
    _allProducts = await repo.fetchDataPlaces();
    _allProducts = _shuffleProducts(_allProducts);
    _filteredProducts = _allProducts;
    setState(() {});
  }

  void _filterProducts(String query) {
    setState(() {
      _searchQuery = query;
      _filteredProducts = repo.filterProducts(_allProducts, _searchQuery);
      print("Filtered Products: $_filteredProducts");
    });
  }

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
              child: TextField(
                onChanged: _filterProducts,
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
                EdgeInsets.fromLTRB(16, 20, 16, 8), // Padding sesuai kebutuhan
            child: Text(
              "Products You Search for",
              style: TextStyle(
                  fontSize: 20, // Ukuran font
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w900),
            ),
          ),
          Container(
            child: FutureBuilder<List<dynamic>>(
                future: _searchQuery.isEmpty
                    ? Future.value(_shuffleProducts(_allProducts))
                    : Future.value(_shuffleProducts(_filteredProducts)),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data.length,

                        // Mengatur shrinkWrap menjadi true
                        physics:
                            NeverScrollableScrollPhysics(), // Menghilangkan kemampuan scroll
                        itemBuilder: (BuildContext context, int index) {
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
