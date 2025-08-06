import 'package:bookfilim/subsciption.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final darkColor = const Color(0xFF0E0C1D);
  final purpleAccent = const Color(0xFF6C3DF4);

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: ListView(
            children: [
              // Avatar & Name
              Center(
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.blueGrey[300],
                    ),
                    Positioned(
                      bottom: 4,
                      right: 4,
                      child: Container(
                        decoration: BoxDecoration(
                          color: purpleAccent,
                          shape: BoxShape.circle,
                        ),
                        padding: const EdgeInsets.all(6),
                        child: const Icon(Icons.edit,
                            color: Colors.white, size: 16),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              const Center(
                child: Text(
                  "Jamil Muchtar",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              const Center(
                child: Text(
                  "jamilmuchtar12@gmail.com",
                  style: TextStyle(fontSize: 14, color: Colors.white60),
                ),
              ),
              const SizedBox(height: 24),

              // Quick Actions
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildActionCard(Icons.bookmark, "Bookmark"),
                  buildActionCard(Icons.refresh, "History"),
                  buildActionCard(Icons.bar_chart, "Statistics"),
                ],
              ),
              const SizedBox(height: 24),

              // Membership Section
              const Text("Membership",
                  style: TextStyle(color: Colors.white, fontSize: 18)),
              const SizedBox(height: 12),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => SubscriptionScreen()));
                },
                child: buildTile(
                  title: "Monthly Subscriptions",
                  subtitle: "Subscription until June 14 2021",
                ),
              ),
              const SizedBox(height: 24),

              // Billing Section
              const Text("Bills & Payment",
                  style: TextStyle(color: Colors.white, fontSize: 18)),
              const SizedBox(height: 12),
              buildTile(
                title: "Billing Details",
                subtitle: "VISA •••• •••• 1902",
              ),

              const Divider(height: 40, color: Colors.white24),

              // Account Section
              const Text("Account & Security",
                  style: TextStyle(color: Colors.white, fontSize: 18)),
              const SizedBox(height: 12),
              buildTile(
                title: "Your Account",
                subtitle: "Account settings, change number",
              ),

             
            ],
          ),
        ),
      ),
    );
  }

  Widget buildActionCard(IconData icon, String label) {
    return Container(
      width: 90,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1B2E),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Icon(icon, size: 28, color: Colors.white),
          const SizedBox(height: 8),
          Text(label,
              style: const TextStyle(color: Colors.white, fontSize: 13)),
        ],
      ),
    );
  }

  Widget buildTile({required String title, required String subtitle}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1B2E),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(color: Colors.white, fontSize: 15)),
                const SizedBox(height: 4),
                Text(subtitle,
                    style:
                        const TextStyle(color: Colors.white54, fontSize: 13)),
              ],
            ),
          ),
          const Icon(Icons.arrow_forward_ios, color: Colors.white38, size: 16)
        ],
      ),
    );
  }
}