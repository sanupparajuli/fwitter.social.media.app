// ignore_for_file: unused_element, library_private_types_in_public_api, unused_field

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  List<Map<String, dynamic>> tweets = [
    {
      "user": "John Doe",
      "username": "@johndoe",
      "avatar":
          "https://imgs.search.brave.com/1InuzOVEqjRiqjOt_R_LdW9q7mfxVIXiLu6M5BKlTyA/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly9pLnBp/bmltZy5jb20vb3Jp/Z2luYWxzL2JlL2Ez/LzQ5L2JlYTM0OTE5/MTU1NzFkMzRhMDI2/NzUzZjRhODcyMDAw/LmpwZw",
      "content": "This is a sample tweet. #Flutter #Dart",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTABbXr4i-QODqhy7tofHYmTYh05rYPktzacw&s",
      "likes": 120,
      "comments": 45,
    },
    {
      "user": "Jane Smith",
      "username": "@janesmith",
      "avatar":
          "https://imgs.search.brave.com/1InuzOVEqjRiqjOt_R_LdW9q7mfxVIXiLu6M5BKlTyA/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly9pLnBp/bmltZy5jb20vb3Jp/Z2luYWxzL2JlL2Ez/LzQ5L2JlYTM0OTE5/MTU1NzFkMzRhMDI2/NzUzZjRhODcyMDAw/LmpwZw",
      "content": "Loving the new features in Flutter 3.0! 😍",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTABbXr4i-QODqhy7tofHYmTYh05rYPktzacw&s",
      "likes": 200,
      "comments": 55,
    },
    {
      "user": "Robert Brown",
      "username": "@robertb",
      "avatar":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTABbXr4i-QODqhy7tofHYmTYh05rYPktzacw&s",
      "content": "Just finished a new project! #flutterdev #mobiledev",
      "image": "",
      "likes": 80,
      "comments": 20,
    },
  ];

  TextEditingController postController = TextEditingController();

  // Add a new tweet at the top of the list
  void addTweet(String content) {
    setState(() {
      tweets.insert(0, {
        "user": "You",
        "username": "@yourusername",
        "avatar":
            "https://imgs.search.brave.com/1InuzOVEqjRiqjOt_R_LdW9q7mfxVIXiLu6M5BKlTyA/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly9pLnBp/bmltZy5jb20vb3Jp/Z2luYWxzL2JlL2Ez/LzQ5L2JlYTM0OTE5/MTU1NzFkMzRhMDI2/NzUzZjRhODcyMDAw/LmpwZw",
        "content": content,
        "image": "",
        "likes": 0,
        "comments": 0,
      });
    });
    postController.clear(); // Clear the input field after posting
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fwitter"),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.mail),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Post Input Section
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://imgs.search.brave.com/1InuzOVEqjRiqjOt_R_LdW9q7mfxVIXiLu6M5BKlTyA/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly9pLnBp/bmltZy5jb20vb3Jp/Z2luYWxzL2JlL2Ez/LzQ5L2JlYTM0OTE5/MTU1NzFkMzRhMDI2/NzUzZjRhODcyMDAw/LmpwZw"),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: postController,
                    decoration: InputDecoration(
                      hintText: "What's on your mind?",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    if (postController.text.isNotEmpty) {
                      addTweet(postController.text);
                    }
                  },
                ),
              ],
            ),
          ),
          // Display Tweets
          Expanded(
            child: ListView.builder(
              itemCount: tweets.length,
              itemBuilder: (context, index) {
                final tweet = tweets[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 4.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(tweet['avatar']),
                          ),
                          title: Text(tweet['user']),
                          subtitle: Text(tweet['username']),
                          trailing: const Icon(Icons.more_vert),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(tweet['content']),
                        ),
                        tweet['image'].isNotEmpty
                            ? Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Image.network(tweet['image']),
                              )
                            : Container(),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.favorite_border, size: 20),
                                  const SizedBox(width: 4),
                                  Text(tweet['likes'].toString()),
                                ],
                              ),
                              Row(
                                children: [
                                  const Icon(Icons.comment, size: 20),
                                  const SizedBox(width: 4),
                                  Text(tweet['comments'].toString()),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const Divider(),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 8.0),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 16,
                                backgroundImage: NetworkImage(tweet['avatar']),
                              ),
                              const SizedBox(width: 8),
                              const Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: 'Reply...',
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                              const Icon(Icons.send),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle new post creation
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}