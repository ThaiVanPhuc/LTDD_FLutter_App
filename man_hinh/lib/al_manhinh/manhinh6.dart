import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:man_hinh/al_manhinh/manhinh1.dart';

class Manhinh6 extends StatefulWidget {
  @override
  _Manhinh6State createState() => _Manhinh6State();
}

class _Manhinh6State extends State<Manhinh6> {
  bool _notificationsEnabled = true;
  bool _isEditingProfile = false;

  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController countryController = TextEditingController();

  String fullName = "Loading...";
  String email = "Loading...";
  String phoneNumber = "Loading...";
  String address = "Loading...";
  String country = "Loading...";

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    final url = Uri.parse('https://ltdd-flutter-sever.onrender.com/api/users');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        // Handle if API returns a list of users
        if (data is List && data.isNotEmpty) {
          setState(() {
            fullName = data[0]['full_name'] ?? "N/A";
            email = data[0]['email'] ?? "N/A";
            phoneNumber = data[0]['phone_number'] ?? "N/A";
            address = data[0]['address'] ?? "N/A";
            country = data[0]['country'] ?? "N/A";

            fullNameController.text = fullName;
            emailController.text = email;
            phoneController.text = phoneNumber;
            addressController.text = address;
            countryController.text = country;
          });
        }
      } else {
        setState(() {
          fullName = "Error loading name";
          email = "Error loading email";
        });
      }
    } catch (e) {
      setState(() {
        fullName = "Failed to fetch data";
        email = "Failed to fetch data";
      });
    }
  }

  Future<void> _signOut() async {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => Manhinh1()),
      (Route<dynamic> route) => false,
    );
  }

  Future<void> _editProfile() async {
    const String apiUrl = 'https://ltdd-flutter-sever.onrender.com/api/users';
    final response = await http.put(
      Uri.parse(apiUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "full_name": fullNameController.text,
        "email": emailController.text,
        "phone_number": phoneController.text,
        "address": addressController.text,
        "country": countryController.text,
      }),
    );

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Profile updated successfully")),
      );
      setState(() {
        _isEditingProfile = false;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to update profile")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isEditingProfile ? 'Edit Profile' : 'Settings'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            if (_isEditingProfile) {
              setState(() {
                _isEditingProfile = false;
              });
            } else {
              Navigator.pop(context);
            }
          },
        ),
        actions: _isEditingProfile
            ? [
                TextButton(
                  onPressed: _editProfile,
                  child: Text(
                    'SAVE',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ]
            : null,
      ),
      body: _isEditingProfile ? _buildEditProfile() : _buildSettings(),
    );
  }

  Widget _buildSettings() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/icon6/image1.png'),
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      fullName,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(email, style: TextStyle(color: Colors.white70)),
                  ],
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _isEditingProfile = true;

                      fullNameController.text = fullName;
                      emailController.text = email;
                      phoneController.text = phoneNumber;
                      addressController.text = address;
                      countryController.text = country;
                    });
                  },
                  child: Text('EDIT PROFILE'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.teal,
                    backgroundColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          ListTile(
            leading:
                Image.asset('assets/icon6/icon1.png', width: 24, height: 24),
            title: Text('Notifications'),
            trailing: Switch(
              value: _notificationsEnabled,
              onChanged: (bool value) {
                setState(() {
                  _notificationsEnabled = value;
                });
              },
              activeColor: Colors.green,
            ),
          ),
          SettingsOption(
            title: 'Languages',
            iconPath: 'assets/icon6/icon2.png',
          ),
          SettingsOption(
            title: 'Payment Info',
            iconPath: 'assets/icon6/icon3.png',
          ),
          SettingsOption(
            title: 'Income Stats',
            iconPath: 'assets/icon6/icon4.png',
          ),
          SettingsOption(
            title: 'Privacy & Policies',
            iconPath: 'assets/icon6/icon5.png',
          ),
          SettingsOption(
            title: 'Feedback',
            iconPath: 'assets/icon6/icon6.png',
          ),
          SettingsOption(
            title: 'Usage',
            iconPath: 'assets/icon6/icon7.png',
          ),
          Spacer(),
          TextButton(
            onPressed: _signOut,
            child: Text('Sign out'),
            style: TextButton.styleFrom(
              foregroundColor: Colors.red,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEditProfile() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/icon6/image1.png'),
          ),
          SizedBox(height: 16),
          TextFormField(
            controller: fullNameController,
            decoration: InputDecoration(labelText: "Full Name"),
          ),
          TextFormField(
            controller: emailController,
            decoration: InputDecoration(labelText: "Email"),
          ),
          TextFormField(
            controller: phoneController,
            decoration: InputDecoration(labelText: "Phone Number"),
          ),
          TextFormField(
            controller: addressController,
            decoration: InputDecoration(labelText: "Address"),
          ),
          TextFormField(
            controller: countryController,
            decoration: InputDecoration(labelText: "Country"),
          ),
        ],
      ),
    );
  }
}

class SettingsOption extends StatelessWidget {
  final String title;
  final String iconPath;

  const SettingsOption({required this.title, required this.iconPath});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(iconPath, width: 24, height: 24),
      title: Text(title),
      trailing: Icon(Icons.chevron_right),
      onTap: () {},
    );
  }
}
