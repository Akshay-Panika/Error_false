import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

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
              ? _desktopLayout(context,isDesktop)
              : isTablet
              ? _tabletLayout(context,isDesktop)
              : _mobileLayout(context,isDesktop),
        );
      },
    );
  }

  // ================= DESKTOP =================

  Widget _desktopLayout(BuildContext context,bool isDesktop) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(flex: 2, child: _aboutSection(isDesktop)),
        Expanded(flex: 2, child: _contactSection(context,isDesktop)),
        Expanded(flex: 2, child: _socialSection(isDesktop)),
      ],
    );
  }

  // ================= TABLET =================

  Widget _tabletLayout(BuildContext context, bool isDesktop) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _aboutSection(isDesktop),
        const SizedBox(height: 40),
        _contactSection(context,isDesktop),
        const SizedBox(height: 40),
        _socialSection(isDesktop),
      ],
    );
  }

  // ================= MOBILE =================

  Widget _mobileLayout(BuildContext context,bool isDesktop) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _aboutSection(isDesktop),
        const SizedBox(height: 30),
        _contactSection(context,isDesktop),
        const SizedBox(height: 30),
        _socialSection(isDesktop),
      ],
    );
  }

  // ================= ABOUT =================

  Widget _aboutSection(bool isDesktop) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Akshay Panika",
          style: TextStyle(
            fontSize: isDesktop ? 48 : 30,
            fontWeight: FontWeight.bold,
            color: Colors.deepOrangeAccent,
          ),
        ),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.only(right: 25),
          child: Text(
            "I am a passionate software developer focused on building modern, "
                "user-friendly, and scalable applications. I enjoy turning ideas into "
                "real-world digital products using technologies like Flutter and Django. "
                "My aim is to create efficient solutions that deliver great user "
                "experiences while continuously learning and improving my skills.",
            style: TextStyle(
              fontSize: isDesktop ? 16 : 14,
              height: 1.6,
              color: Colors.grey.shade700,
            ),
          ),
        ),
      ],
    );
  }

  // ================= CONTACT =================

  Widget _contactSection(BuildContext context,bool isDesktop) {
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
        InkWell(
            onTap: () {
              Clipboard.setData(
                const ClipboardData(text: "akshey.panika@gmail.com"),
              );
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  backgroundColor: Colors.deepOrangeAccent,
                  content: Text("Email copied to clipboard"),
                ),
              );
            },
            child: _contactItem(Icons.email, "akshey.panika@gmail.com")),
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _socialIcon(FontAwesomeIcons.linkedin, () {

              openUrl("https://www.linkedin.com/in/akshey-panika");
            }),
            _socialIcon(FontAwesomeIcons.github, () {
              openUrl("https://github.com/akshay-panika");
            }),
            _socialIcon(FontAwesomeIcons.instagram, () {
              openUrl("https://instagram.com/akshay_panika");
            }),
          ],
        ),

      ],
    );
  }

  Widget _socialIcon(IconData icon, VoidCallback onTap) {
    return Container(
      margin: const EdgeInsets.only(right: 15),
      child: InkWell(
        onTap: onTap,
        child: CircleAvatar(
          radius: 22,
          backgroundColor: Colors.deepOrangeAccent.withOpacity(0.16),
          child: Icon(icon, color: Colors.deepOrangeAccent),
        ),
      ),
    );
  }
}

Future<void> openUrl(String url) async {
  final Uri uri = Uri.parse(url);

  if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
    throw 'Could not launch $url';
  }
}