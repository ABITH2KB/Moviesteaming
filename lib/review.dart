import 'package:flutter/material.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  final background = const Color(0xFF0E0C1D);

  // Sample review data with daysAgo for sorting
  List<Map<String, dynamic>> reviews = [
    {
      "name": "Ayesha",
      "rating": 5,
      "comment": "Absolutely stunning visuals and a gripping story!",
      "daysAgo": 2
    },
    {
      "name": "Ravi",
      "rating": 4,
      "comment": "Great direction and acting. Some parts were slow.",
      "daysAgo": 5
    },
    {
      "name": "Sneha",
      "rating": 3,
      "comment": "Average plot but excellent cinematography.",
      "daysAgo": 10
    },
     {
      "name": "sheethal",
      "rating": 4,
      "comment": "Average plot but excellent cinematography.",
      "daysAgo": 40
    },
  ];

  String selectedSort = "Newest First";

  void _sortReviews() {
    setState(() {
      if (selectedSort == "Newest First") {
        reviews.sort((a, b) => a["daysAgo"].compareTo(b["daysAgo"]));
      } else {
        reviews.sort((a, b) => b["daysAgo"].compareTo(a["daysAgo"]));
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _sortReviews(); // Initial sort
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: const Text("Reviews"),
        backgroundColor: background,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Overall Rating
            const Text(
              "4.3 / 5",
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: List.generate(5, (index) {
                return Icon(
                  index < 4 ? Icons.star : Icons.star_half,
                  color: Colors.amber,
                  size: 28,
                );
              }),
            ),

            const SizedBox(height: 24),

            // Filter Dropdown
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "User Reviews",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                DropdownButton<String>(
                  value: selectedSort,
                  dropdownColor: background,
                  style: const TextStyle(color: Colors.white),
                  iconEnabledColor: Colors.white,
                  underline: Container(height: 0),
                  items: [
                    "Newest First",
                    "Oldest First",
                  ].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value, style: const TextStyle(fontSize: 14)),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedSort = value!;
                      _sortReviews();
                    });
                  },
                )
              ],
            ),
            const SizedBox(height: 12),

            // Reviews List
            Expanded(
              child: ListView.builder(
                itemCount: reviews.length,
                itemBuilder: (context, index) {
                  final review = reviews[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1A182B),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Reviewer info with icon and days ago
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.account_circle,
                                    color: Colors.white70, size: 20),
                                const SizedBox(width: 6),
                                Text(
                                  review["name"],
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  "• ${review["daysAgo"]} days ago",
                                  style: const TextStyle(
                                    color: Colors.white54,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            // Star rating
                            Row(
                              children: List.generate(5, (i) {
                                return Icon(
                                  i < review["rating"]
                                      ? Icons.star
                                      : Icons.star_border,
                                  color: Colors.amber,
                                  size: 18,
                                );
                              }),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          review["comment"],
                          style: const TextStyle(
                              color: Colors.white70, fontSize: 14),
                        ),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
