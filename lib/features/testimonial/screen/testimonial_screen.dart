import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class TestimonialScreen extends StatefulWidget {
  const TestimonialScreen({super.key});

  @override
  State<TestimonialScreen> createState() => _TestimonialScreenState();
}

class _TestimonialScreenState extends State<TestimonialScreen> {
  final CarouselSliderController _controller = CarouselSliderController();
  int _currentIndex = 0;

  final List<Map<String, String>> testimonials = [
    {
      "text":
      "Very professional team and amazing results! Highly recommended.",
      "name": "John Doe",
      "role": "Project Manager"
    },
    {
      "text":
      "Outstanding service and great communication throughout the project.",
      "name": "Sarah Smith",
      "role": "Business Owner"
    },
    {
      "text":
      "Top quality work delivered on time. Will definitely work again.",
      "name": "Michael Lee",
      "role": "Entrepreneur"
    },
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return LayoutBuilder(
      builder: (context, constraints) {
        bool isDesktop = constraints.maxWidth >= 700;

        return Column(
          children: [
            if(isDesktop)
            SizedBox(height: height * 0.15),

            isDesktop
                ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: constraints.maxWidth * 0.4,
                  child: Padding(
                    padding: EdgeInsets.only(top: height * 0.05),
                    child: _contentSection(isDesktop),
                  ),
                ),
                SizedBox(width: constraints.maxWidth * 0.05),
                Container(
                  width: constraints.maxWidth * 0.3,
                  height: 600,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/profile/akshay_panika-removebg-preview.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            )
                : Column(
              children: [
                Container(
                  width: constraints.maxWidth * 0.8,
                  height:height*0.8,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/profile/akshay_panika-removebg-preview.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: _contentSection(isDesktop),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  Widget _contentSection(bool isDesktop) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Why People Love Us!',
          style: TextStyle(
            fontSize: isDesktop ? 46 : 30,
            color: Colors.deepOrangeAccent,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 25),

        /// Carousel
        CarouselSlider(
          carouselController: _controller,
          options: CarouselOptions(
            height: isDesktop ? 260 : 240,
            autoPlay: true,
            enlargeCenterPage: false,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          items: testimonials.map((item) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Row(
                   children: [
                     Icon(Icons.format_quote,
                        size: 30, color: Colors.deepOrangeAccent),
                     Text('Company Name', style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),)
                   ],
                 ),
                const SizedBox(height: 10),
                Text(
                  item["text"]!,
                  style:
                  const TextStyle(fontSize: 15, height: 1.5),
                ),
                const SizedBox(height: 25),
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 28,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.person,
                          color: Colors.grey),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item["name"]!,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          item["role"]!,
                          style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey),
                        ),
                      ],
                    )
                  ],
                )
              ],
            );
          }).toList(),
        ),

        const SizedBox(height: 20),

        /// Dots Indicator
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: testimonials.asMap().entries.map((entry) {
            return Container(
              width: _currentIndex == entry.key ? 16 : 8,
              height: 8,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                color: _currentIndex == entry.key
                    ? Colors.deepOrangeAccent
                    : Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
            );
          }).toList(),
        ),

        const SizedBox(height: 20),

        /// Arrow Buttons
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () => _controller.previousPage(),
              child: const CircleAvatar(
                radius: 18,
                backgroundColor: Colors.deepOrangeAccent,
                child:
                Icon(Icons.arrow_back_ios, size: 16, color: Colors.white),
              ),
            ),
            const SizedBox(width: 15),
            GestureDetector(
              onTap: () => _controller.nextPage(),
              child: const CircleAvatar(
                radius: 18,
                backgroundColor: Colors.deepOrangeAccent,
                child: Icon(Icons.arrow_forward_ios,
                    size: 16, color: Colors.white),
              ),
            ),
            const SizedBox(width: 20),
          ],
        ),
      ],
    );
  }
}
