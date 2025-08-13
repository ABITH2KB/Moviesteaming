import 'package:flutter/material.dart';

class SubscriptionScreen extends StatelessWidget {
  final Color darkBg = const Color(0xFF0E0C1D);
  final Color cardBg = const Color(0xFF1E1B2E);
  final Color highlightGradientStart = const Color(0xFF8942F4);
  final Color highlightGradientEnd = const Color(0xFF6C3DF4);

  const SubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBg,
      appBar: AppBar(
        backgroundColor: darkBg,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title:
            const Text("Subscriptions", style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            const Text(
              "Watch all you want.\nChange or cancel your plan anytime.",
              style: TextStyle(color: Colors.white, fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            buildPlanCard(
              title: "Basic",
              price: "\₹4.99/month",
              features: [
                "480p Resolution",
                "Ad-free streaming",
                "Unlimited movies & TV Shows",
                "Watch in Phone, Tablet"
              ],
              isHighlighted: false,
            ),
            const SizedBox(height: 16),
            buildPlanCard(
              title: "Standard",
              price: "\₹6.99/month",
              features: [
                "1080p Resolution",
                "Ad-free streaming",
                "Unlimited movies & TV Shows",
                "Watch in Phone, Tablet, TV"
              ],
              isHighlighted: true,
            ),
            const SizedBox(height: 16),
            buildPlanCard(
              title: "Premium",
              price: "\₹8.99/month",
              features: [
                "4K+ HDR",
                "Ad-free streaming",
                "Unlimited movies & TV Shows",
                "Watch in all devices"
              ],
              isHighlighted: false,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPlanCard({
    required String title,
    required String price,
    required List<String> features,
    bool isHighlighted = false,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: isHighlighted
            ? LinearGradient(
                colors: [highlightGradientStart, highlightGradientEnd],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
            : null,
        color: isHighlighted ? null : cardBg,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(color: Colors.white, fontSize: 18)),
          const SizedBox(height: 6),
          Text(price,
              style: const TextStyle(color: Colors.white70, fontSize: 16)),
          const Divider(color: Colors.white24, height: 20),
          ...features.map(
            (feature) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Row(
                children: [
                  const Icon(Icons.check_circle, color: Color(0xFFB46DFF), size: 18),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      feature,
                      style: const TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}