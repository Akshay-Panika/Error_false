import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../core/widget/responsive_font.dart';
import '../../../core/widget/screen_helper.dart';

class AboutScreen extends StatefulWidget {
  final VoidCallback onBookNowTap;
  const AboutScreen({super.key, required this.onBookNowTap});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    if (ScreenHelper.isDesktop(context)) {
      return Container(
        height: 700,
        padding: EdgeInsets.all(20),
        child:   Row(
          children: [
            Expanded(child: _data(context)),
            Expanded(child: Image.asset('assets/profile/akshay_panika_laptop.png')),
          ],
        )
      );
    }

    if (ScreenHelper.isTablet(context)) {
      return Container(
          height: 800,
          padding: EdgeInsets.all(20),
          child:   Column(
            children: [
              Expanded(child: _data(context)),
              Expanded(child: Image.asset('assets/profile/akshay_panika_laptop.png')),
            ],
          )
      );
    }

    return Container(
        height: 400,
        padding: EdgeInsets.all(20),
        child:   Column(
          children: [
            Expanded(child: _data(context)),
            // SizedBox(height: 30,),
            // Expanded(child: Image.asset('assets/profile/akshay_panika_laptop.png')),
          ],
        )
    );
  }

  Widget _data(BuildContext context){
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Row(
          children: [
            Text(
              'About ',
              style: TextStyle(
                color: Colors.deepOrangeAccent,
                fontWeight: FontWeight.bold,
                fontSize: RFont.size(context, 30, tablet: 40, desktop: 50),
              ),
            ),
            Text(
              'Founder',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: RFont.size(context, 30, tablet: 40, desktop: 50),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),


        Text(
          'Akshay Panika is the Founder of Error False, a growing digital solutions startup focused on building modern web, mobile, and software applications.\n\n'
              'With expertise in Flutter, Django, and scalable application development, he helps businesses transform ideas into powerful digital products. His focus is on creating clean UI, smooth user experiences, and reliable performance-driven solutions.\n\n'
              'From startup projects to business platforms, Akshay is passionate about delivering innovative, user-friendly, and future-ready technology solutions.',
          style: TextStyle(
            fontSize: RFont.size(context, 12, tablet: 14, desktop: 16),
            color: Colors.grey.shade700,
            height: 1.6,
          ),
        ),
        SizedBox(height: 50,),

        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepOrangeAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16),
          ),
          onPressed: widget.onBookNowTap,
          child: Text(
            'APPOINTMENT NOW',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: RFont.size(context, 12, tablet: 14, desktop: 16),
            ),
          ),
        ),
      ],
    );
  }
}
