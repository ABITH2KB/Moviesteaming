import 'package:bookfilim/elevatedbttonwidget.dart';
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


  List<String> categories = [
    'Action',
    'Comedy',
    'Drama',
    'Horror',
    'Sci-Fi',
    'Romance',
  ];

  List<Map<String, String>> sliderData = [
    {
      'image': 'asset/image/movie.jpg',
      'name': 'The Great Escape',
      'rating': '4.5',
      'duration': '2h 15m',
      'genre': 'Action',
    },
    {
      'image': 'asset/image/movie.jpg',
      'name': 'Laugh Riot',
      'rating': '4.2',
      'duration': '1h 45m',
      'genre': 'Comedy',
    },
    {
      'image': 'asset/image/movie.jpg',
      'name': 'Space Wonders',
      'rating': '4.8',
      'duration': '2h 10m',
      'genre': 'Sci-Fi',
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Home Screen',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  Spacer(),
                  Icon(Icons.notifications, color: Colors.white),
                ],
              ),
              const SizedBox(height: 20),

              // Search Field
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

              // Category Suggestions
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

              // Carousel Slider
              CarouselSlider(
                options: CarouselOptions(
                  height: 200.0,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  viewportFraction: 0.9,
                  autoPlayInterval: const Duration(seconds: 3),
                ),
                items: sliderData.map((movie) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              movie['image']!,
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
                                    movie['name']!,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Row(
                                    children: [
                                      Icon(Icons.star,
                                          color: Colors.yellow[700], size: 16),
                                      const SizedBox(width: 4),
                                      Text(
                                        movie['rating']!,
                                        style: const TextStyle(
                                            color: Colors.yellow
                                            ),
                                      ),
                                      const SizedBox(width: 10),
                                      const Icon(Icons.schedule,
                                          color: Colors.white70, size: 16),
                                      const SizedBox(width: 4),
                                      Text(
                                        movie['duration']!,
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                      const SizedBox(width: 10),
                                      const Icon(Icons.movie,
                                          color: Colors.white70, size: 16),
                                      const SizedBox(width: 4),
                                      Text(
                                        movie['genre']!,
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
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

              const Text('Continue watching',
                  style: TextStyle(color: Colors.white, fontSize: 20)),
              const SizedBox(height: 20),
              const Text('Genres',
                  style: TextStyle(color: Colors.white, fontSize: 20)),
              const SizedBox(height: 10),

              // Genre Buttons
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SingleChildScrollView(
  scrollDirection: Axis.horizontal,
  child: Row(
    children: [
      CustomButton(
        text: 'Action',
        backgroundColor: _selectedGenre == 'Action' ? Colors.amber : Colors.white10,
        textColor: _selectedGenre == 'Action' ? Colors.black : Colors.white,
        onPressed: () {
          setState(() {
            _selectedGenre = 'Action';
          });
        },
      ),
      const SizedBox(width: 10),
      CustomButton(
        text: 'Comedy',
        backgroundColor: _selectedGenre == 'Comedy' ? Colors.amber : Colors.white10,
        textColor: _selectedGenre == 'Comedy' ? Colors.black : Colors.white,
        onPressed: () {
          setState(() {
            _selectedGenre = 'Comedy';
          });
        },
      ),
      const SizedBox(width: 10),
      CustomButton(
        text: 'Drama',
        backgroundColor: _selectedGenre == 'Drama' ? Colors.amber : Colors.white10,
        textColor: _selectedGenre == 'Drama' ? Colors.black : Colors.white,
        onPressed: () {
          setState(() {
            _selectedGenre = 'Drama';
          });
        },
      ),
      const SizedBox(width: 10),
      CustomButton(
        text: 'Horror',
        backgroundColor: _selectedGenre == 'Horror' ? Colors.amber : Colors.white10,
        textColor: _selectedGenre == 'Horror' ? Colors.black : Colors.white,
        onPressed: () {
          setState(() {
            _selectedGenre = 'Horror';
          });
        },
      ),
      const SizedBox(width: 10),
      CustomButton(
        text: 'Sci-Fi',
        backgroundColor: _selectedGenre == 'Sci-Fi' ? Colors.amber : Colors.white10,
        textColor: _selectedGenre == 'Sci-Fi' ? Colors.black : Colors.white,
        onPressed: () {
          setState(() {
            _selectedGenre = 'Sci-Fi';
          });
        },
      ),
    ],
  ),
),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
