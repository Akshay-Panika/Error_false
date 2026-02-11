import 'package:flutter/material.dart';

import '../../about/screen/about_screen.dart';
import '../../home/screen/home_screen.dart';
import '../../services/screen/service_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

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
                 Text('❗❌', style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),

                 if( width >=700 )
                 Row(
                   spacing: 20,
                   children: [
                     TextButton(onPressed: (){}, child: Text('Home',style: TextStyle(color: Colors.deepOrangeAccent,fontWeight: FontWeight.w600),)),
                     TextButton(onPressed: (){}, child: Text('About',style: TextStyle(color: Colors.deepOrangeAccent,fontWeight: FontWeight.w600),)),
                     TextButton(onPressed: (){}, child: Text('Service',style: TextStyle(color: Colors.deepOrangeAccent,fontWeight: FontWeight.w600),)),
                     TextButton(onPressed: (){}, child: Text('Testimonial',style: TextStyle(color: Colors.deepOrangeAccent,fontWeight: FontWeight.w600),)),
                     TextButton(onPressed: (){}, child: Text('Blog',style: TextStyle(color: Colors.deepOrangeAccent,fontWeight: FontWeight.w600),)),

                     ElevatedButton(
                       style: ElevatedButton.styleFrom(
                         backgroundColor: Colors.deepOrangeAccent, // button color
                         shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(8), // radius change kar sakte ho
                         ),
                         padding: EdgeInsets.symmetric(horizontal: 16),
                       ),
                       onPressed: () {},
                       child: Text(
                         'Book Now',
                         style: TextStyle(
                           color: Colors.white,
                           fontWeight: FontWeight.w500,
                         ),
                       ),
                     )


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
               child: Column(
                 children: [
                   HomeScreen(),

                   // if( width <=700 )
                   SizedBox(height: height*0.05,),

                   AboutScreen(),
                   SizedBox(height: height*0.15,),
                   ServiceScreen(),

                   SizedBox(height: 100,)
                 ],
               ),
             ),
           )
         ],
       ),
    );
  }
}
