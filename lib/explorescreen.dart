import 'package:flutter/material.dart';
import 'package:flutter_application_4/DetailExplore.dart';
import 'package:flutter_application_4/appbar.dart';
import 'package:flutter_application_4/bottomnav.dart';
import 'package:flutter_application_4/model/Explore.dart';
import 'package:flutter_application_4/profile2.dart';
import 'homescreen.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}
class _ExploreScreenState extends State<ExploreScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    int _currentIndex = 1;
    return Scaffold(
        appBar: AppBarWidget(),
      bottomNavigationBar: BottomNavigationWidget(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });}, context: context,),
        backgroundColor: Color.fromRGBO(236, 238, 229, 1), //
        
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
