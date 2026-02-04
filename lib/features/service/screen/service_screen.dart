import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ServiceScreen extends StatefulWidget {
  const ServiceScreen({super.key});

  @override
  State<ServiceScreen> createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {


  final _service = [
    {
      "name": "App Development",
      "des": "Mobile apps for Android & iOS",
    },
    {
      "name": "Web Development",
      "des": "Modern responsive websites",
    },
    {
      "name": "UI/UX Design",
      "des": "User friendly app & web designs",
    },
    {
      "name": "Backend Development",
      "des": "APIs and server side logic",
    },
    {
      "name": "Digital Marketing",
      "des": "SEO & online promotion",
    },
    {
      "name": "Graphic Design",
      "des": "Logos, banners & creatives",
    },
  ];

  @override
  Widget build(BuildContext context) {

    final dimensions = MediaQuery.of(context).size;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;



    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomCenter,
          children: [

            Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  height: screenWidth >= 700?500:800,
                  decoration: BoxDecoration(
                      color: Colors.deepOrangeAccent,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(screenWidth >= 700 ?20:0),
                        topRight: Radius.circular(screenWidth >= 700 ?20:0),
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      )
                  ),

                ),

                SizedBox(height: screenWidth >= 700?150:550),
              ],
            ),

            GridView.builder(
              itemCount: _service.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 50),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: screenWidth >= 700 ? 6 : 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1,
              ),
              itemBuilder: (context, index) {
                final list = _service[index];
                return _HoverTapCard(
                  title: list['name'].toString(),
                  subtitle: list['des'].toString(),
                );
              },
            ),

          ],
        ),
        SizedBox(height: 100,),
      ],
    );
  }
}


class _HoverTapCard extends StatefulWidget {
  final String title;
  final String subtitle;

  const _HoverTapCard({required this.title, required this.subtitle});

  @override
  State<_HoverTapCard> createState() => _HoverTapCardState();
}

class _HoverTapCardState extends State<_HoverTapCard> {
  bool _isHovered = false;
  bool _isTapped = false;

  @override
  Widget build(BuildContext context) {
    final bool isActive = _isHovered || _isTapped;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTapDown: (_) => setState(() => _isTapped = true),
        onTapUp: (_) => setState(() => _isTapped = false),
        onTapCancel: () => setState(() => _isTapped = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          decoration: BoxDecoration(
            color: isActive ? Colors.deepOrangeAccent : Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 6,
                offset: Offset(0, 4),
              ),
            ],
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 300),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: isActive ? Colors.white : Colors.black,
                ),
                child: Text(widget.title),
              ),
              const SizedBox(height: 8),
              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 300),
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: isActive ? Colors.white : Colors.grey.shade700,
                ),
                child: Text(widget.subtitle,textAlign: TextAlign.center,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}