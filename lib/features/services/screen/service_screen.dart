import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/widget/responsive_font.dart';
import '../../../core/widget/screen_helper.dart';


class ServiceScreen extends StatefulWidget {
  const ServiceScreen({super.key});

  @override
  State<ServiceScreen> createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {

  int? hoveredIndex;
  int? selectedIndex;

  final _services = [
    {
      'icon': Icons.support_agent,
      'title': '24/7 Help Line',
    },
    {
      'icon': Icons.access_time_filled,
      'title': 'Always Available',
    },
    {
      'icon': Icons.code,
      'title': 'Best Developer',
    },
    {
      'icon': Icons.video_call,
      'title': 'Consult Online',
    },
    {
      'icon': Icons.security,
      'title': 'Secure Service',
    },
    {
      'icon': Icons.speed,
      'title': 'Fast Performance',
    },
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,

      children: [
        if(ScreenHelper.isMobile(context))
          SizedBox(height: 50,),
        Text('Extensive Services', style: TextStyle(
            fontSize: RFont.size(context, 26, tablet: 40, desktop: 50),
            fontWeight: FontWeight.bold, color: Colors.deepOrangeAccent),),

        if(!ScreenHelper.isMobile(context))
        SizedBox(height: 50,),

        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: GridView.builder(
              itemCount: _services.length,
              shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    // crossAxisCount: width >=700 ?6:2,
                  crossAxisCount: ScreenHelper.isDesktop(context) ?6:ScreenHelper.isTablet(context)?4:2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20
                ),
                itemBuilder: (context, index) {
                final service = _services[index];
                  bool isActive =
                      hoveredIndex == index || selectedIndex == index;

                  return MouseRegion(
                    onEnter: (_) {
                      setState(() {
                        hoveredIndex = index;
                      });
                    },
                    onExit: (_) {
                      setState(() {
                        hoveredIndex = null;
                      });
                    },
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            height: isActive ?200:120,width: isActive ?200:120,
                            decoration: BoxDecoration(
                              color: Colors.deepOrangeAccent.withOpacity(0.16),
                              border: Border.all(color: Colors.deepOrangeAccent,width: 0.3),
                              // borderRadius: BorderRadius.circular(8),
                              shape: isActive? BoxShape.rectangle: BoxShape.circle
                            ),
                          ),
                          Positioned.fill(child: Column(

                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding:  EdgeInsets.only(top: width >= 700 ? 0.0:20),
                                child: Icon(
                                  service['icon'] as IconData,
                                  size: 40,
                                  color: Colors.deepOrangeAccent,
                                ),
                              ),
                              Padding(
                                padding:  EdgeInsets.only(top: width >= 700 ? 0.0:20),
                                child: Text('${service['title']}', style: TextStyle(fontWeight: FontWeight.w600,color: Colors.deepOrangeAccent),),
                              ),
                            ],
                          ))
                        ],
                      ),
                    ),
                  );
                },),
          ),
        ),

        LayoutBuilder(
       builder: (context, constraints) {

        if(ScreenHelper.isDesktop(context)){
          return Container(
            height: 700,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(child: Image.asset('assets/service/akshay_panika_okay.png')),
                Expanded(child:  _contentSection01(context))
              ],
            ),
          );
        }

        if(ScreenHelper.isTablet(context)){
          return Container(
            height: 800,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Expanded(child: Image.asset('assets/service/akshay_panika_okay.png')),
                Expanded(child:  _contentSection01(context))
              ],
            ),
          );
        }

        return Container(
          height: 640,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Expanded(child: Image.asset('assets/service/akshay_panika_okay.png')),
              Expanded(child:  _contentSection01(context))
            ],
          ),
        );

       },
    ),
        LayoutBuilder(
       builder: (context, constraints) {

        if(ScreenHelper.isDesktop(context)){
          return Container(
            height: 700,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(child:  _contentSection02(context)),
                Expanded(child: Image.asset('assets/service/akshay_panika_back.jpeg')),
              ],
            ),
          );
        }

        if(ScreenHelper.isTablet(context)){
          return Container(
            height: 800,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Expanded(child: Image.asset('assets/service/akshay_panika_back.jpeg')),
                Expanded(child:  _contentSection02(context)),
              ],
            ),
          );
        }

        return Container(
          height: 640,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Expanded(child: Image.asset('assets/service/akshay_panika_back.jpeg')),
              Expanded(child:  _contentSection02(context)),
            ],
          ),
        );

       },
    ),
        LayoutBuilder(
          builder: (context, constraints) {


            if(ScreenHelper.isDesktop(context)){
              return Container(
                height: 700,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(child: Image.asset('assets/service/akshay_panika_okay.png')),
                    Expanded(child:  _contentSection03(context))
                  ],
                ),
              );
            }

            if(ScreenHelper.isTablet(context)){
              return Container(
                height: 800,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Expanded(child: Image.asset('assets/service/akshay_panika_okay.png')),
                    Expanded(child:  _contentSection03(context))
                  ],
                ),
              );
            }

            return Container(
              height: 640,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Expanded(child: Image.asset('assets/service/akshay_panika_okay.png')),
                  Expanded(child:  _contentSection03(context))
                ],
              ),
            );

          },
        ),

    ],
    );
  }
}

Widget _contentSection01(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment:  MainAxisAlignment.center,
    children: [

      Text(
        '01',
        style: TextStyle(
          fontSize: RFont.size(context, 30, tablet: 40, desktop: 60),
          color: Colors.grey,
          fontWeight: FontWeight.w900,
        ),
      ),

      Text(
        'Passionate Developer\n& Problem Solver',
        style: TextStyle(
          fontSize: RFont.size(context, 20, tablet: 30, desktop: 40),
          fontWeight: FontWeight.w900,
          color: Colors.deepOrangeAccent,
          height: 1.1,
        ),
      ),

      const SizedBox(height: 20),

      Text(
        'I specialize in building modern, scalable, and user-friendly applications that solve real-world problems. '
            'With hands-on experience in Flutter and Django, I focus on writing clean, efficient code and delivering '
            'smooth user experiences. I enjoy transforming ideas into functional products and continuously improving '
            'my skills by learning new technologies and best practices. My goal is to create impactful digital solutions '
            'that provide value and meaningful experiences to users.',
        style: TextStyle(
          height: 1.6,
          fontSize: RFont.size(context, 12, tablet: 14, desktop: 16),
          color: Colors.grey.shade700,
        ),
      ),
    ],
  );
}
Widget _contentSection02(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [

      Text(
        '02',
        style: TextStyle(
          fontSize: RFont.size(context, 30, tablet: 40, desktop: 60),
          color: Colors.grey,
          fontWeight: FontWeight.w900,
        ),
      ),

      Text(
        'Top Notch\nProfessionals',
        style: TextStyle(
          fontSize: RFont.size(context, 20, tablet: 30, desktop: 40),
          fontWeight: FontWeight.w900,
          color: Colors.deepOrangeAccent,
          height: 1.1,
        ),
      ),

      const SizedBox(height: 20),

      Text(
        'We build powerful, scalable, and modern digital solutions tailored to your business needs. '
            'From crafting strong brand identity to developing high-performance websites and applications, '
            'our team ensures quality, innovation, and growth. With expert SEO and marketing strategies, '
            'we help transform your ideas into revenue-generating digital products.',
        style: TextStyle(
          fontSize: RFont.size(context, 12, tablet: 14, desktop: 16),
          height: 1.6,
          color: Colors.grey.shade700,
        ),
      ),
    ],
  );
}
Widget _contentSection03(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [

      Text(
        '03',
        style: TextStyle(
          fontSize: RFont.size(context, 30, tablet: 40, desktop: 60),
          color: Colors.grey,
          fontWeight: FontWeight.w900,
        ),
      ),

      Text(
        'Continuous Learning\n& Innovation',
        style: TextStyle(
          fontSize: RFont.size(context, 20, tablet: 30, desktop: 40),
          fontWeight: FontWeight.w900,
          color: Colors.deepOrangeAccent,
          height: 1.1,
        ),
      ),

      const SizedBox(height: 20),

      Text(
        'I believe growth comes from continuous learning and consistent practice. '
            'I actively explore new technologies, frameworks, and tools to improve my development workflow '
            'and stay aligned with modern industry standards. By working on real-world projects and solving '
            'practical problems, I keep enhancing my technical expertise and creativity. My focus is always '
            'on building efficient, reliable, and user-focused digital experiences.',
        style: TextStyle(
          fontSize: RFont.size(context, 12, tablet: 14, desktop: 16),
          height: 1.6,
          color: Colors.grey.shade700,
        ),
      ),
    ],
  );
}
