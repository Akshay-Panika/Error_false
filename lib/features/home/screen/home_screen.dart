import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Container(
          height:  width >=700 ? height*0.75:height*0.99,
          child: Flex(
            direction: width >=700 ? Axis.horizontal : Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [

              Expanded(
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
              ),

              Expanded(
                child: Padding(
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
                              fontSize: 45,
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
                                  fontSize: 60,
                                  height: 0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.deepOrangeAccent,
                                ),
                              ),
                              Text("With",
                                style: TextStyle(
                                  fontSize: 45,
                                  height: 0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                  
                          Text(
                            "Error False, Montor",
                            style: TextStyle(
                              fontSize: 45,
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
                            "Drop you requirement we will define it and build the best for you.\nYou can monitor and manage your business with the paltform we will provide.",
                            style: TextStyle(
                              color: Colors.grey,
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
                                onPressed: () {},
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
                                onPressed: () {},
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
                ),
              )
            ],
          ),
        ),

        if(width <=700 )
          SizedBox(height: 50,),

        Container(
          padding: EdgeInsets.all(10),
          color: Colors.deepOrangeAccent.withOpacity(0.16),
          child: Flex(
            direction: width >=700 ? Axis.horizontal : Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('OUR BEST RESULTS', style: TextStyle(fontWeight: FontWeight.bold,fontSize:40),),
              Row(
                spacing: 20,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Row(
                      spacing: 20,
                      children: [
                        Text('ACTIVE\nCLINE',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600),),
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: Colors.deepOrangeAccent,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Row(
                            children: [
                              Text('1670',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Row(
                      spacing: 20,
                      children: [
                        Text('SUCCESSFUL\nCOMPLETE PROJECT',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600),),
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: Colors.deepOrangeAccent,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Row(
                            children: [
                              Text('1670',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              )
            ],
          ),
        ),

      ],
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
