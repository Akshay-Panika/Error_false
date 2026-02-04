import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  final ScrollController scrollController = ScrollController();

  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    Future.delayed(const Duration(milliseconds: 500), () {
      if (!_controller.hasClients) return;

      _controller.animateTo(
        _controller.position.maxScrollExtent,
        duration: const Duration(seconds: 20),
        curve: Curves.linear,
      ).then((_) {

        if (!_controller.hasClients) return;

        _controller.jumpTo(0);
        _startAutoScroll();
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  final _service = [
    {
      "name": "App Development",
      "des": "Mobile apps for Android & iOS",
    },
    {
      "name": "Web Development",
      "des": "Modern responsive websites",
    },
    {
      "name": "UI/UX Design",
      "des": "User friendly app & web designs",
    },
    {
      "name": "Backend Development",
      "des": "APIs and server side logic",
    },
    {
      "name": "Digital Marketing",
      "des": "SEO & online promotion",
    },
    {
      "name": "Graphic Design",
      "des": "Logos, banners & creatives",
    },
  ];


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
            shadowColor: Colors.deepOrange,
            surfaceTintColor: Colors.deepOrange,
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
                          color: screenWidth >= 700? Colors.white:Colors.deepOrange,
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          // height: commonHeight,
                          child: Row(
                            mainAxisAlignment: screenWidth >= 700 ? MainAxisAlignment.spaceAround: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                spacing: 10,
                                children: [
                                  CircleAvatar(),
                                  TextButton(onPressed: (){}, child: Text('Error False',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),)),
                                ],
                              ),

                              if (screenWidth >= 700)
                                ClipPath(
                                  clipper: TrapezoidClipper(),
                                  child: Container(
                                    height: double.infinity,
                                    color: Colors.deepOrange,
                                    padding: EdgeInsets.symmetric(horizontal: 100),

                                    child: Row(
                                      spacing: 10,
                                      children: [
                                        TextButton(onPressed: (){}, child: Text('Home',style: TextStyle(color: Colors.white),)),
                                        TextButton(onPressed: (){}, child: Text('Services',style: TextStyle(color: Colors.white),)),
                                        TextButton(onPressed: (){}, child: Text('Project',style: TextStyle(color: Colors.white),)),
                                        TextButton(onPressed: (){}, child: Text('Blog',style: TextStyle(color: Colors.white),)),
                                      ],
                                    ),
                                  ),
                                ),

                              screenWidth >= 700
                                  ? TextButton(
                                onPressed: () {},
                                child: TextButton(onPressed: (){}, child: Text('Contact Us',style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.bold),)),
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
                            color: Colors.deepOrange,
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
                                color: Colors.deepOrange,
                                padding: EdgeInsets.symmetric(horizontal: 100),
                                  child: Row(
                                    spacing: 10,
                                    children: [
                                      TextButton(onPressed: (){}, child: Text('Home',style: TextStyle(color: Colors.white),)),
                                      TextButton(onPressed: (){}, child: Text('Services',style: TextStyle(color: Colors.white),)),
                                      TextButton(onPressed: (){}, child: Text('Project',style: TextStyle(color: Colors.white),)),
                                      TextButton(onPressed: (){}, child: Text('Blog',style: TextStyle(color: Colors.white),)),
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
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [

                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      // height: 650,
                      height: screenWidth >= 700?650:1050,
                      decoration: BoxDecoration(
                        color: Colors.deepOrange,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(screenWidth >= 700 ?20:0),
                          topRight: Radius.circular(screenWidth >= 700 ?20:0),
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        )
                      ),

                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 40),
                        child: LayoutBuilder(
                          builder: (context, constraints) {

                            final isDesktop = constraints.maxWidth >= 700;

                            return Flex(
                              direction: isDesktop ? Axis.horizontal : Axis.vertical,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [

                                // LEFT BOX (ICON)
                                Flexible(
                                  fit: FlexFit.loose,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [

                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 18, vertical: 8),
                                        decoration: BoxDecoration(
                                          border: Border.all(color: Colors.white),
                                          borderRadius: BorderRadius.circular(30),
                                        ),
                                        child: const Text(
                                          "ERROR FALSE",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),

                                       SizedBox(height: 50),

                                      RichText(
                                        text: const TextSpan(
                                          style: TextStyle(
                                            fontSize: 42,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                          children: [
                                            TextSpan(text: "The Beauty Behind  "),
                                            TextSpan(
                                              text: "IT Services.",
                                              style: TextStyle(color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      ),

                                      const SizedBox(height: 20),

                                      Padding(
                                        padding:  EdgeInsets.only(left: 8.0,
                                        right: screenWidth >= 700?200:8),
                                        child: const Text(
                                          "Where your interests international networks intersect provid custom software solutions for any value software.",
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                            height: 1.6,
                                          ),
                                        ),
                                      ),

                                       SizedBox(height: screenWidth >= 700?100:50),

                                      Row(
                                        spacing:  50,
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [

                                          ElevatedButton(
                                            onPressed: () {},
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.white,
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: 40, vertical: 18),
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(40),
                                              ),
                                            ),
                                            child: const Text(
                                              "EXPLORE MORE",
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),

                                          Container(
                                            padding: const EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(12),
                                            ),
                                            child: Icon(Icons.play_circle),
                                          ),

                                          if(screenWidth >= 700)
                                          Text(
                                            'Watch Video',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white,
                                              decoration: TextDecoration.underline,
                                              decorationColor: Colors.white,
                                              decorationThickness: 2,
                                            ),
                                          )

                                        ],
                                      ),



                                    ],
                                  ),
                                ),

                                SizedBox(
                                  width: isDesktop ? 50 : 0,
                                  height: isDesktop ? 0 : 40,
                                ),

                                // RIGHT CONTENT
                                Container(
                                  width: isDesktop ? 500 : double.infinity,
                                  height: 500,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.image_not_supported_outlined,
                                      size: 80,
                                      color: Colors.transparent,
                                    ),
                                  ),
                                ),


                              ],
                            );
                          },
                        ),
                      ),

                    ),

                     SizedBox(height: screenWidth >= 700?150:550),
                  ],
                ),

                GridView.builder(
                  itemCount: _service.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: screenWidth >= 700 ?6:2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 1,
                  ),

                  itemBuilder: (context, index) {
                    final list = _service[index];
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 6,
                            offset: Offset(0, 4),
                          )
                        ],
                      ),
                      child: Column(
                        spacing: 8,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(list['name'].toString(), style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                          Text(list['des'].toString(), style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600, color: Colors.grey.shade700),),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),

          SliverToBoxAdapter(child: SizedBox(height: 80,),),


          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 40),
              child: LayoutBuilder(
                builder: (context, constraints) {

                  final isDesktop = constraints.maxWidth >= 700;

                  return Flex(
                    direction: isDesktop ? Axis.horizontal : Axis.vertical,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [

                      // LEFT BOX (ICON)

                      Container(
                        width: isDesktop ? 500 : double.infinity,
                        height: 500,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.image_not_supported_outlined,
                            size: 80,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ),

                      SizedBox(
                        width: isDesktop ? 50 : 0,
                        height: isDesktop ? 0 : 40,
                      ),

                      // RIGHT CONTENT

                      Flexible(
                        fit: FlexFit.loose,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [

                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 18, vertical: 8),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.deepOrange),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: const Text(
                                "ERROR FALSE",
                                style: TextStyle(
                                  color: Colors.deepOrange,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),

                            const SizedBox(height: 25),

                            RichText(
                              text: const TextSpan(
                                style: TextStyle(
                                  fontSize: 42,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                children: [
                                  TextSpan(text: "Essential IT Solutions For\nModern "),
                                  TextSpan(
                                    text: "Businesses.",
                                    style: TextStyle(color: Colors.deepOrange),
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(height: 20),

                            const Text(
                              "Monotonectally repurpose maintainable infrastructure whereas solutek in fermentum quis tempo sapien maximus design.",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                                height: 1.6,
                              ),
                            ),

                            const SizedBox(height: 30),

                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Colors.deepOrange.withOpacity(.1),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: const Icon(
                                    Icons.cloud_outlined,
                                    color: Colors.deepOrange,
                                  ),
                                ),
                                const SizedBox(width: 15),
                                const Text(
                                  "Cloud Based Solution",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 15),

                            const Text(
                              "Monotonectally repurpose maintainable infrastructure whereas solutek in fermentum quis tempo sapien maximus design.",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey,
                                height: 1.6,
                              ),
                            ),

                            const SizedBox(height: 40),

                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.deepOrange,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 40, vertical: 18),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40),
                                ),
                              ),
                              child: const Text(
                                "EXPLORE MORE",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),


          SliverToBoxAdapter(
            child: Stack(
              alignment: AlignmentGeometry.bottomCenter,
              children: [
                Column(
                  children: [
                    Container(
                      height: 300,
                      color: Colors.black12,
                    )
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
                  child: LayoutBuilder(
                    builder: (context, constraints) {

                      final isDesktop = constraints.maxWidth >= 900;

                      final PageController controller = PageController();
                      ValueNotifier<int> pageIndex = ValueNotifier(0);

                      // total items
                      final int totalItems = 9;

                      // items per page
                      final int itemsPerPage = isDesktop ? 3 : 1;

                      final int totalPages =
                      (totalItems / itemsPerPage).ceil();

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          // ---------------- HEADER ----------------

                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 18, vertical: 8),
                            decoration: BoxDecoration(
                              color: Colors.orange.withOpacity(.1),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: const Text(
                              "ERROR FALSE PROJECT",
                              style: TextStyle(
                                color: Colors.deepOrange,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),

                          const SizedBox(height: 15),

                          RichText(
                            text: const TextSpan(
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              children: [
                                TextSpan(text: "Explore Our Recent "),
                                TextSpan(
                                  text: "Projects.",
                                  style: TextStyle(color: Colors.deepOrange),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 40),


                          SizedBox(
                            height: 500,
                            child: PageView.builder(
                              controller: controller,
                              itemCount: totalPages,
                              onPageChanged: (i) => pageIndex.value = i,
                              itemBuilder: (context, page) {

                                return GridView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: isDesktop ? 3 : 1,
                                    crossAxisSpacing: 30,
                                    mainAxisSpacing: 30,
                                    // childAspectRatio: 1.1,
                                  ),
                                  itemCount: itemsPerPage,
                                  itemBuilder: (context, index) {

                                    final itemNumber =
                                        page * itemsPerPage + index;

                                    if (itemNumber >= totalItems) {
                                      return const SizedBox();
                                    }

                                    return Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(30),
                                          topRight: Radius.circular(30),
                                        ),
                                        border: Border(
                                          top: BorderSide(color: Colors.black,width: 0.3),
                                          left: BorderSide(color: Colors.black,width: 0.3),
                                          right: BorderSide(color: Colors.black,width: 0.3),
                                        )
                                      ),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(height: 50,),
                                          Icon(
                                            Icons.image_not_supported_outlined,
                                            size: 80,
                                            color: Colors.grey.shade200,
                                          ),
                                          Container(
                                            width: double.infinity,
                                            padding: EdgeInsets.all(20),
                                            decoration: BoxDecoration(
                                              color: Colors.deepOrange,
                                            ),
                                            child: Center(child: Text('Project Headline',style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white),)),

                                          )
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),

                          const SizedBox(height: 30),


                          ValueListenableBuilder<int>(
                            valueListenable: pageIndex,
                            builder: (context, value, _) {

                              return Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [

                                  // Index headline
                                  Text(
                                    "${(value + 1).toString().padLeft(2, '0')} / ${totalPages.toString().padLeft(2, '0')}",
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  // Dots
                                  Row(
                                    children: List.generate(
                                      totalPages,
                                          (i) => AnimatedContainer(
                                        duration: const Duration(milliseconds: 300),
                                        margin: const EdgeInsets.symmetric(horizontal: 5),
                                        width: value == i ? 22 : 10,
                                        height: 10,
                                        decoration: BoxDecoration(
                                          color: value == i
                                              ? Colors.deepOrange
                                              : Colors.grey.shade400,
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ],
                      );
                    },
                  ),
                )
              ],
            ),
          ),

          SliverToBoxAdapter(
            child: Container(
              height: 100,
              margin:  EdgeInsets.symmetric(horizontal: screenWidth >= 700?150:16),
              padding: const EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),

              child: ListView.builder(
                controller: _controller,
                scrollDirection: Axis.horizontal,
                itemCount: 20, // repeat for smooth loop
                itemBuilder: (context, index) {

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Row(
                      children: const [
                        Icon(Icons.circle, size: 20),
                        SizedBox(width: 10),
                        Text(
                          "Company",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),


          SliverToBoxAdapter(child: SizedBox(height: 100,),)




        ],
      ),
    );
  }
}

class TrapezoidClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.moveTo(20, 0);              // top left angled
    path.lineTo(size.width - 20, 0); // top right angled
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
