import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Travel Alerts',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
        backgroundColor: Colors.teal[300],
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_active),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 0, 172, 147),
                Color.fromARGB(255, 48, 91, 84)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              'Your Recent Travel Alerts',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.teal[300],
              ),
            ),
            SizedBox(height: 20),
            NotificationCard(
              icon: Icons.flight_takeoff,
              title: 'Flight to Paris',
              description:
                  'Your flight to Paris is scheduled to depart in 2 hours.',
              time: '2 hours ago',
              isUrgent: true,
            ),
            NotificationCard(
              icon: Icons.hotel,
              title: 'Hotel Check-in Reminder',
              description:
                  'Your hotel check-in at The Grand Paris is at 3 PM today.',
              time: '4 hours ago',
              isUrgent: false,
            ),
            NotificationCard(
              icon: Icons.update,
              title: 'New Travel Update',
              description:
                  'There is a new update regarding your travel plans to Tokyo.',
              time: '6 hours ago',
              isUrgent: false,
            ),
            NotificationCard(
              icon: Icons.confirmation_number,
              title: 'Travel Confirmation',
              description:
                  'Your train ticket from Paris to Rome has been confirmed.',
              time: '1 day ago',
              isUrgent: false,
            ),
            NotificationCard(
              icon: Icons.card_travel,
              title: 'Visa Expiration Reminder',
              description:
                  'Your visa for traveling to India will expire in 10 days.',
              time: '2 days ago',
              isUrgent: true,
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final String title;
  final String description;
  final String time;
  final IconData icon;
  final bool isUrgent;

  NotificationCard({
    required this.title,
    required this.description,
    required this.time,
    required this.icon,
    required this.isUrgent,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 15),
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: isUrgent ? Colors.red[50] : Colors.white,
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 8,
                spreadRadius: 2,
              ),
            ],
            gradient: isUrgent
                ? LinearGradient(
                    colors: [Colors.red[200]!, Colors.red[100]!],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  )
                : LinearGradient(
                    colors: [Colors.blue[50]!, Colors.blue[100]!],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
          ),
          child: Row(
            children: [
              Icon(
                icon,
                color: Colors.teal[400],
                size: 40,
              ),
              SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal[700],
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                time,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[500],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
