import 'package:bookfilim/elevatedbttonwidget.dart';
import 'package:bookfilim/moviescreen.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _selected = false;
  String? _selectedGenre;

  int userCoins = 20; // Initial coin balance

  List<String> categories = [
    'Action',
    'Comedy',
    'Drama',
    'Horror',
    'Sci-Fi',
    'Romance',
  ];

  List<Map<String, dynamic>> sliderData = [
    {
      'image': 'asset/image/gymkhana.webp',
      'name': 'Alappuzha Gymkhana',
      'rating': '4.5',
      'duration': '2h 15m',
      'genre': 'Action',
      'coinCost': 3,
      'isUnlocked': false,
      'videoUrl':
          'https://firebasestorage.googleapis.com/v0/b/moviebooking-cb614.firebasestorage.app/o/gymkana.mp4?alt=media&token=c339bfb4-c2d1-4437-ae49-2bcdff7a5cd2',
    },
    {
      'image': 'asset/image/deadpool.webp',
      'name': 'Deadpool vs Wolverine',
      'rating': '4.2',
      'duration': '1h 45m',
      'genre': 'Comedy',
      'coinCost': 2,
      'isUnlocked': false,
      'videoUrl':
          'https://firebasestorage.googleapis.com/v0/b/moviebooking-cb614.firebasestorage.app/o/gymkana.mp4?alt=media&token=c339bfb4-c2d1-4437-ae49-2bcdff7a5cd2',
    },
    {
      'image': 'asset/image/manofsteel.webp',
      'name': 'Man of Steel',
      'rating': '4.8',
      'duration': '2h 10m',
      'genre': 'Sci-Fi',
      'coinCost': 4,
      'isUnlocked': false,
      'videoUrl':
          'https://firebasestorage.googleapis.com/v0/b/moviebooking-cb614.firebasestorage.app/o/trailerrr.mp4?alt=media&token=7a37e48d-ff7e-4efc-a064-991e27fc7e2f',
    },
  ];

  List<Map<String, dynamic>> movielist = [
    {
      'image': 'asset/image/gymkhana.webp',
      'name': 'Alappuzha Gymkhana',
      'rating': '4.5',
      'duration': '2h 15m',
      'genre': 'Action',
      'videoUrl':
          'https://firebasestorage.googleapis.com/v0/b/moviebooking-cb614.firebasestorage.app/o/gymkana.mp4?alt=media&token=c339bfb4-c2d1-4437-ae49-2bcdff7a5cd2',
    },
    {
      'image': 'asset/image/deadpool.webp',
      'name': 'Deadpool vs Wolverine',
      'rating': '4.2',
      'duration': '1h 45m',
      'genre': 'Comedy',
      'videoUrl':
          'https://firebasestorage.googleapis.com/v0/b/moviebooking-cb614.firebasestorage.app/o/gymkana.mp4?alt=media&token=c339bfb4-c2d1-4437-ae49-2bcdff7a5cd2',
    },
    {
      'image': 'asset/image/manofsteel.webp',
      'name': 'Man of Steel',
      'rating': '4.8',
      'duration': '2h 10m',
      'genre': 'Sci-Fi',
      'videoUrl':
          'https://firebasestorage.googleapis.com/v0/b/moviebooking-cb614.firebasestorage.app/o/trailerrr.mp4?alt=media&token=7a37e48d-ff7e-4efc-a064-991e27fc7e2f',
    },
  ];

  TextEditingController searchController = TextEditingController();
  FocusNode focusNode = FocusNode();
  List<String> filteredSuggestions = [];

  @override
  void initState() {
    super.initState();
    searchController.addListener(() {
      filterSuggestions(searchController.text);
    });
  }

  void filterSuggestions(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredSuggestions = categories;
      } else {
        filteredSuggestions = categories
            .where((category) =>
                category.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  void unlockMovie(int index) {
    int cost = sliderData[index]['coinCost'];
    if (userCoins >= cost) {
      setState(() {
        userCoins -= cost;
        sliderData[index]['isUnlocked'] = true;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Unlocked: ${sliderData[index]['name']}")),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Not enough coins")),
      );
    }
  }

  void _showAddCoinsDialog(BuildContext context) {
    final TextEditingController coinController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.grey[900],
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          title: const Text(
            'Add Coins',
            style: TextStyle(color: Colors.white),
          ),
          content: TextField(
            controller: coinController,
            keyboardType: TextInputType.number,
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
              hintText: 'Enter number of coins',
              hintStyle: TextStyle(color: Colors.white54),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white24),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.amber),
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel', style: TextStyle(color: Colors.red)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Add', style: TextStyle(color: Colors.amber)),
              onPressed: () {
                final enteredCoins = int.tryParse(coinController.text);
                if (enteredCoins != null && enteredCoins > 0) {
                  setState(() {
                    userCoins += enteredCoins;
                  });
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Added $enteredCoins coins!'),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Enter a valid number'),
                    ),
                  );
                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    searchController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B091C),
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Row(
          children: [
            const Text('Home', style: TextStyle(color: Colors.white)),
            const Spacer(),
            const Icon(Icons.notifications, color: Colors.white),
            const SizedBox(width: 10),
            GestureDetector(
              onTap: () => _showAddCoinsDialog(context),
              child: Row(
                children: [
                  const Icon(Icons.monetization_on, color: Colors.amber),
                  const SizedBox(width: 4),
                  Text(
                    '$userCoins',
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: searchController,
                focusNode: focusNode,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white10,
                  hintText: 'Search movies or categories...',
                  hintStyle: const TextStyle(color: Colors.white70),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: const Icon(Icons.search, color: Colors.white),
                ),
              ),
              const SizedBox(height: 10),
              if (focusNode.hasFocus || searchController.text.isNotEmpty)
                ...filteredSuggestions.map((category) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: GestureDetector(
                      onTap: () {
                        searchController.text = category;
                        FocusScope.of(context).unfocus();
                      },
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white12,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          category,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              const SizedBox(height: 20),
              CarouselSlider(
                options: CarouselOptions(
                  height: 200.0,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  viewportFraction: 0.9,
                  autoPlayInterval: const Duration(seconds: 3),
                ),
                items: sliderData.asMap().entries.map((entry) {
                  int index = entry.key;
                  Map<String, dynamic> movie = entry.value;
                  return Builder(
                    builder: (BuildContext context) {
                      return Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              movie['image'],
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: 200,
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [Colors.transparent, Colors.black87],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(12),
                                  bottomRight: Radius.circular(12),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    movie['name'],
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.star,
                                          color: Colors.yellow[700], size: 16),
                                      const SizedBox(width: 4),
                                      Text(movie['rating'],
                                          style: const TextStyle(color: Colors.yellow)),
                                      const SizedBox(width: 10),
                                      const Icon(Icons.schedule,
                                          color: Colors.white70, size: 16),
                                      const SizedBox(width: 4),
                                      Text(movie['duration'],
                                          style: const TextStyle(color: Colors.white)),
                                      const SizedBox(width: 10),
                                      const Icon(Icons.movie,
                                          color: Colors.white70, size: 16),
                                      const SizedBox(width: 4),
                                      Text(movie['genre'],
                                          style: const TextStyle(color: Colors.white)),
                                      const Spacer(),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: movie['isUnlocked']
                                              ? Colors.green
                                              : Colors.amber,
                                        ),
                                        onPressed: movie['isUnlocked']
                                            ? () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        VideoPlayerScreen(
                                                      videoUrl:
                                                          movie['videoUrl'],
                                                    ),
                                                  ),
                                                );
                                              }
                                            : () => unlockMovie(index),
                                        child: Text(movie['isUnlocked']
                                            ? 'Watch'
                                            : 'Unlock'),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              const Text('Genres',
                  style: TextStyle(color: Colors.white, fontSize: 20)),
              const SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: categories.map((genre) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: CustomButton(
                        text: genre,
                        backgroundColor: _selectedGenre == genre
                            ? Colors.amber
                            : Colors.white10,
                        textColor: _selectedGenre == genre
                            ? Colors.black
                            : Colors.white,
                        onPressed: () {
                          setState(() {
                            _selectedGenre = genre;
                          });
                        },
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 20),
              const Text('Top Picks',
                  style: TextStyle(color: Colors.white, fontSize: 20)),
              const SizedBox(height: 10),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: 0.75,
                children: movielist.map((movie) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VideoPlayerScreen(
                            videoUrl: movie['videoUrl'],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white10,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(12),
                                topRight: Radius.circular(12)),
                            child: Image.asset(
                              movie['image'],
                              height: 140,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              movie['name'],
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              children: [
                                Icon(Icons.star,
                                    color: Colors.yellow[700], size: 16),
                                const SizedBox(width: 4),
                                Text(
                                  movie['rating'],
                                  style: const TextStyle(
                                      color: Colors.yellow, fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 4),
                            child: Text(
                              "${movie['duration']} • ${movie['genre']}",
                              style: const TextStyle(
                                  color: Colors.white70, fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
