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

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 50,
      children: [
        Text('Extensive Services', style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold, color: Colors.deepOrangeAccent),),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: GridView.builder(
            itemCount: 6,
            shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: width >=700 ?6:2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20
              ),
              itemBuilder: (context, index) {
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
                      alignment: AlignmentGeometry.topCenter,
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
                            Icon(Icons.circle,color: Colors.transparent,),
                            Text('headline'),
                          ],
                        ))
                      ],
                    ),
                  ),
                );
              },),
        )
      ],
    );
  }
}
