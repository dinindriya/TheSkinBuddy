import 'package:flutter/material.dart';
import 'package:flutter_application_4/bottomnav.dart';
import 'model/Products.dart';
import 'model/viewmodels/fetch_data_products.dart';

class DetailTop extends StatefulWidget {
  final Products place;

  const DetailTop({Key? key, required this.place}) : super(key: key);

  @override
  _DetailTopState createState() => _DetailTopState();
}

class _DetailTopState extends State<DetailTop> {
  Repository repo = Repository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      bottomNavigationBar: BottomNavigationWidget(
        currentIndex: 0, // Set the current index accordingly
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
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                widget.place.image,
                fit: BoxFit.cover,
              ),
            ),
            iconTheme: IconThemeData(color: Colors.black),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(32, 12, 42, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.place.brand,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    widget.place.name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "${widget.place.price}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.green,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    widget.place.long,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontFamily: "Poppins",
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
