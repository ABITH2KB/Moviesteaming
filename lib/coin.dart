import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: MovieStreamingDemo()));
}

class MovieStreamingDemo extends StatefulWidget {
  const MovieStreamingDemo({super.key});

  @override
  State<MovieStreamingDemo> createState() => _MovieStreamingDemoState();
}

class _MovieStreamingDemoState extends State<MovieStreamingDemo> {
  int userCoins = 10; // Initial coins

  List<Map<String, dynamic>> videos = [
    {'title': 'Action Movie', 'coinCost': 5, 'isUnlocked': false},
    {'title': 'Drama Movie', 'coinCost': 3, 'isUnlocked': false},
    {'title': 'Horror Movie', 'coinCost': 4, 'isUnlocked': false},
  ];

  void unlockVideo(int index) {
    int cost = videos[index]['coinCost'];

    if (userCoins >= cost) {
      setState(() {
        userCoins -= cost;
        videos[index]['isUnlocked'] = true;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${videos[index]['title']} unlocked!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Not enough coins')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('Movie Stream - Demo'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                const Icon(Icons.monetization_on, color: Colors.amber),
                Text('$userCoins', style: const TextStyle(fontSize: 18)),
              ],
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: videos.length,
        itemBuilder: (context, index) {
          final video = videos[index];
          return Card(
            color: Colors.grey[900],
            margin: const EdgeInsets.all(10),
            child: ListTile(
              title: Text(video['title'], style: const TextStyle(color: Colors.white)),
              subtitle: Text('${video['coinCost']} coins to watch',
                  style: const TextStyle(color: Colors.grey)),
              trailing: video['isUnlocked']
                  ? ElevatedButton(
                      onPressed: () {
                        // Navigate to video player screen
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Streaming ${video['title']}...')),
                        );
                      },
                      child: const Text('Watch'),
                    )
                  : ElevatedButton(
                      onPressed: () => unlockVideo(index),
                      child: const Text('Unlock'),
                    ),
            ),
          );
        },
      ),
    );
  }
}
