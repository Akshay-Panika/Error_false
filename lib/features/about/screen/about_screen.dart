import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Flex(
      direction: width >=700 ? Axis.horizontal : Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if(width <=700)
              SizedBox(height: 50,),
              Row(
                spacing: 14,
                children: [
                  Text('About', style: TextStyle(color: Colors.deepOrangeAccent,fontSize: width >=700? 60:30,fontWeight: FontWeight.bold),),
                  Text('Montor', style: TextStyle(fontSize: width >=700? 60:30,fontWeight: FontWeight.bold),),
                ],
              ),
              Text('Montor Web is a wireframe kit that has more than 15 popular categories and more than 200 screens from each category,\nSeaWire Web deserves to be your partner in working on projects.\nSeaWire Web is a wireframe kit that has more than 15 popular categories and more than 200 screens from each category,',
              style: TextStyle(fontSize: 16,color: Colors.grey.shade700),),
              
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
        Container(
          height:height*0.95,
          width: width>=700?width*0.35:double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/profile/akshay_panika_laptop.jpeg',),fit:BoxFit.fill)
          ),
        )
      ],
    );
  }
}
