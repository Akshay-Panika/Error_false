import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../core/widget/responsive_font.dart';
import '../../../core/widget/screen_helper.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

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
        height: 700,
        padding: EdgeInsets.all(20),
        child:   Column(
          children: [
            Expanded(child: _data(context)),
            SizedBox(height: 30,),
            Expanded(child: Image.asset('assets/profile/akshay_panika_laptop.png')),
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
              'Montor',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: RFont.size(context, 30, tablet: 40, desktop: 50),
              ),
            ),
          ],
        ),

        Text(
          'Akshay Panika is a dedicated and enthusiastic software developer with a strong passion for building practical, user-friendly, and scalable digital solutions. He enjoys turning ideas into real-world applications and has a deep interest in modern development technologies and best practices.\n\n'
              'With hands-on experience in technologies like Flutter and Django, Akshay focuses on creating clean, efficient, and well-structured applications. He is constantly exploring new tools, improving his problem-solving skills, and learning advanced concepts to stay updated with the evolving tech landscape.\n\n',
          style: TextStyle(
            fontSize: RFont.size(context, 12, tablet: 14, desktop: 16),
            color: Colors.grey.shade700,
            height: 1.6, // better readability
          ),
        ),

        if(ScreenHelper.isDesktop(context))
        SizedBox(height: 50,),

        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepOrangeAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16),
          ),
          onPressed: () {},
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
