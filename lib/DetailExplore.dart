import 'package:flutter/material.dart';
import 'appbar.dart'; // Import widget app bar
import 'bottomnav.dart'; // Import widget bottom navigation
import 'model/Explore.dart';

class DetailExplore extends StatefulWidget {
  final Explore placeexplore;
  const DetailExplore({Key? key, required this.placeexplore}) : super(key: key);

  @override
  _DetailExploreState createState() => _DetailExploreState();
}

class _DetailExploreState extends State<DetailExplore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationWidget(
        currentIndex: 1, // Set the current index accordingly
        onTap: (index) {
          // Handle navigation based on the index if needed
        },
        context: context,
      ),
      backgroundColor: Color.fromRGBO(236, 238, 229, 1),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 460,
            backgroundColor: Colors.transparent,
            centerTitle: true,
            title: Image.asset(
              'assets/image/logo2.png',
              width: 120,
              // Adjust width and height as needed
            ), // App bar tetap terpasang di atas ketika digulir ke atas
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                widget.placeexplore.image,
                fit: BoxFit.cover,
              ),
            ),
            iconTheme: IconThemeData(color: Colors.black),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.placeexplore.title,
                        style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                        ),
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
                                      widget.placeexplore.views,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'Poppins',
                                        color: Color.fromRGBO(162, 170, 123, 1),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(Icons.favorite_outlined,
                                    size: 20, color: Colors.red),
                                Text(
                                  widget.placeexplore.likes,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Poppins',
                                    color: Color.fromRGBO(162, 170, 123, 1),
                                  ),
                                ),
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
                    widget.placeexplore.text,
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
