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
  'image': 'asset/image/1.jpeg',
  'name': 'I respect your choice...',
  'rating': '4.5',
  'duration': '2h 15m',
  'genre': 'Action',
  'coinCost': 16,
  'isUnlocked': false,
  'videoUrl':
      'https://firebasestorage.googleapis.com/v0/b/moviebooking-cb614.firebasestorage.app/o/I%20respect%20your%20choice...%20.mp4?alt=media&token=594bbaa4-d468-489e-901d-a8139a8127da',
},

   {
  'image': 'asset/image/2.jpeg',
  'name': 'new',
  'rating': '4.5',
  'duration': '2h 15m',
  'genre': 'Action',
  'coinCost': 10,
  'isUnlocked': false,
  'videoUrl':
      'https://firebasestorage.googleapis.com/v0/b/moviebooking-cb614.firebasestorage.app/o/How%20could%20I...%20.mp4?alt=media&token=4bc48208-5e14-4914-8cc5-c1c79230b921',
},

    {
      'image': 'asset/image/3.jpeg',
      'name': 'Share this to your colleagues',
      'rating': '4.5',
      'duration': '0h 30s',
      'genre': 'Comedy',
      'coinCost': 10,
      'isUnlocked': false,
      'videoUrl':
          'https://firebasestorage.googleapis.com/v0/b/moviebooking-cb614.firebasestorage.app/o/Share%20this%20to%20you%20colleagues%20%F0%9F%98%85%20%23relatable%20%23office%20%23ytshorts.mp4?alt=media&token=3bf2d5ed-0bed-4e9a-9e30-ad422a6cb98e',
    }
    ,
    {
  'image': 'asset/image/4.jpeg',
  'name': ' broken man ',
  'rating': '4.5',
  'duration': '2h 15m',
  'genre': 'Action',
  'coinCost': 7,
  'isUnlocked': false,
  'videoUrl':
      'https://firebasestorage.googleapis.com/v0/b/moviebooking-cb614.firebasestorage.app/o/A%20broken%20man...%20.mp4?alt=media&token=89b87fb7-6537-49bd-a729-a084966062c6',
},
{
  'image': 'asset/image/5.jpeg',
  'name': 'Alappuzha Gymkhana',
  'rating': '4.5',
  'duration': '2h 15m',
  'genre': 'Action',
  'coinCost': 3,
  'isUnlocked': false,
  'videoUrl':
      'https://firebasestorage.googleapis.com/v0/b/moviebooking-cb614.firebasestorage.app/o/It%20was...%20mp4.mp4?alt=media&token=58034795-2696-4e59-89eb-4f44a91ea1ac',
},
{
  'image': 'asset/image/6.jpeg',
  'name': 'NO BIGGIE',
  'rating': '4.5',
  'duration': '2h 15m',
  'genre': 'Action',
  'coinCost': 3,
  'isUnlocked': false,
  'videoUrl':
      'https://firebasestorage.googleapis.com/v0/b/moviebooking-cb614.firebasestorage.app/o/No%20biggie.mp4?alt=media&token=d068745d-4fa0-4027-91d4-3c4e64e25f7f',
}
  ];

  List<Map<String, dynamic>> movielist = [
    {
      'image': 'asset/image/7.jpeg',
      'name': 'Alappuzha Gymkhana',
      'rating': '4.5',
      'duration': '2h 15m',
      'genre': 'Action',
      'videoUrl':
          'https://firebasestorage.googleapis.com/v0/b/moviebooking-cb614.firebasestorage.app/o/gymkana.mp4?alt=media&token=c339bfb4-c2d1-4437-ae49-2bcdff7a5cd2',
    },
    {
      'image': 'asset/image/3.jpeg',
      'name': 'Deadpool vs Wolverine',
      'rating': '4.2',
      'duration': '1h 45m',
      'genre': 'Comedy',
      'videoUrl':
          'https://firebasestorage.googleapis.com/v0/b/moviebooking-cb614.firebasestorage.app/o/gymkana.mp4?alt=media&token=c339bfb4-c2d1-4437-ae49-2bcdff7a5cd2',
    },
    {
    'image': 'asset/image/2.jpeg',
      'name': 'Man of Steel',
      'rating': '4.8',
      'duration': '2h 10m',
      'genre': 'Sci-Fi',
      'videoUrl':
          'https://firebasestorage.googleapis.com/v0/b/moviebooking-cb614.firebasestorage.app/o/trailerrr.mp4?alt=media&token=7a37e48d-ff7e-4efc-a064-991e27fc7e2f',
    },
    {
  'image': 'asset/image/4.jpeg',
  'name': 'Take it off...',
  'rating': '4.5',
  'duration': '2h 15m',
  'genre': 'Action',
  'coinCost': 3,
  'isUnlocked': false,
  'videoUrl':
      'https://firebasestorage.googleapis.com/v0/b/moviebooking-cb614.firebasestorage.app/o/Take%20it%20off...%20mp4.mp4?alt=media&token=503a6acc-c4dd-466a-84b1-75d930f21fa5',
},
{
 'image': 'asset/image/5.jpeg',
  'name': 'That adrenaline rush ',
  'rating': '4.5',
  'duration': '2h 15m',
  'genre': 'Action',
  'coinCost': 3,
  'isUnlocked': false,
  'videoUrl':
      'https://firebasestorage.googleapis.com/v0/b/moviebooking-cb614.firebasestorage.app/o/That%20adrenaline%20rush%20.mp4?alt=media&token=b42f9efe-29bc-4fde-b842-d1050e7726be',
},
{
 'image': 'asset/image/6.jpeg',
  'name': 'there\'s no use...',
  'rating': '4.5',
  'duration': '2h 15m',
  'genre': 'Action',
  'coinCost': 3,
  'isUnlocked': false,
  'videoUrl':
      'https://firebasestorage.googleapis.com/v0/b/moviebooking-cb614.firebasestorage.app/o/There%27s%20no%20use%E2%80%A6%20mp4.mp4?alt=media&token=d596ddf4-847c-4cb1-9695-e36a0f111a5e',
},
{
  'image': 'asset/image/7.jpeg',
  'name': '`Twisted situation you didn’t see coming...`',
  'rating': '4.5',
  'duration': '2h 15m',
  'genre': 'Action',
  'coinCost': 3,
  'isUnlocked': false,
  'videoUrl':
      'https://firebasestorage.googleapis.com/v0/b/moviebooking-cb614.firebasestorage.app/o/Twisted%20situation%20you%20didn%E2%80%99t%20see%20coming...%20.mp4?alt=media&token=b5173bc4-55e8-4f4e-887f-d02a6a964246',
},
{
  'image': 'asset/image/1.jpeg',
  'name': 'You misunderstood...',
  'rating': '4.5',
  'duration': '2h 15m',
  'genre': 'Action',
  'coinCost': 3,
  'isUnlocked': false,
  'videoUrl':
      'https://firebasestorage.googleapis.com/v0/b/moviebooking-cb614.firebasestorage.app/o/You%20misunderstood...%20mp4.mp4?alt=media&token=fe0f3dc0-d7c7-4f04-b594-4e58f23b1e3f',
}





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
    filteredSuggestions = categories; // show all by default
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
              // Search
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

              // Suggestions
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

              // Carousel
              CarouselSlider(
                options: CarouselOptions(
                  height: 300.0, // Increased height
                  autoPlay: true,
                  enlargeCenterPage: true,
                  viewportFraction: 0.5, // Decreased width
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
                              // Match viewportFraction width and carousel height
                              width: MediaQuery.of(context).size.width * 0.5,
                              height: 300,
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
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    movie['name'],
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Row(
                                    children: [
                                      Icon(Icons.star,
                                          color: Colors.yellow[700], size: 16),
                                      const SizedBox(width: 4),
                                      Text(movie['rating'],
                                          style: const TextStyle(
                                              color: Colors.yellow)),
                                      const SizedBox(width: 10),
                                      Text(
                                        '${movie['coinCost']} Coins',
                                        style: const TextStyle(
                                            color: Colors.red,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(width: 6),
                                      const Icon(Icons.schedule,
                                          color: Colors.white70, size: 16),
                                      const SizedBox(width: 4),
                                     
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

              // Genres
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

              // Top Picks with Watch + image fill
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
  children: movielist.asMap().entries.map((entry) {
    final int index = entry.key;               // <-- index available now
    final Map<String, dynamic> movie = entry.value;

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
        child: Stack(
          children: [
            // Poster fills the entire tile
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: SizedBox.expand(
                child: Image.asset(
                  movie['image'],
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Center play overlay
            Center(
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: Colors.black54,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                  size: 32,
                ),
              ),
            ),

            // Bottom gradient info + Watch button
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Colors.black87],
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            movie['name'],
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Row(
                            children: [
                              Icon(Icons.star,
                                  color: Colors.yellow[700], size: 14),
                              const SizedBox(width: 4),
                              Text(
                                movie['rating'],
                                style: const TextStyle(
                                    color: Colors.yellow, fontSize: 12),
                              ),
                               
                              
                              const SizedBox(width: 8),
                              const Icon(Icons.schedule,
                                  color: Colors.white70, size: 12),
                              const SizedBox(width: 4),
                               Text(
                                        '${movie['coinCost']} Coins',
                                        style: const TextStyle(
                                            color: Colors.red,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600),
                                      ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        minimumSize: Size.zero,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => VideoPlayerScreen(
                              videoUrl: movie['videoUrl'],
                            ),
                          ),
                        );
                      },
                      child: const Text(
                        'Watch',
                        style: TextStyle(fontSize: 12, color: Colors.black),
                      ),
                    ),
                  ],
                ),
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
