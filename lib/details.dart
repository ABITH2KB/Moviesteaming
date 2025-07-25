import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  final darkBackground = const Color(0xFF0E0C1D);

    final gradientColors = [
    Color(0xFF1A54FF),
    Color(0xFFD702FB),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBackground,
      body: SafeArea(

        child: Column(

          children: [
           
             Padding(

              padding:  EdgeInsets.symmetric(horizontal: 10, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  [

                  
                    GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(Icons.arrow_back, color: Colors.white),
                    ),
                  Icon(Icons.share, color: Colors.white),
                ],
              ),
            ),

            // Stack for banner + detail container
            Expanded(
              child: Stack(
                children: [
                  // Red banner container (poster/trailer)
                  Container(
                    height: 250,
                    width: double.infinity,
                    color: Colors.red,
                    child: const Center(
                      child: Text(
                        "Movie Banner",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),

                  // Dark detail container overlapping banner
                  Positioned(
                    top: 200,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: darkBackground,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Movie Title
                            const Text(
                              "The Great Escape",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),

                            // Meta info row
                            const Row(
                              children: [
                                Icon(Icons.timer, color: Colors.white54, size: 18),
                                SizedBox(width: 4),
                                Text("2h 15m", style: TextStyle(color: Colors.white70)),
                                SizedBox(width: 12),
                                Icon(Icons.category, color: Colors.white54, size: 18),
                                SizedBox(width: 4),
                                Text("Action", style: TextStyle(color: Colors.white70)),
                                SizedBox(width: 12),
                                Icon(Icons.star, color: Colors.amber, size: 18),
                                SizedBox(width: 4),
                                Text("4.5", style: TextStyle(color: Colors.white70)),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),

                             SizedBox(height: 40,
  width: double.infinity,
  child: ElevatedButton(
    onPressed: () {
      // Navigate to video player or perform action
      print("Watch Now Pressed");
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.purple,
      padding: const EdgeInsets.symmetric(vertical: 14),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    child: const Text(
      "▶ Watch Now",
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.white
      ),
    ),
  ),
),

                            const SizedBox(height: 16),

                            // Description
                            const Text(
                              "In a post-apocalyptic world, a group of unlikely heroes embark on a daring mission to save humanity. Packed with suspense, action, and emotional moments.",
                              style: TextStyle(color: Colors.white60, height: 1.5),
                            ),

                            const SizedBox(height: 24),

                            // Actors Section
                            

                        SizedBox(
                          height: 90,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: List.generate(5, (index) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 12),
                      child: Column(
                      children: [
                                   CircleAvatar(
                                   radius: 28,
                                   backgroundImage: AssetImage('asset/image/actor${index + 1}.jpg'),
                                 ),
                                 const SizedBox(height: 6),
                                 const Text(
                                   "Actor Name",
                                   style: TextStyle(
                                   color: Colors.white,
                                   fontSize: 12,
              ),
            )
          ],
        ),
      );
    }),
  ),
),

                         const SizedBox(height: 24),


                         const Text(
                                 "   Episodes",
                                 style: TextStyle(
                                 color: Colors.white,
                                 fontSize: 18,
                                 fontWeight: FontWeight.bold,
  ),
),
                                 SizedBox(height: 12),

// Episode List
Column(
  children: List.generate(4, (index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: Color(0xFF1A182B),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
         
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Episode ${index + 1}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  "Duration: 24 min",
                  style: TextStyle(color: Colors.white70, fontSize: 12),
                )
              ],
            ),
          ),

          // Play Button
          IconButton(
            onPressed: () {
              print("Play Episode ${index + 1}");
            },
            icon: const Icon(Icons.play_circle_fill, color: Colors.redAccent, size: 30),
          )
        ],
      ),
    );
  }),
),

                          
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
