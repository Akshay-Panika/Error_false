import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/widget/responsive_font.dart';
import '../../../core/widget/screen_helper.dart';

class HomeScreen extends StatefulWidget {
  final VoidCallback onBookNowTap;
  const HomeScreen({super.key, required this.onBookNowTap});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final _activeCline = 2;
  final _completeProject = 1;

  Widget animatedCount(int endValue) {
    return TweenAnimationBuilder<int>(
      key: ValueKey(endValue),
      tween: IntTween(begin: 0, end: endValue),
      duration: const Duration(seconds: 5),
      builder: (context, value, child) {
        return Text(
          '$value',
          style:  TextStyle(
            // fontSize: 30,
            fontSize: RFont.size(context, 18, tablet: 24, desktop: 30),
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {


    if (ScreenHelper.isDesktop(context)) {
      return Container(
        height: 650,
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  _imageSection(),
                  Expanded(child: _contentSection()),
                ],
              ),
            ),
            _footer(),
          ],
        ),
      );
    }

    if (ScreenHelper.isTablet(context)) {
      return Container(
        height: 800,
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  _imageSection(),
                  Expanded(child: _contentSection()),
                ],
              ),
            ),
            _footer(),
          ],
        ),
      );
    }

    return Container(
      height: 800,
      child: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                _imageSection(),
                Expanded(child: _contentSection()),
              ],
            ),
          ),
          _footer(),
        ],
      ),
    );

  }

  Widget _footer(){
    return Container(
      padding: EdgeInsets.all(10),
      color: Colors.deepOrangeAccent.withOpacity(0.16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          if(ScreenHelper.isDesktop(context))
            Expanded(
              child: Center(
                child: Text('Akshay Panika', style: TextStyle(color: Colors.deepOrangeAccent,
                    fontWeight: FontWeight.bold,
                  fontSize: RFont.size(context, 24, tablet: 36, desktop: 50),
                ),),
              ),
            ),
            Expanded(
            child: Row(
              spacing:ScreenHelper.isMobile(context)? 10: 26,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Row(
                      spacing: 20,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('ACTIVE CLIENTS',style: TextStyle(
                            fontSize: RFont.size(context, 12, tablet: 14, desktop: 16),
                            fontWeight: FontWeight.w600),),
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: Colors.deepOrangeAccent,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Row(
                            children: [
                              animatedCount(_activeCline),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Row(
                      spacing: 20,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('SUCCESSFUL\nCOMPLETE PROJECT',style: TextStyle(
                            fontSize: RFont.size(context, 12, tablet: 14, desktop: 16),
                            fontWeight: FontWeight.w600),),
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: Colors.deepOrangeAccent,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Row(
                            children: [
                              animatedCount(_completeProject),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _imageSection(){
    return Expanded(
      child: Stack(
        children: [

          Positioned.fill(
            child: ClipPath(
              clipper: DiagonalClipper(),
              child: Container(
                color: Colors.deepOrangeAccent.withOpacity(0.16),
              ),
            ),
          ),

          Positioned.fill(
            child: Image.asset('assets/profile/akshay_panika-removebg-preview.png'),
          ),
        ],
      ),
    );
  }

  Widget _contentSection(){
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        spacing: 20,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Let’s Make An",
                style: TextStyle(
                  fontSize: RFont.size(context, 26, tablet: 30, desktop: 40),
                  height: 0,
                  fontWeight: FontWeight.w500,
                ),
              ),

              Row(
                spacing: 10,
                children: [
                  Text(
                    "Appointment",
                    style: TextStyle(
                      fontSize: RFont.size(context, 30, tablet: 40, desktop: 50),
                      height: 0,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrangeAccent,
                    ),
                  ),
                  Text("With",
                    style: TextStyle(
                      fontSize: RFont.size(context, 30, tablet: 40, desktop: 50),
                      height: 0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),

              Text(
                  "Founder of Error False",
                style: TextStyle(
                  fontSize: RFont.size(context, 30, tablet: 38, desktop: 45),
                  height: 0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),

          Column(
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
          "Building modern web, mobile & software solutions for growing businesses.\nTurning ideas into scalable digital products with innovation and precision.",                style: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: RFont.size(context, 14, tablet: 15, desktop: 16),
                ),
              ),
              Row(
                spacing: 50,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrangeAccent, // button color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8), // radius change kar sakte ho
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 16),
                    ),
                    onPressed: widget.onBookNowTap,
                    child: Text(
                      'Book Now',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white, // button color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8), // radius change kar sakte ho
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 16),
                    ),
                    onPressed: () async {
                      const String profileId = "akshay-panika";
                      const String nativeUrl = "linkedin://profile/$profileId";
                      const String webUrl = "https://www.linkedin.com/in/$profileId";

                      try {
                        if (await canLaunchUrl(Uri.parse(nativeUrl))) {
                          await launchUrl(Uri.parse(nativeUrl));
                        } else {
                          await launchUrl(Uri.parse(webUrl));
                        }
                      } catch (e) {
                        // Handle the error if neither works
                        print("Could not launch LinkedIn: $e");
                      }
                    },
                    child: Text(
                      'Learn More',
                      style: TextStyle(
                        color: Colors.deepOrangeAccent,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}



class DiagonalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    // 30% width se top par start karega
    path.lineTo(size.width * 0.00, 0);

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
