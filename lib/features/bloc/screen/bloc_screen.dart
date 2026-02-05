import 'package:flutter/material.dart';

class BlocScreen extends StatefulWidget {
  const BlocScreen({super.key});

  @override
  State<BlocScreen> createState() => _BlocScreenState();
}

class _BlocScreenState extends State<BlocScreen> {


  final List<Map<String, String>> services = [
    {
      "title": "Custom Web Application Development",
      "desc":
      "We design and develop scalable, secure, and high-performance web platforms tailored to business needs using modern technologies and cloud infrastructure."
    },
    {
      "title": "Mobile App Solutions",
      "desc":
      "End-to-end mobile app development for Android and iOS including UI/UX design, backend integration, and performance optimization."
    },
    {
      "title": "Office Management Systems",
      "desc":
      "Digital office automation tools including employee management, attendance systems, ERP solutions, and workflow optimization platforms."
    },
    {
      "title": "Cloud Hosting & DevOps Services",
      "desc":
      "Reliable cloud hosting, server monitoring, CI/CD pipelines, data backup, and security management for enterprise applications."
    },
    {
      "title": "IT Support & Maintenance",
      "desc":
      "24/7 technical support, system maintenance, software updates, bug fixing, and performance monitoring for smooth operations."
    },
    {
      "title": "Digital Marketing & SEO",
      "desc":
      "Professional marketing services including SEO optimization, social media management, paid advertising, and brand growth strategies."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 80),
          margin: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.deepOrangeAccent,
            borderRadius: BorderRadius.circular(20),
          ),
          child: buildServiceUI(), // Always show services
        ),

        SizedBox(height: 100,),
      ],
    );
  }



  Widget buildServiceUI() {
    return LayoutBuilder(
      builder: (context, constraints) {

        double width = constraints.maxWidth;

        int columnCount = width > 1100
            ? 3
            : width > 700
            ? 2
            : 1;

        double cardWidth =
            (width - ((columnCount - 1) * 24)) / columnCount;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text(
              "Our Professional IT Services",
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            const Text(
              "We deliver innovative digital solutions to help businesses scale efficiently.",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),

            const SizedBox(height: 50),

            Wrap(
              spacing: 24,
              runSpacing: 24,
              children: services.map((service) {

                return SizedBox(
                  width: cardWidth,
                  child: Container(
                    padding: const EdgeInsets.all(28),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          offset: Offset(0, 6),
                        )
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Container(
                          height: 4,
                          width: 60,
                          decoration: BoxDecoration(
                            color: Colors.deepOrangeAccent,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),

                        const SizedBox(height: 18),

                        Text(
                          service["title"]!,
                          style: const TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.w700,
                          ),
                        ),

                        const SizedBox(height: 12),

                        Text(
                          service["desc"]!,
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.black87,
                            height: 1.6,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        );
      },
    );
  }

}
