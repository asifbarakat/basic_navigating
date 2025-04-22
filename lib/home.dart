import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  mySnackBar(msg, context){
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                children: const [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage('https://media2.giphy.com/media/v1.Y2lkPTc5MGI3NjExd2Qxb24xM2t4cHh5eTVlODZycWkydnA1ZTBwbjZocWUyYjgzMDJkZCZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/OYbeDEzHWFU28nLOJC/giphy.gif'),
                  ),
                  // SizedBox(height: 10),
                  // Text('User Name', style: TextStyle(color: Colors.white, fontSize: 20)),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                mySnackBar('Home', context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                mySnackBar('Settings', context);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Home Page'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              mySnackBar('Notifications', context);
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Welcome to the Home Page!'),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Scaffold(
                      backgroundColor: Colors.lightBlueAccent,
                      appBar: AppBar(title: Text('New Page'), backgroundColor: Colors.blue),
                      body: const Center(
                        child: Text('This is a new page! Press the button down below to go back.', style: TextStyle(color: Colors.white))),
                      floatingActionButton: FloatingActionButton(
                        backgroundColor: Colors.blue,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(Icons.arrow_back),
                      ),
                    ),
                  ),
                );
              },
              child: const Text('Proceed to the next page', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     mySnackBar('Floating Action Button Pressed', context);
      //   },
      //   child: const Icon(Icons.add),
      // ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        onTap: (index) {
          mySnackBar('Bottom Navigation Item $index Pressed', context);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      persistentFooterButtons: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
          onPressed: () {
            mySnackBar('Persistent Footer Button Pressed', context);
          },
          child: const Text('Persistent Footer Button', style: TextStyle(color: Colors.white)),
        ),
        
      ],
      // bottomSheet: Container(
      //   color: Colors.blue,
      //   height: 50,
      //   child: const Center(
      //     child: Text('Bottom Sheet', style: TextStyle(color: Colors.white)),
      //   ),
      // ),
      // Removed invalid parameters and ensured bottomNavigationBar is correctly defined
    );
  }
}