import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Flex(
      direction: width >= 700 ? Axis.horizontal : Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            width: width >= 700 ? width * 0.45 : double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (width <= 700) const SizedBox(height: 50),

                Row(
                  children: [
                    Text(
                      'About ',
                      style: TextStyle(
                        color: Colors.deepOrangeAccent,
                        fontSize: width >= 700 ? 60 : 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Montor',
                      style: TextStyle(
                        fontSize: width >= 700 ? 60 : 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                Text(
                  'Akshay Panika is a dedicated and enthusiastic software developer with a strong passion for building practical, user-friendly, and scalable digital solutions. He enjoys turning ideas into real-world applications and has a deep interest in modern development technologies and best practices.\n\n'
                      'With hands-on experience in technologies like Flutter and Django, Akshay focuses on creating clean, efficient, and well-structured applications. He is constantly exploring new tools, improving his problem-solving skills, and learning advanced concepts to stay updated with the evolving tech landscape.\n\n'
                      'Akshay believes in continuous learning and growth. He loves working on real-world projects that challenge his creativity and technical abilities, aiming to deliver high-quality products that provide meaningful user experiences. His goal is to grow as a professional developer while contributing to innovative and impactful projects.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade700,
                    height: 1.6, // better readability
                  ),
                ),

                const SizedBox(height: 20),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrangeAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'APPOINTMENT NOW',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        Container(
          height: height * 0.95,
          width: width >= 700 ? width * 0.35 : double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/profile/akshay_panika_laptop.jpeg'),
              fit: BoxFit.cover, // better than fill
            ),
          ),
        ),
      ],
    );
  }
}
