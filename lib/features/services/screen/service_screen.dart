import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


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
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Text('Extensive Services', style: TextStyle(fontSize: width >=700? 55:40,fontWeight: FontWeight.bold, color: Colors.deepOrangeAccent),),
          SizedBox(height: 60,),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: GridView.builder(
                itemCount: _services.length,
                shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: width >=700 ?6:2,
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
                              // spacing: 15,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  service['icon'] as IconData,
                                  size: 30,
                                  color: Colors.deepOrangeAccent,
                                ),
                                Text('${service['title']}'),
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

          bool isDesktop = constraints.maxWidth >= 700;

          return isDesktop
              ? Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              /// Left Side
              Container(
                width: constraints.maxWidth * 0.3,
                height: 600,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/service/akshay_panika_okay.jpeg'),fit:BoxFit.cover)
                ),
              ),

              SizedBox(width: constraints.maxWidth * 0.05),

              /// Right Side
              SizedBox(
                width: constraints.maxWidth * 0.4,
                child: Padding(
                  padding:  EdgeInsets.only(top: height*0.1),
                  child: _contentSection01(isDesktop),
                ),
              ),
            ],
          )
              : Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                // width: double.infinity,
                width: constraints.maxWidth * 0.65,
                height:550,
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage('assets/service/akshay_panika_okay.jpeg'),fit:BoxFit.cover)
                ),
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: _contentSection01(isDesktop),
              ),
            ],
          );
        },
      ),

          LayoutBuilder(
            builder: (context, constraints) {

              bool isDesktop = constraints.maxWidth >= 700;

              return isDesktop
                  ? Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  SizedBox(
                    width: constraints.maxWidth * 0.4,
                    child: Padding(
                      padding:  EdgeInsets.only(top: height*0.1),
                      child: _contentSection02(isDesktop),
                    ),
                  ),
                  SizedBox(width: constraints.maxWidth * 0.05),
                  Container(
                    width: constraints.maxWidth * 0.3,
                    height: 600,
                    decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage('assets/service/akshay_panika_back.jpeg'),fit:BoxFit.cover)
                    ),
                  ),

                ],
              )
                  : Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    // width: double.infinity,
                    width: constraints.maxWidth * 0.65,
                    height:550,
                    decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage('assets/service/akshay_panika_back.jpeg'),fit:BoxFit.cover)
                    ),
                  ),
                  const SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: _contentSection02(isDesktop),
                  ),
                ],
              );
            },
          ),

          LayoutBuilder(
            builder: (context, constraints) {

              bool isDesktop = constraints.maxWidth >= 700;

              return isDesktop
                  ? Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  /// Left Side
                  Container(
                    width: constraints.maxWidth * 0.3,
                    height: 600,
                    decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage('assets/service/akshay_panika_okay.jpeg'),fit:BoxFit.cover)
                    ),
                  ),

                  SizedBox(width: constraints.maxWidth * 0.05),

                  /// Right Side
                  SizedBox(
                    width: constraints.maxWidth * 0.4,
                    child: Padding(
                      padding:  EdgeInsets.only(top: height*0.1),
                      child: _contentSection03(isDesktop),
                    ),
                  ),
                ],
              )
                  : Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    // width: double.infinity,
                    width: constraints.maxWidth * 0.65,
                    height:550,
                    decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage('assets/service/akshay_panika_okay.jpeg'),fit:BoxFit.cover)
                    ),
                  ),
                  const SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: _contentSection03(isDesktop),
                  ),
                ],
              );
            },
          ),


      ],
      ),
    );
  }
}

Widget _contentSection01(bool isDesktop) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [

      Text(
        '01',
        style: TextStyle(
          fontSize: 80,
          color: Colors.grey,
          fontWeight: FontWeight.w900,
        ),
      ),

      Text(
        'Premium Development\nSolutions',
        style: TextStyle(
          fontSize: isDesktop ? 50 : 36,
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
          fontSize: 16,
          height: 1.6,
          color: Colors.grey.shade700,
        ),
      ),
    ],
  );
}
Widget _contentSection02(bool isDesktop) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [

      Text(
        '02',
        style: TextStyle(
          fontSize: 80,
          color: Colors.grey,
          fontWeight: FontWeight.w900,
        ),
      ),

      Text(
        'Top Notch\nProfessionals',
        style: TextStyle(
          fontSize: isDesktop ? 50 : 36,
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
          fontSize: 16,
          height: 1.6,
          color: Colors.grey.shade700,
        ),
      ),
    ],
  );
}
Widget _contentSection03(bool isDesktop) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [

      Text(
        '03',
        style: TextStyle(
          fontSize: 80,
          color: Colors.grey,
          fontWeight: FontWeight.w900,
        ),
      ),

      Text(
        '24/7 Development &\nMarketing Center',
        style: TextStyle(
          fontSize: isDesktop ? 50 : 36,
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
          fontSize: 16,
          height: 1.6,
          color: Colors.grey.shade700,
        ),
      ),
    ],
  );
}
