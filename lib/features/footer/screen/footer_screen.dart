import 'package:flutter/material.dart';

class FooterScreen extends StatelessWidget {
  const FooterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isDesktop = constraints.maxWidth > 1000;
        bool isTablet =
            constraints.maxWidth > 600 && constraints.maxWidth <= 1000;

        return Container(
          width: double.infinity,
          color: Colors.deepOrangeAccent.withOpacity(0.16),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
          child: isDesktop
              ? _desktopLayout()
              : isTablet
              ? _tabletLayout()
              : _mobileLayout(),
        );
      },
    );
  }

  // ================= DESKTOP =================

  Widget _desktopLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(flex: 2, child: _aboutSection()),
        Expanded(flex: 2, child: _contactSection()),
        Expanded(flex: 2, child: _socialSection()),
      ],
    );
  }

  // ================= TABLET =================

  Widget _tabletLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _aboutSection(),
        const SizedBox(height: 40),
        _contactSection(),
        const SizedBox(height: 40),
        _socialSection(),
      ],
    );
  }

  // ================= MOBILE =================

  Widget _mobileLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _aboutSection(),
        const SizedBox(height: 30),
        _contactSection(),
        const SizedBox(height: 30),
        _socialSection(),
      ],
    );
  }

  // ================= ABOUT =================

  Widget _aboutSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:  [
        Text(
          "Montor",
          style: TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.bold,
            color: Colors.deepOrangeAccent,
          ),
        ),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.only(right: 25),
          child: Text(
            "Montor is committed to providing reliable and innovative medical "
                "solutions to enhance patient care. Our goal is to ensure better "
                "health outcomes with advanced technology and trusted expertise. "
                "Providing trusted medical solutions for a healthier tomorrow.",
            style: TextStyle(
              fontSize: 16,
              height: 1.6,
              color:Colors.grey.shade700,
            ),
          ),
        ),
      ],
    );
  }

  // ================= CONTACT =================

  Widget _contactSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "GET IN TOUCH WITH US",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.deepOrangeAccent,
          ),
        ),
        const SizedBox(height: 25),
        _contactItem(Icons.location_on,
            "8819 Ohio South Gate, CA 90280"),
        const SizedBox(height: 20),
        _contactItem(Icons.phone, "+1 386-688-3295"),
        const SizedBox(height: 20),
        _contactItem(Icons.email, "info@montor.com"),
      ],
    );
  }

  Widget _contactItem(IconData icon, String text) {
    return Row(
      children: [
        CircleAvatar(
          radius: 22,
          backgroundColor: Colors.deepOrangeAccent.withOpacity(0.1),
          child: Icon(icon, color: Colors.deepOrangeAccent),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: Text(
            text,
            style:  TextStyle(
              fontSize: 16,
              color: Colors.grey.shade700,
            ),
          ),
        ),
      ],
    );
  }

  // ================= SOCIAL =================

  Widget _socialSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "OUR SOCIAL MEDIA",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color:Colors.deepOrangeAccent,
          ),
        ),
        const SizedBox(height: 25),

        Row(
          children: [
            _socialIcon(Icons.facebook),
            _socialIcon(Icons.circle),
            _socialIcon(Icons.close), // X icon
            _socialIcon(Icons.camera_alt), // Instagram placeholder
          ],
        ),

        const SizedBox(height: 35),

        const Text(
          "NEWSLETTER",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.deepOrangeAccent,
          ),
        ),

        const SizedBox(height: 20),

        Container(
          height: 55,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: Colors.deepOrangeAccent.withOpacity(0.16),
          ),
          child: Row(
            children: [
              const SizedBox(width: 20),
               Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Input your email here",
                    border: InputBorder.none,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: const Icon(
                  Icons.send,
                  color: Colors.deepOrangeAccent,
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _socialIcon(IconData icon) {
    return Container(
      margin: const EdgeInsets.only(right: 15),
      child: CircleAvatar(
        radius: 22,
        backgroundColor: Colors.deepOrangeAccent.withOpacity(0.16),
        child: Icon(icon, color: Colors.deepOrangeAccent),
      ),
    );
  }
}
