import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_4/appbar.dart';
import 'package:flutter_application_4/bottomnav.dart';
import 'package:flutter_application_4/service/firebase_auth_service.dart';
import 'package:flutter_application_4/login.dart';

class Profile2 extends StatefulWidget {
  @override
  _Profile2State createState() => _Profile2State();
}

class _Profile2State extends State<Profile2> {
  final FirebaseAuthService _authService = FirebaseAuthService();

  String _extractNickname(String email) {
    int atIndex = email.indexOf('@');
    return atIndex != -1 ? email.substring(0, atIndex) : email;
  }

  Future<void> _showLogoutConfirmationDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Logout Confirmation'),
          content: Text('Are you sure you want to logout?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss the dialog
              },
              child: Text('Cancel',
                  style: TextStyle(color: Color.fromRGBO(162, 170, 123, 1))),
            ),
            TextButton(
              onPressed: () async {
                await _authService.signOut();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              },
              child: Text(
                'Logout',
                style: TextStyle(color: Color.fromRGBO(162, 170, 123, 1)),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    int _currentIndex = 3;
    User? currentUser = _authService.getCurrentUser();

    return Scaffold(
      appBar: AppBarWidget(),
      bottomNavigationBar: BottomNavigationWidget(
        currentIndex: 3, // Set the current index accordingly
        onTap: (index) {
          // Handle navigation item tap
          setState(() {
            _currentIndex = index;
          });
        },
        context: context,
      ),
      backgroundColor: Color.fromRGBO(236, 238, 229, 1),
      body: Center(
        child: currentUser != null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Hi, ${_extractNickname(currentUser.email ?? "No email")} !',
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16.0),
                  CircleAvatar(
                    radius: 75,
                    backgroundImage: AssetImage('assets/image/article2.png'),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    '${currentUser.email ?? "No email"}',
                    style: TextStyle(fontSize: 18, fontFamily: "Poppins"),
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(162, 170, 123, 1),
                    ),
                    onPressed: () => _showLogoutConfirmationDialog(context),
                    child: Text(
                      'Logout',
                      style: TextStyle(fontSize: 14, fontFamily: "Poppins"),
                    ),
                  ),
                ],
              )
            : Text('No user is currently logged in.'),
      ),
    );
  }
}
