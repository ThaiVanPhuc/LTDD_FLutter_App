import 'package:flutter/material.dart';

class Manhinh5 extends StatefulWidget {
  @override
  _Manhinh5State createState() => _Manhinh5State();
}

class _Manhinh5State extends State<Manhinh5> {
  final TextEditingController _searchController = TextEditingController();
  List<ChatTileData> chatList = [
    ChatTileData(
      name: 'Yoo Jin',
      message: 'It’s a beautiful place',
      time: '9:41 AM',
      unreadMessages: 2,
      imageUrl: 'assets/images/image2.png',
    ),
    ChatTileData(
      name: 'Jonathan P',
      message: 'We can start at 8am',
      time: '10:30 AM',
      unreadMessages: 0,
      imageUrl: 'assets/images/image3.png',
    ),
    ChatTileData(
      name: 'Myung Dae',
      message: 'See you tomorrow',
      time: '11:30 AM',
      unreadMessages: 0,
      imageUrl: 'assets/images/image4.png',
    ),
  ];

  List<ChatTileData> filteredChatList = [];

  @override
  void initState() {
    super.initState();
    filteredChatList = chatList;
    _searchController.addListener(_filterChats);
  }

  void _filterChats() {
    String searchTerm = _searchController.text.toLowerCase();
    setState(() {
      filteredChatList = chatList.where((chat) {
        return chat.name.toLowerCase().contains(searchTerm) ||
            chat.message.toLowerCase().contains(searchTerm);
      }).toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(200),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          flexibleSpace: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  'assets/images/image1.png',
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                ),
              ),
              Container(
                height: 200,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.transparent,
                      Colors.transparent,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
              Positioned(
                top: 140,
                left: 16,
                child: Text(
                  'Chat',
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 169, 210, 244),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search Chat',
                prefixIcon: Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Expanded(
            child: filteredChatList.isEmpty
                ? Center(child: Text('No chats found'))
                : ListView.builder(
                    itemCount: filteredChatList.length,
                    itemBuilder: (context, index) {
                      final chat = filteredChatList[index];
                      return ChatTile(
                        name: chat.name,
                        message: chat.message,
                        time: chat.time,
                        unreadMessages: chat.unreadMessages,
                        imageUrl: chat.imageUrl,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChatDetailScreen(
                                name: chat.name,
                                message: chat.message,
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

class ChatTileData {
  final String name;
  final String message;
  final String time;
  final int unreadMessages;
  final String imageUrl;

  ChatTileData({
    required this.name,
    required this.message,
    required this.time,
    required this.unreadMessages,
    required this.imageUrl,
  });
}

class ChatTile extends StatelessWidget {
  final String name;
  final String message;
  final String time;
  final int unreadMessages;
  final String imageUrl;
  final VoidCallback onTap;

  ChatTile({
    required this.name,
    required this.message,
    required this.time,
    required this.imageUrl,
    this.unreadMessages = 0,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(imageUrl),
        radius: 25,
      ),
      title: Text(
        name,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(message),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(time, style: TextStyle(color: Colors.grey)),
          if (unreadMessages > 0)
            Container(
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: Text(
                unreadMessages.toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ),
        ],
      ),
      onTap: onTap,
    );
  }
}

class ChatDetailScreen extends StatelessWidget {
  final String name;
  final String message;

  ChatDetailScreen({required this.name, required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Center(
        child: Text(message),
      ),
    );
  }
}
