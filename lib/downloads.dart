import 'package:flutter/material.dart';

class DownloadsScreen extends StatelessWidget {
  const DownloadsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final background = const Color(0xFF0E0C1D);

    // All images are from assets folder
    final List<Map<String, dynamic>> downloading = [
      {
        "title": "I respect your choice",
        "genre": "Action",
        "rating": 4.5,
        "progress": 0.6,
        "image": "asset/image/1.jpeg"
      },
      {
        "title": "broken man",
        "genre": "Sci-Fi",
        "rating": 4.2,
        "progress": 0.3,
        "image": "asset/image/5.jpeg"
      },
      {
        "title": " No Biggie",
        "genre": "Thriller",
        "rating": 4.8,
        "progress": 0.8,
        "image": "asset/image/6.jpeg"
      },
    ];

    final List<Map<String, dynamic>> downloaded = [
      {
        "title": "Take it off",
        "genre": "Comedy",
        "rating": 4.0,
        "image": "asset/image/1.jpeg"
      },
      {
        "title": "There is no use",
        "genre": "Mystery",
        "rating": 3.8,
        "image": "asset/image/3.jpeg"
      },
      {
        "title": "Twisted situation",
        "genre": "Romance",
        "rating": 4.3,
        "image": "asset/image/2.jpeg"
      },
    ];

    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: const Text("Downloads",
            style: TextStyle(color: Colors.white, fontSize: 20)),
        backgroundColor: background,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            const Text(
              "Downloading",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            Column(
              children: downloading.map((item) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1A182B),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      // Asset Image
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          item["image"],
                          height: 100,
                          width: 70,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 12),

                      // Info
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item["title"],
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 4),
                           
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                const Icon(Icons.star,
                                    color: Colors.amber, size: 16),
                                const SizedBox(width: 4),
                                Text(
                                  item["rating"].toString(),
                                  style: const TextStyle(
                                      color: Colors.white70, fontSize: 13),
                                )
                              ],
                            )
                          ],
                        ),
                      ),

                      // Circular download progress
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            height: 40,
                            width: 40,
                            child: CircularProgressIndicator(
                              value: item["progress"],
                              backgroundColor: Colors.white12,
                              color: Colors.redAccent,
                              strokeWidth: 4,
                            ),
                          ),
                          Text(
                            "${(item["progress"] * 100).toInt()}%",
                            style: const TextStyle(
                                color: Colors.white, fontSize: 10),
                          )
                        ],
                      )
                    ],
                  ),
                );
              }).toList(),
            ),

            const SizedBox(height: 24),

            const Text(
              "Downloaded",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            Column(
              children: downloaded.map((item) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1A182B),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          item["image"],
                          height: 100,
                          width: 70,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item["title"],
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "Genre: ${item["genre"]}",
                              style: const TextStyle(
                                  color: Colors.white70, fontSize: 13),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                const Icon(Icons.star,
                                    color: Colors.amber, size: 16),
                                const SizedBox(width: 4),
                                Text(
                                  item["rating"].toString(),
                                  style: const TextStyle(
                                      color: Colors.white70, fontSize: 13),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      const Icon(Icons.check_circle,
                          color: Colors.green, size: 30),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
