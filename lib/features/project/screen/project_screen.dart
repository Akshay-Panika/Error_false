import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ProjectScreen extends StatefulWidget {
  const ProjectScreen({super.key});

  @override
  State<ProjectScreen> createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {

  String selectedFilter = "SEE ALL";

  final List<Map<String, String>> projects = [
    {
      "image": "https://images.pexels.com/photos/3184291/pexels-photo-3184291.jpeg",
      "category": "MARKETING",
    },
    {
      "image": "https://images.pexels.com/photos/3182765/pexels-photo-3182765.jpeg",
      "category": "TECHNOLOGY",
    },
    {
      "image": "https://images.pexels.com/photos/3184291/pexels-photo-3184291.jpeg",
      "category": "HELPDESK",
    },
    {
      "image": "https://images.pexels.com/photos/3182765/pexels-photo-3182765.jpeg",
      "category": "ANALYSIS",
    },
    {
      "image": "https://images.pexels.com/photos/3184291/pexels-photo-3184291.jpeg",
      "category": "MARKETING",
    },
    {
      "image": "https://images.pexels.com/photos/3182765/pexels-photo-3182765.jpeg",
      "category": "TECHNOLOGY",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: const BoxDecoration(
                color: Colors.deepOrangeAccent,
              ),
              child: LayoutBuilder(
                builder: (context, constraints) {

                  bool isLargeScreen = constraints.maxWidth > 700;

                  // 3 items if large, 2 if small
                  double itemWidth = isLargeScreen
                      ? (constraints.maxWidth / 3) - 15
                      : (constraints.maxWidth / 2) - 15;

                  return Column(
                    children: [

                      const SizedBox(height: 40),

                      Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 8,
                        runSpacing: 10,
                        children: [

                          filterButton("SEE ALL"),
                          filterButton("TECHNOLOGY"),
                          filterButton("HELPDESK"),
                          filterButton("ANALYSIS"),
                          filterButton("MARKETING"),
                        ],
                      ),


                      const SizedBox(height: 40),

                      Wrap(
                        spacing: 15,
                        runSpacing: 15,
                        alignment: WrapAlignment.center,
                        children: [

                          buildResponsiveCard(itemWidth,
                              "https://images.pexels.com/photos/3184291/pexels-photo-3184291.jpeg"),

                          buildResponsiveCard(itemWidth,
                              "https://images.pexels.com/photos/3184291/pexels-photo-3184291.jpeg"),

                          buildResponsiveCard(itemWidth,
                              "https://images.pexels.com/photos/3182765/pexels-photo-3182765.jpeg"),

                          buildResponsiveCard(itemWidth,
                              "https://images.pexels.com/photos/3184291/pexels-photo-3184291.jpeg"),

                          buildResponsiveCard(itemWidth,
                              "https://images.pexels.com/photos/3184291/pexels-photo-3184291.jpeg"),

                          buildResponsiveCard(itemWidth,
                              "https://images.pexels.com/photos/3182765/pexels-photo-3182765.jpeg"),
                        ],
                      ),

                      const SizedBox(height: 20),
                    ],
                  );
                },
              ),
            ),

            SizedBox(height: 100,)

          ],
        ),
      ],
    );
  }
  Widget filterButton(String text) {
    bool isActive = selectedFilter == text;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedFilter = text;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
        margin: const EdgeInsets.symmetric(horizontal: 10,),
        decoration: BoxDecoration(
          color: isActive ? Colors.orange : Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 12,
            color: isActive ? Colors.white : Colors.grey,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

}

Widget buildResponsiveCard(double width, String imageUrl) {
  return SizedBox(
    width: width,
    child: projectCard(imageUrl),
  );
}


Widget projectCard(String imageUrl) {
  return LayoutBuilder(
    builder: (context, constraints) {

      bool isSmall = constraints.maxWidth < 350;

      double imageHeight = isSmall ? 220 : 320;
      double titleSize = isSmall ? 16 : 20;
      double categorySize = isSmall ? 12 : 14;
      double padding = isSmall ? 14 : 22;

      return Stack(
        clipBehavior: Clip.none,
        children: [

          // IMAGE
          ClipRRect(
            borderRadius: BorderRadius.circular(28),
            child: Image.network(
              imageUrl,
              width: double.infinity,
              height: imageHeight,
              fit: BoxFit.cover,
            ),
          ),

          // INFO BOX
          Positioned(
            bottom: -1,
            left: isSmall ? 12 : 30,
            right: isSmall ? 12 : 30,
            child: Container(
              padding: EdgeInsets.all(padding),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 12,
                    offset: Offset(0, 4),
                  )
                ],
              ),
              child: Row(
                children: [

                  // TEXT SIDE
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text(
                          "Marketing , Software",
                          style: TextStyle(
                            color: Colors.orange,
                            fontSize: categorySize,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        const SizedBox(height: 6),

                        Text(
                          "Business Growth Project",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: titleSize,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(width: 10),

                  // ARROW BUTTON
                  Container(
                    height: isSmall ? 34 : 42,
                    width: isSmall ? 34 : 42,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    },
  );
}
