import 'package:error_false/features/bloc/screen/bloc_screen.dart';
import 'package:error_false/features/home/screen/home_screen.dart';
import 'package:error_false/features/project/screen/project_screen.dart';
import 'package:error_false/features/service/screen/service_screen.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  final ScrollController scrollController = ScrollController();
  int selectedIndex = 0; // Home by default


  @override
  Widget build(BuildContext context) {
    final dimensions = MediaQuery.of(context).size;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;


    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverAppBar(
            pinned: true,
            forceElevated: false,
            expandedHeight: dimensions.height * 0.08,
            backgroundColor: Colors.white,
            elevation: 0,
            scrolledUnderElevation: 0,
            shadowColor: Colors.deepOrangeAccent,
            surfaceTintColor: Colors.deepOrangeAccent,
            automaticallyImplyLeading: false,

            flexibleSpace: LayoutBuilder(
              builder: (context, constraints) {

                final top = constraints.biggest.height;

                bool isCollapsed =
                    top <= kToolbarHeight + MediaQuery.of(context).padding.top;

                // double commonHeight = dimensions.height * 0.1;

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [

                      // Expanded view
                      AnimatedOpacity(
                        duration: const Duration(milliseconds: 250),
                        opacity: isCollapsed ? 0 : 1,
                        child: Container(
                          color: screenWidth >= 700? Colors.white:Colors.deepOrangeAccent,
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          // height: commonHeight,
                          child: Row(
                            mainAxisAlignment: screenWidth >= 700 ? MainAxisAlignment.spaceAround: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                spacing: 10,
                                children: [
                                  CircleAvatar(backgroundColor: screenWidth >= 700? Colors.deepOrangeAccent: Colors.white),
                                  TextButton(onPressed: (){}, child: Text('Error False',style: TextStyle(color:  screenWidth >= 700? Colors.deepOrangeAccent: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),)),
                                ],
                              ),

                              if (screenWidth >= 700)
                                ClipPath(
                                  clipper: TrapezoidClipper(),
                                  child: Container(
                                    height: double.infinity,
                                    color: Colors.deepOrangeAccent,
                                    padding: EdgeInsets.symmetric(horizontal: 100),

                                    child: Row(
                                      spacing: 30,
                                      children: [
                                        navItem('Home', 0),
                                        navItem('Services', 1),
                                        navItem('Project', 2),
                                        navItem('Blog', 3),
                                      ],
                                    ),
                                  ),
                                ),

                              screenWidth >= 700
                                  ? TextButton(
                                onPressed: () {},
                                child: TextButton(onPressed: (){}, child: Text('Contact Us',style: TextStyle(color: Colors.deepOrangeAccent,fontSize: 14,fontWeight: FontWeight.bold),)),
                              )
                                  : Icon(Icons.menu, color: Colors.white,),
                            ],
                          ),
                        ),
                      ),

                      // Collapsed view
                      AnimatedOpacity(
                        duration: const Duration(milliseconds: 250),
                        opacity: isCollapsed ? 1 : 0,
                        child: Container(
                          color: Colors.deepOrangeAccent,
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          // height: commonHeight,
                          child: Row(
                            mainAxisAlignment: screenWidth >= 700 ? MainAxisAlignment.spaceAround: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                spacing: 10,
                                children: [
                                  CircleAvatar(),
                                  TextButton(onPressed: (){}, child: Text('Error False',style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),)),
                                ],
                              ),

                              if (screenWidth >= 700)
                                Container(
                                  height: double.infinity,
                                  color: Colors.deepOrangeAccent,
                                  padding: EdgeInsets.symmetric(horizontal: 100),
                                  child: Row(
                                    spacing: 30,
                                    children: [
                                      navItem('Home', 0),
                                      navItem('Services', 1),
                                      navItem('Project', 2),
                                      navItem('Blog', 3),
                                    ],
                                  ),

                                ),

                              screenWidth >= 700
                                  ? TextButton(
                                onPressed: () {},
                                child: TextButton(onPressed: (){}, child: Text('Contact Us',style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.bold),)),
                              )
                                  : Icon(Icons.menu, color: Colors.white,),


                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          SliverToBoxAdapter(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              transitionBuilder: (child, animation) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },
              child: Container(
                key: ValueKey(selectedIndex),
                child: selectedIndex == 0
                    ? HomeScreen()
                    : selectedIndex == 1
                    ? ServiceScreen()
                    : selectedIndex == 2
                    ? ProjectScreen()
                    : BlocScreen(

                ),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child:  Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 40,
                  ),
                  color: Colors.deepOrangeAccent,
                  child: Column(
                    children: [
                      Text(
                        '© 2026 ERROR FALSE',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Responsive across all devices',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize:14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )

        ],
      ),
    );
  }
  Widget navItem(String title, int index) {
    bool isActive = selectedIndex == index;

    return InkWell(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white, // always white
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 4),

          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: 2,
            width: isActive ? 24 : 0, // show only if selected
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ],
      ),
    );
  }

}

