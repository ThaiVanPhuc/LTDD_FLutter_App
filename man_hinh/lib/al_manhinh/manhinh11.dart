import 'package:flutter/material.dart';

class ManHinh11 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Phần đầu trang vẽ
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
            SizedBox(height: 20), // Space dưới phần vẽ

            // Nội dung chính
            Text(
              "Welcome, Tuan!",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Please finish your profile so that Travelers can find you easily!",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            // Row to hold the circles and the line
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Icon(Icons.circle,
                            color: const Color.fromARGB(255, 0, 193, 164),
                            size: 30), // Increased size
                      ],
                    ),
                    // Space between circles
                    CustomPaint(
                      size: Size(120, 40), // Width for the line
                      painter: LinePainter(),
                    ),
                    // Space between circles
                    Column(
                      children: [
                        Icon(Icons.circle,
                            color: Color(0xFF00C1A4),
                            size: 30), // Increased size
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 5), // Space below the circles and line
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Background Info"),
                    SizedBox(width: 40), // Space between the two labels
                    Text("Fee & Time"),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              "Set Fee",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              "The price unit is US \$/hour",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            SizedBox(height: 10),
            Table(
              border: TableBorder.all(color: Colors.grey),
              children: [
                _buildTableRow("1 - 3 Travelers", "Input"),
                _buildTableRow("4 - 6 Travelers", "Input"),
                _buildTableRow("7 - 9 Travelers", "Input"),
                _buildTableRow("10 - 14 Travelers", "Input"),
              ],
            ),
            SizedBox(height: 20),
            Text(
              "Set Available Time",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              "The time you can work on Fellow4U as a Guide",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            SizedBox(height: 10),
            AvailableTimePicker(),
            SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF00C1A4),
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                child: Text("FINISH",
                    style: TextStyle(fontSize: 14, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  TableRow _buildTableRow(String travelers, String fee) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            travelers,
            style: TextStyle(fontSize: 16),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            fee,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ),
      ],
    );
  }
}

class AvailableTimePicker extends StatefulWidget {
  @override
  _AvailableTimePickerState createState() => _AvailableTimePickerState();
}

class _AvailableTimePickerState extends State<AvailableTimePicker> {
  String selectedDay = "Monday";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ...[
              "Monday",
              "Tuesday",
              "Wednesday",
              "Thursday",
              "Friday",
              "Saturday",
            ].map((day) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedDay = day;
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: 10, vertical: 5), // Padding cho hộp
                  decoration: BoxDecoration(
                    color: selectedDay == day
                        ? Color(0xFF00C1A4)
                        : Colors.transparent, // Màu xanh nếu được chọn
                    border:
                        Border.all(color: Color(0xFF00C1A4)), // Viền màu xanh
                    borderRadius: BorderRadius.circular(5), // Bo tròn góc
                  ),
                  child: Text(
                    day,
                    style: TextStyle(
                      color: selectedDay == day
                          ? Colors.white
                          : Colors.black, // Màu chữ
                      fontWeight: selectedDay == day
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                ),
              );
            }).toList(),
          ],
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(labelText: "From"),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: TextField(
                decoration: InputDecoration(labelText: "To"),
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        GestureDetector(
          onTap: () {},
          child: Text(
            "+ Add Another Time",
            style: TextStyle(color: Colors.teal),
          ),
        ),
      ],
    );
  }
}

class LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.teal
      ..strokeWidth = 4.0 // Increased width for better visibility
      ..style = PaintingStyle.stroke;

    // Draw the line connecting the two circles
    canvas.drawLine(
        Offset(0, size.height / 2), Offset(size.width, size.height / 2), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
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
