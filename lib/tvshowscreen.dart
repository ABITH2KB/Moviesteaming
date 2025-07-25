


import 'package:flutter/material.dart';

class TvShowsScreen extends StatelessWidget {
  final darkBackground = const Color(0xFF0E0C1D);
  final purple = const Color(0xFF6C3DF4);

  const TvShowsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:darkBackground,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView(
            children: [
              const Center(
                child: Text(
                  "TV Shows",
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
              const SizedBox(height: 24),

              // Popular Channel
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Popular Channel",
                      style: TextStyle(fontSize: 18, color: Colors.white)),
                  Text("See all",
                      style: TextStyle(fontSize: 14, color: Colors.white54)),
                ],
              ),
              const SizedBox(height: 12),

              SizedBox(
                height: 60,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  separatorBuilder: (_, __) => const SizedBox(width: 12),
                  itemBuilder: (context, index) {
                    return Container(
                      width: 60,
                      decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(child: Icon(Icons.visibility, color: Colors.white)),
                    );
                  },
                ),
              ),

              const SizedBox(height: 24),

              // Now Playing
              const Text("Now Playing",
                  style: TextStyle(fontSize: 18, color: Colors.white)),
              const SizedBox(height: 12),

              Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.blueGrey[300],
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      right: 12,
                      top: 12,
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(Icons.visibility, color: Colors.white),
                      ),
                    ),
                    const Positioned(
                      left: 16,
                      bottom: 40,
                      child: Text(
                        "Master of Hacking",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    const Positioned(
                      left: 16,
                      bottom: 20,
                      child: Text(
                        "Action, Drama, Thriller",
                        style: TextStyle(color: Colors.white60, fontSize: 14),
                      ),
                    ),
                    Positioned(
                      right: 16,
                      bottom: 16,
                      child: CircleAvatar(
                        backgroundColor: Colors.white24,
                        child: Icon(Icons.play_arrow, color: purple),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),
              const Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    
                    Icon(Icons.circle, size: 10, color: Colors.white60),
                    SizedBox(width: 6),
                    Icon(Icons.circle, size: 10, color: Colors.grey),
                    SizedBox(width: 6),
                    Icon(Icons.circle, size: 10, color: Colors.grey),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              const Text("Recommendation",
                  style: TextStyle(fontSize: 18, color: Colors.white)),
              const SizedBox(height: 12),

              SizedBox(
                height: 180,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  separatorBuilder: (_, __) => const SizedBox(width: 12),
                  itemBuilder: (context, index) {
                    return Container(
                      width: 140,
                      decoration: BoxDecoration(
                        color: Colors.blueGrey[300],
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            top: 10,
                            right: 10,
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: Colors.white24,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Icon(Icons.tv, size: 16, color: Colors.white),
                            ),
                          ),
                          const Positioned(
                            left: 12,
                            bottom: 30,
                            child: Text("The Last Hero",
                                style: TextStyle(
                                    fontSize: 14, color: Colors.white)),
                          ),
                          const Positioned(
                            left: 12,
                            bottom: 14,
                            child: Text("Action, Sci-Fi",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.white54)),
                          ),
                          Positioned(
                            right: 10,
                            bottom: 10,
                            child: CircleAvatar(
                              radius: 14,
                              backgroundColor: Colors.white24,
                              child: Icon(Icons.play_arrow,
                                  size: 16, color: purple),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}