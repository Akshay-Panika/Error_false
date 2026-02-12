import 'package:flutter/material.dart';

import '../../about/screen/about_screen.dart';
import '../../book_now/screen/book_now_screen.dart';
import '../../footer/screen/footer_screen.dart';
import '../../home/screen/home_screen.dart';
import '../../services/screen/service_screen.dart';
import '../../testimonial/screen/testimonial_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  final ScrollController _scrollController = ScrollController();

  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _serviceKey = GlobalKey();
  final GlobalKey _testimonialKey = GlobalKey();
  final GlobalKey _bookKey = GlobalKey();
  final GlobalKey _footerKey = GlobalKey();

  void _scrollToSection(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.deepOrangeAccent.withOpacity(0.1),
       body: Column(
         children: [
           Container(
             height:  width >=700? height*0.08:height*0.08,
             padding: EdgeInsets.symmetric(horizontal: 10),
             // color: Colors.deepOrangeAccent.withOpacity(0.1),
             child: Row(
               mainAxisAlignment: width >=700? MainAxisAlignment.spaceAround:MainAxisAlignment.spaceBetween,
               children: [
                 InkWell(
                     onTap: () => _scrollToSection(_homeKey),
                     child: Text('❗❌', style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),)),

                 if( width >=700 )
                 Row(
                   spacing: 20,
                   children: [
                     TextButton(
                       onPressed: () => _scrollToSection(_homeKey),
                       child: const Text('Home',
                           style: TextStyle(color: Colors.deepOrangeAccent,fontWeight: FontWeight.w600)),
                     ),

                     TextButton(
                       onPressed: () => _scrollToSection(_aboutKey),
                       child: const Text('About',
                           style: TextStyle(color: Colors.deepOrangeAccent,fontWeight: FontWeight.w600)),
                     ),

                     TextButton(
                       onPressed: () => _scrollToSection(_serviceKey),
                       child: const Text('Service',
                           style: TextStyle(color: Colors.deepOrangeAccent,fontWeight: FontWeight.w600)),
                     ),

                     TextButton(
                       onPressed: () => _scrollToSection(_testimonialKey),
                       child: const Text('Testimonial',
                           style: TextStyle(color: Colors.deepOrangeAccent,fontWeight: FontWeight.w600)),
                     ),

                     TextButton(onPressed: (){}, child: Text('Blog',style: TextStyle(color: Colors.deepOrangeAccent,fontWeight: FontWeight.w600),)),


                     ElevatedButton(
                       style: ElevatedButton.styleFrom(
                         backgroundColor: Colors.deepOrangeAccent, // button color
                         shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(8), // radius change kar sakte ho
                         ),
                         padding: EdgeInsets.symmetric(horizontal: 16),
                       ),
                       onPressed: () => _scrollToSection(_bookKey),
                       child: Text(
                         'Book Now',
                         style: TextStyle(
                           color: Colors.white,
                           fontWeight: FontWeight.w500,
                         ),
                       ),
                     )

                     // TextButton(onPressed: (){}, child: Text('Home',style: TextStyle(color: Colors.deepOrangeAccent,fontWeight: FontWeight.w600),)),
                     // TextButton(onPressed: (){}, child: Text('About',style: TextStyle(color: Colors.deepOrangeAccent,fontWeight: FontWeight.w600),)),
                     // TextButton(onPressed: (){}, child: Text('Service',style: TextStyle(color: Colors.deepOrangeAccent,fontWeight: FontWeight.w600),)),
                     // TextButton(onPressed: (){}, child: Text('Testimonial',style: TextStyle(color: Colors.deepOrangeAccent,fontWeight: FontWeight.w600),)),
                     // TextButton(onPressed: (){}, child: Text('Blog',style: TextStyle(color: Colors.deepOrangeAccent,fontWeight: FontWeight.w600),)),
                     //
                     // ElevatedButton(
                     //   style: ElevatedButton.styleFrom(
                     //     backgroundColor: Colors.deepOrangeAccent, // button color
                     //     shape: RoundedRectangleBorder(
                     //       borderRadius: BorderRadius.circular(8), // radius change kar sakte ho
                     //     ),
                     //     padding: EdgeInsets.symmetric(horizontal: 16),
                     //   ),
                     //   onPressed: () {},
                     //   child: Text(
                     //     'Book Now',
                     //     style: TextStyle(
                     //       color: Colors.white,
                     //       fontWeight: FontWeight.w500,
                     //     ),
                     //   ),
                     // )


                   ],
                 ),

                 if(width <=700 )
                   Container(
                     padding: EdgeInsets.all(5),
                       decoration: BoxDecoration(
                         color: Colors.deepOrangeAccent,
                         borderRadius: BorderRadius.circular(5)
                       ),
                       child: Icon(Icons.menu, color: Colors.white,size: 18,))
               ],
             ),
           ),

           Expanded(
             child: SingleChildScrollView(
               controller: _scrollController,
               child: Column(
                 children: [

                   // home
                   Container(
                     key: _homeKey,
                     child: const HomeScreen(),
                   ),

                   // about
                   Container(
                     key: _aboutKey,
                     child: const AboutScreen(),
                   ),

                   SizedBox(height: height*0.15),

                   // service
                   Container(
                     key: _serviceKey,
                     child: const ServiceScreen(),
                   ),

                   // testimonial
                   Container(
                     key: _testimonialKey,
                     child: const TestimonialScreen(),
                   ),

                   // book
                   Container(
                     key: _bookKey,
                     child: const BookNowScreen(),
                   ),

                   SizedBox(height: height*0.15),

                   // footer
                   Container(
                     key: _footerKey,
                     child: const FooterScreen(),
                   ),

                 ],
               ),
             ),
           )

         ],
       ),
    );
  }
}
