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
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            // --------- TOP TAG ----------
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.deepOrangeAccent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                "ERROR FALSE",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 16),

            // --------- TITLE ----------
            RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.black),
                children: [
                  TextSpan(text: "How Professional IT Services\nCan Drive "),
                  TextSpan(
                    text: "Success.",
                    style: TextStyle(color: Colors.deepOrangeAccent),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            GridView.count(
              crossAxisCount: screenWidth >= 700 ? 4 : 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 40),
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: screenWidth >= 700 ? 0.75:0.5,
              children: [

                serviceCard("assets/it.jpg", "IT Management"),
                serviceCard("assets/marketing.jpg", "Digital Marketing"),
                serviceCard("assets/web.jpg", "Web Development"),
                serviceCard("assets/app.jpg", "App Development"),

              ],
            ),
          ],
        ),
        SizedBox(height: 100,),

        Column(
          children: [

            // ---- TOP SMALL TAG ----
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.orange.withOpacity(0.12),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                "OUR TEAM MEMBER",
                style: TextStyle(
                  color: Colors.orange,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            const SizedBox(height: 16),

            // ---- TITLE ----
            const Text(
              "Dedicated Team Members",
              style: TextStyle(
                fontSize: 38,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 40),

            // ---- TEAM GRID ----
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: screenWidth > 900 ? 4 : 2,
              padding: const EdgeInsets.symmetric(horizontal: 40),
              mainAxisSpacing: 24,
              crossAxisSpacing: 24,
              childAspectRatio: 0.8,
              children: [

                teamCard(
                  "https://randomuser.me/api/portraits/men/32.jpg",
                ),

                teamCard(
                  "https://randomuser.me/api/portraits/women/44.jpg",
                ),

                teamCard(
                  "https://randomuser.me/api/portraits/women/65.jpg",
                ),

                teamCard(
                  "https://randomuser.me/api/portraits/men/78.jpg",
                ),
              ],
            ),
          ],
        ),

        SizedBox(height: 100,),



        SizedBox(height: 100,),
      ],
    );
  }
}

Widget serviceCard(String image, String title) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(18),
      boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 10,
          offset: Offset(0, 4),
        )
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        // Image
        Container(
          height: 200,
          decoration: BoxDecoration(
            color: Colors.grey.shade400,
            borderRadius: BorderRadius.circular(18),
          ),
        ),

        const SizedBox(height: 14),

        // Icon circle
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          height: 50,
          width: 50,
          decoration: const BoxDecoration(
            color: Colors.orange,
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.settings, color: Colors.white),
        ),

        const SizedBox(height: 12),

        // Title
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        const SizedBox(height: 8),

        // Description
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "Marketing repurpose success tech sapien maximus design.",
            style: TextStyle(color: Colors.grey),
          ),
        ),
      ],
    ),
  );
}

Widget teamCard(String? imageUrl) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(22),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 12,
          offset: Offset(0, 4),
        )
      ],
    ),
    child: Stack(
      children: [

        // IMAGE WITH NULL HANDLE
        ClipRRect(
          borderRadius: BorderRadius.circular(22),
          child: imageUrl == null || imageUrl.isEmpty
              ? placeholderImage()
              : Image.network(
            imageUrl,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,

            // if network fails
            errorBuilder: (context, error, stackTrace) {
              return placeholderImage();
            },

            // loading effect
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return const Center(
                child: CircularProgressIndicator(strokeWidth: 2),
              );
            },
          ),
        ),

        // TOP ORANGE LINE
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            height: 5,
            decoration: const BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(22),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget placeholderImage() {
  return Container(
    width: double.infinity,
    height: double.infinity,
    color: Colors.grey.shade200,
    child: const Icon(
      Icons.person,
      size: 80,
      color: Colors.grey,
    ),
  );
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