import 'package:flutter/material.dart';

class Manhinh1 extends StatelessWidget {
  const Manhinh1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                ClipPath(
                  clipper: CustomClipPath(),
                  child: Container(
                    height: 200,
                    color: Color(0xFF00C1A4),
                    padding: const EdgeInsets.symmetric(
                        vertical: 40, horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/logo.png',
                          height: 60,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Positioned(
                  top: 100,
                  right: 83,
                  child: Image.asset('assets/line.png', height: 60),
                ),
                Positioned(
                  top: 70,
                  right: 60,
                  child: Image.asset('assets/cloud.png', height: 60),
                ),
                Positioned(
                  top: 50,
                  right: 30,
                  child: Image.asset('assets/maybay.png', height: 60),
                ),
              ],
            ),
            // Phần nội dung đăng nhập
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 20),
                  Text("Sign In",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Text("Welcome back, Tuan Tran",
                      style: TextStyle(color: Color(0xFF00C1A4))),
                  SizedBox(height: 15),
                  Text("Email", style: TextStyle(fontWeight: FontWeight.bold)),
                  TextField(),
                  SizedBox(height: 15),
                  Text("Password",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextField(obscureText: true),
                  SizedBox(height: 15),
                  Text("Forgot Password"),
                  SizedBox(height: 30),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 50),
                        backgroundColor: Color(0xFF00C1A4),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                      child: Text(
                        "SIGN IN",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Center(child: Text('Or sign in with')),
                  SizedBox(height: 15),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('images/iconFacebook.png', height: 40),
                        SizedBox(width: 20),
                        Image.asset('images/iconKakao.png', height: 40),
                        SizedBox(width: 20),
                        Image.asset('images/iconLine.png', height: 40),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account? "),
                        Text("Sign Up",
                            style: TextStyle(color: Color(0xFF00C1A4))),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        size.width / 2, size.height - 100, size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
