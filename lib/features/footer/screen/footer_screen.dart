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
              ? _desktopLayout(isDesktop)
              : isTablet
              ? _tabletLayout(isDesktop)
              : _mobileLayout(isDesktop),
        );
      },
    );
  }

  // ================= DESKTOP =================

  Widget _desktopLayout(bool isDesktop) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(flex: 2, child: _aboutSection(isDesktop)),
        Expanded(flex: 2, child: _contactSection(isDesktop)),
        Expanded(flex: 2, child: _socialSection(isDesktop)),
      ],
    );
  }

  // ================= TABLET =================

  Widget _tabletLayout(bool isDesktop) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _aboutSection(isDesktop),
        const SizedBox(height: 40),
        _contactSection(isDesktop),
        const SizedBox(height: 40),
        _socialSection(isDesktop),
      ],
    );
  }

  // ================= MOBILE =================

  Widget _mobileLayout(bool isDesktop) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _aboutSection(isDesktop),
        const SizedBox(height: 30),
        _contactSection(isDesktop),
        const SizedBox(height: 30),
        _socialSection(isDesktop),
      ],
    );
  }

  // ================= ABOUT =================

  Widget _aboutSection(bool isDesktop) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:  [
        Text(
          "Montor",
          style: TextStyle(
            fontSize: isDesktop ?48:30,
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
              fontSize: isDesktop ?16:14,
              height: 1.6,
              color:Colors.grey.shade700,
            ),
          ),
        ),
      ],
    );
  }

  // ================= CONTACT =================

  Widget _contactSection(bool isDesktop) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text(
          "GET IN TOUCH WITH US",
          style: TextStyle(
            fontSize: isDesktop ?20:16,
            fontWeight: FontWeight.bold,
            color: Colors.deepOrangeAccent,
          ),
        ),
        const SizedBox(height: 25),
        _contactItem(Icons.location_on,
            "Madhya Pradesh, India"),
        const SizedBox(height: 20),
        _contactItem(Icons.phone, "+91 8989207770"),
        const SizedBox(height: 20),
        _contactItem(Icons.email, "errorfalse.tech@gmail.com"),
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

  Widget _socialSection(bool isDesktop) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text(
          "OUR SOCIAL MEDIA",
          style: TextStyle(
            fontSize: isDesktop ?20:16,
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

         Text(
          "NEWSLETTER",
          style: TextStyle(
            fontSize: isDesktop ?20:16,
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
