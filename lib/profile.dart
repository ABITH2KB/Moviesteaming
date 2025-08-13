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
             
              const SizedBox(height: 8),

             
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
                  "Razal Ali",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              const Center(
                child: Text(
                  "Razal@gmail.com",
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => SubscriptionScreen()),
                  );
                },
                child: buildTile(
                  title: "Monthly Subscriptions",
                  subtitle: "Subscription until June 14 2026",
                ),
              ),
              const SizedBox(height: 24),

              // Billing Section
              const Text("Bills & Payment",
                  style: TextStyle(color: Colors.white, fontSize: 18)),
              const SizedBox(height: 12),
              buildTile(
                title: "Billing Details",
                subtitle: "",
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

              const SizedBox(height: 16),

              // Legal -> popup
              const Text("Legal",
                  style: TextStyle(color: Colors.white, fontSize: 18)),
              const SizedBox(height: 12),
              buildClickableTile(
                title: "Terms & Conditions",
                subtitle: "Tap to view full policy",
                onTap: () => showPolicyModal(context),
              ),
              const SizedBox(height: 17),
              // NEW: Monetization & Payment Policy
              buildClickableTile(
                title: "Monetization & Payment Policy",
                subtitle: "Tap to view subscriptions, payments & retries",
                onTap: () => showMonetizationPolicyModal(context),
              ),SizedBox(height: 20),
              Center(
                child: Text('Ignivox tech Pvt. Ltd. ',
                        style: TextStyle(
                          color: Colors.white38,
                          fontSize: 12,
                        )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ===== UI helpers =====

  Widget buildActionCard(IconData icon, String label) {
    return Container(
      width: 100,
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
                Text(
                  subtitle,
                  style: const TextStyle(color: Colors.white54, fontSize: 13),
                ),
              ],
            ),
          ),
          const Icon(Icons.arrow_forward_ios, color: Colors.white38, size: 16)
        ],
      ),
    );
  }

  Widget buildClickableTile({
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: buildTile(title: title, subtitle: subtitle),
    );
  }

  // ===== POPUP SHEET: Terms & Conditions =====

  void showPolicyModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: const Color(0xFF1E1B2E),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) {
        return SafeArea(
          top: false,
          child: DraggableScrollableSheet(
            expand: false,
            initialChildSize: 0.9,
            minChildSize: 0.5,
            maxChildSize: 0.95,
            builder: (context, scrollController) {
              return Column(
                children: [
                  // Optional header logo
                  Image.asset(
                    'asset/image/removedbg.png', // <- change to your logo path
                    height: 138,
                    fit: BoxFit.contain,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
                    child: Row(
                      children: const [
                        Expanded(
                          child: Text(
                            "Terms & Conditions",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(height: 1, color: Colors.white12),

                  // Scrollable content
                  Expanded(
                    child: SingleChildScrollView(
                      controller: scrollController,
                      padding: const EdgeInsets.fromLTRB(16, 14, 16, 24),
                      child: buildTermsAndRefundPolicy(),
                    ),
                  ),

                  // Close button row
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      icon: const Icon(Icons.close, color: Colors.white70),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }

  // ===== POPUP SHEET: Monetization & Payment Policy (NEW) =====

  void showMonetizationPolicyModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: const Color(0xFF1E1B2E),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) {
        return SafeArea(
          top: false,
          child: DraggableScrollableSheet(
            expand: false,
            initialChildSize: 0.9,
            minChildSize: 0.5,
            maxChildSize: 0.95,
            builder: (context, scrollController) {
              return Column(
                children: [
                  // Optional header logo
                  Image.asset(
                    'asset/image/removedbg.png', // <- same logo if you like
                    height: 138,
                    fit: BoxFit.contain,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
                    child: Row(
                      children: const [
                        Expanded(
                          child: Text(
                            "Monetization & Payment Policy",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(height: 1, color: Colors.white12),

                  // Scrollable content
                  Expanded(
                    child: SingleChildScrollView(
                      controller: scrollController,
                      padding: const EdgeInsets.fromLTRB(16, 14, 16, 24),
                      child: buildMonetizationPaymentPolicy(),
                    ),
                  ),

                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      icon: const Icon(Icons.close, color: Colors.white70),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  Text('Ignivox tech Pvt. Ltd.',
                      style: TextStyle(
                        color: Colors.white38,
                        fontSize: 12,
                      )),
                ],
              );
            },
          ),
        );
      },
    );
  }

  // ===== Legal content: Terms & Refund (existing) =====

  Widget buildTermsAndRefundPolicy() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildPolicySection("Subscriptions & Billing", [
          "Subscriptions are personal and auto-renew at the end of each billing cycle unless cancelled at least 24 hours before renewal.",
          "Billing currency is INR. Applicable taxes (e.g., GST) may be added to the displayed price.",
          "Cancel anytime from Your Account; access continues until the end of the paid period.",
          "We may change prices or plans with prior notice; changes apply on your next billing cycle."
        ]),
        buildPolicySection("Coins & In-App Purchases", [
          "Coins are a virtual good used to unlock or rent content/features inside the app.",
          "Coins have no monetary value outside the app, are non-transferable, and cannot be redeemed for cash.",
          "Promotional or bonus coins may have expiry dates and usage limits stated at the time of offer."
        ]),
        buildPolicySection("Refund & Fund Policies", [
          "We do not provide refunds for consumed coins, already-streamed/rented titles, or partially used subscription periods.",
          "Refunds are considered only in limited cases: duplicate charges, accidental double purchase of the same item, failed playback or unavailable content within 24 hours of purchase, or unauthorized transactions (with supporting evidence).",
          "How to request: contact support with your transaction ID within 48 hours of charge.",
          "Resolution timeline: we typically process outcomes within 7 working days; approved refunds are returned to the original payment method within 5–7 business days.",
          "If a payment succeeds but content is not delivered/accessible due to our systems, we will either restore access or issue a refund/coin reversal.",
          "Where required by law, pro-rata refunds may be issued at our discretion."
        ]),
        buildPolicySection("Trials & Promotions", [
          "Free trials convert to paid plans automatically unless cancelled before trial end.",
          "Promotional offers are one-time and non-transferable, and may be withdrawn or modified at any time."
        ]),
        buildPolicySection("Content & License", [
          "You receive a limited, non-exclusive, non-transferable license to stream for personal, non-commercial use.",
          "DRM, geo-blocking, and device restrictions may apply; catalog may change without prior notice.",
          "Recording, rebroadcasting, public performance, or sharing of account access is prohibited."
        ]),
        buildPolicySection("Acceptable Use", [
          "Do not circumvent DRM, attempt unauthorized downloads, or use screen-recording to copy content.",
          "Do not upload/post content that is illegal, infringing, or harmful, or violate community guidelines.",
          "We may suspend or terminate accounts for violations."
        ]),
        buildPolicySection("Streaming & Device Limits", [
          "Concurrent streams and device limits depend on your plan; network/data charges are your responsibility.",
          "Video quality adapts to bandwidth and device capabilities."
        ]),
        buildPolicySection("Downloads & Offline Viewing", [
          "If enabled, offline downloads are tied to your account and device, may expire, and are not shareable/exportable.",
          "Access to downloads requires an active plan (and periodic online verification)."
        ]),
        buildPolicySection("Account & Security", [
          "Keep your login credentials confidential; you are responsible for activity under your account.",
          "Notify us immediately if you suspect unauthorized use."
        ]),
        buildPolicySection("Termination", [
          "You may stop using the service at any time. We may suspend or terminate for legal/compliance reasons or for policy violations.",
          "Upon termination, unused promotional coins may be forfeited."
        ]),
        buildPolicySection("Disclaimers & Liability", [
          "Service is provided on an 'as-is' and 'as-available' basis. We do not guarantee uninterrupted or error-free service.",
          "To the maximum extent permitted by law, our aggregate liability is limited to the amount you paid in the 3 months preceding the claim."
        ]),
        buildPolicySection("Governing Law & Disputes", [
          "These terms are governed by the laws of India.",
          "Courts at Bengaluru, Karnataka shall have exclusive jurisdiction, subject to any mandatory consumer protection laws."
        ]),
        buildPolicySection("Contact", [
          "Support: support@movieq.com",
          "Address: Your Company Name, Registered Office, Bengaluru, Karnataka, India."
        ]),
        const SizedBox(height: 8),
        const Text( 
          "Last updated: 13 Aug 2025 @ignivox",
          style: TextStyle(color: Colors.white38, fontSize: 12),
        ),
          Text('Ignivox tech Pvt. Ltd.',
                      style: TextStyle(
                        color: Colors.white38,
                        fontSize: 12,
                      )),
      ],
    );
  }

  // ===== NEW: Monetization & Payment Policy content =====

  Widget buildMonetizationPaymentPolicy() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Monetization & Payment Policy\n(For OTT Streaming Platform)",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w700,
            height: 1.3,
          ),
        ),
        const SizedBox(height: 12),

        const Text(
          "1. Subscription & Billing Policy",
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),

        // 1.1 Subscription Plans
        buildPolicySection("1.1 Subscription Plans", [
          "Our platform offers multiple subscription tiers, including but not limited to:",
          "Monthly and Annual plans",
          "Pay-per-view for select titles",
          "Ad-supported free tier (if available)",
          "Full details, including features, pricing, and validity, are available on the Subscription page in the app and may change from time to time.",
        ]),

        // 1.2 Billing Cycle
        buildPolicySection("1.2 Billing Cycle", [
          "Subscriptions are billed in advance on a recurring basis (e.g., monthly, annually) depending on the chosen plan.",
          "Your billing date is based on the day you purchase your subscription.",
        ]),

        // 1.3 Auto-Renewal Terms
        buildPolicySection("1.3 Auto-Renewal Terms", [
          "Subscriptions automatically renew unless cancelled at least 24 hours before the renewal date.",
          "Renewal will be charged at the then-current subscription price.",
          "Auto-renewal can be turned off via your account settings or your payment provider’s subscription management tool (e.g., Google Play, Apple App Store).",
        ]),

        // 1.4 Payment Methods
        buildPolicySection("1.4 Payment Methods", [
          "We accept the following payment methods:",
          "UPI (Unified Payments Interface)",
          "Debit/Credit Cards (Visa, Mastercard, RuPay, Amex)",
          "Net Banking",
          "Mobile Wallets (Paytm, PhonePe, Google Pay, etc.)",
          "International Payment Gateways (where available)",
          "Cryptocurrency (only if supported in your region)",
          "All payments are processed securely through certified payment gateways compliant with PCI-DSS standards.",
        ]),

        // 1.5 Failed Payment Handling
        buildPolicySection("1.5 Failed Payment Handling", [
          "If your payment fails, you will receive three (3) retry attempts within 7 days.",
          "Access to premium content may be suspended until successful payment.",
          "After repeated failures, your subscription may be cancelled and require reactivation.",
        ]),

        const SizedBox(height: 8),
        const Text(
          "Last updated: 13 Aug 2025 @ignivox ",
          style: TextStyle(color: Colors.white38, fontSize: 12),
        ),
      ],
    );
  }

  // ===== shared policy helpers =====

  Widget buildPolicySection(String title, List<String> bullets) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(
                  color: Colors.white, fontSize: 15, fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          ...bullets.map((b) => policyBullet(b)).toList(),
        ],
      ),
    );
  }

  Widget policyBullet(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("•  ",
              style: TextStyle(color: Colors.white70, height: 1.4)),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(color: Colors.white70, height: 1.4),
            ),
          ),
        ],
      ),
    );
  }
}
