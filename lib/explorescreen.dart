import 'package:bookfilim/details.dart';
import 'package:flutter/material.dart';

class ExploreScreen extends StatelessWidget {
  final List<Map<String, dynamic>> movies = [
    {
      "title": "The Mitrix: Reloaded",
      "rating": "8.1",
      "duration": "1h 15min",
      "genre": "Sci-Fi",
      "image": "asset/image/matrix.jpeg"
    },
    {
      "title": "Mad Max: Fury Way",
      "rating": "7.5",
      "duration": "1h 45min",
      "genre": "Action",
      "image": "asset/image/mad max.jpeg"
    },
    {
      "title": "Panchayat",
      "rating": "6.5",
      "duration": "1h 45min",
      "genre": "Thriller",
      "image": "asset/image/panchayat.webp"
    },
    {
      "title": "The Boys",
      "rating": "7.5",
      "duration": "1h 45min",
      "genre": "Fantasy",
      "image": "asset/image/boys.jpeg"
    },
  ];

  final darkBackground = const Color(0xFF0E0C1D);

  ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBackground,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView(
            children: [
              // Search Bar
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF1E1B2E),
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: const Row(
                  children: [
                    Expanded(
                      child: TextField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: 'What are you watching today',
                          hintStyle: TextStyle(color: Colors.white38),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Icon(Icons.search, color: Colors.white38)
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Tags Section
              const Text("Search by tags",
                  style: TextStyle(color: Colors.white, fontSize: 20)),
              const SizedBox(height: 16),

              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  buildTag("All Country", selected: true),
                  buildTag("Japan"),
                  buildTag("USA"),
                  buildTag("South"),
                  buildTag("All Genre"),
                  buildTag("Action", selected: true),
                  buildTag("Drama"),
                  buildTag("Fantasy"),
                  buildTag("All Years"),
                  buildTag("2021"),
                  buildTag("2020", selected: true),
                  buildTag("2015–2019"),
                ],
              ),

              const SizedBox(height: 32),

              const Text("Popular Movies",
                  style: TextStyle(color: Colors.white, fontSize: 20)),
              const SizedBox(height: 16),

              GridView.builder(
                itemCount: movies.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (context, index) {
                  final movie = movies[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Details(),
                            ),
                          );
                        },
                        child: Container(
                          height: 140,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                              image: AssetImage(movie['image']),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        movie['title'],
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Details(),
                                ),
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 6, vertical: 2),
                              decoration: BoxDecoration(
                                color: Colors.black26,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Row(
                                children: [
                                  const Icon(Icons.star,
                                      size: 14, color: Colors.amber),
                                  const SizedBox(width: 2),
                                  Text(
                                    movie['rating'],
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            "${movie['duration']}  |  ${movie['genre']}",
                            style: const TextStyle(
                                color: Colors.white60, fontSize: 12),
                          )
                        ],
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTag(String label, {bool selected = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: selected ? const Color(0xFF6C3DF4) : const Color(0xFF1E1B2E),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
            color: Colors.white,
            fontWeight: selected ? FontWeight.bold : FontWeight.normal),
      ),
    );
  }
}
