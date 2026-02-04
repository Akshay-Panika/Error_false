import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

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


    return SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      child: Column(
        children: [
      
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
      
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    // height: 650,
                    height: screenWidth >= 700?650:1050,
                    decoration: BoxDecoration(
                        color: Colors.deepOrangeAccent,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(screenWidth >= 700 ?20:0),
                          topRight: Radius.circular(screenWidth >= 700 ?20:0),
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        )
                    ),
      
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: screenWidth >= 700?50:20, vertical: 40),
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
                                      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
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
                                      text:  TextSpan(
                                        style: TextStyle(
                                          fontSize:  screenWidth >= 700?55:45,
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
                padding: const EdgeInsets.symmetric(horizontal: 50),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: screenWidth >= 700 ? 6 : 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1,
                ),
                itemBuilder: (context, index) {
                  final list = _service[index];
                  return _HoverTapCard(
                    title: list['name'].toString(),
                    subtitle: list['des'].toString(),
                  );
                },
              ),
      
            ],
          ),
          
      
          Padding(
            padding:  EdgeInsets.symmetric(horizontal:  screenWidth >= 700? 50:20, vertical: 40),
            child: LayoutBuilder(
              builder: (context, constraints) {
      
      
                return Flex(
                  direction:  screenWidth >= 700 ? Axis.horizontal : Axis.vertical,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
      
                    // LEFT BOX (ICON)
      
                    Container(
                      width:  screenWidth >= 700 ? 600 : double.infinity,
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
                      width:  screenWidth >= 700? 50 : 0,
                      height:  screenWidth >= 700? 0 : 40,
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
                              border: Border.all(color: Colors.deepOrangeAccent),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: const Text(
                              "ERROR FALSE",
                              style: TextStyle(
                                color: Colors.deepOrangeAccent,
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
                                  style: TextStyle(color: Colors.deepOrangeAccent),
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
                                  color: Colors.deepOrangeAccent.withOpacity(.1),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Icon(
                                  Icons.cloud_outlined,
                                  color: Colors.deepOrangeAccent,
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
                              backgroundColor: Colors.deepOrangeAccent,
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
      
      
          Stack(
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
                padding:  EdgeInsets.symmetric(horizontal: screenWidth >= 700? 50:20, vertical: 60),
                child: LayoutBuilder(
                  builder: (context, constraints) {
      
      
                    final PageController controller = PageController();
                    ValueNotifier<int> pageIndex = ValueNotifier(0);
      
                    // total items
                    final int totalItems = 9;
      
                    // items per page
                    final int itemsPerPage = screenWidth >= 700 ? 3 : 1;
      
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
                              color: Colors.deepOrangeAccent,
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
                                style: TextStyle(color: Colors.deepOrangeAccent),
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
                                  crossAxisCount: screenWidth >= 700 ? 3 : 1,
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
                                            color: Colors.deepOrangeAccent,
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
                                            ? Colors.deepOrangeAccent
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
      
          Container(
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

          SizedBox(height: 80,),

          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
      
                Flex(
                  spacing: 20,
                  direction: screenWidth >= 700 ? Axis.horizontal: Axis.vertical,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      spacing: 15,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                          decoration: BoxDecoration(
                            color: Colors.deepOrangeAccent,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            'Start Business',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const Text(
                          'Choose Your Best Plan',
                          style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
      
                    Container(
                      height: screenWidth >= 700 ?100:2,width: screenWidth >= 700 ?2:double.infinity,color: Colors.deepOrangeAccent,
                    ),
      
                    Text('paradigms. Monotonectally extend open-source mvia competitive methods of empowerment dri revolutionize stand- business.',
                      style: TextStyle(fontSize: 16,color: Colors.grey.shade700),)
                  ],
                ),
                const SizedBox(height: 40),
      
                GridView.builder(
                  itemCount: 4,
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: screenWidth >= 700 ?4:1,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                      childAspectRatio: 1/1.2
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      height: 400,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: Colors.grey.shade300,
                          width: 1,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
                            decoration: BoxDecoration(
                              color: Colors.deepOrangeAccent,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(16),
                                topRight: Radius.circular(16),
                              ),
                            ),
                            child: Column(
                              children:  [
                                Text(
                                  '\$4${index}',
                                  style: TextStyle(
                                    fontSize: 48,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Standard Plan',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(24),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 24,
                                      height: 24,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(color: Colors.orange, width: 2),
                                      ),
                                      child: const Icon(Icons.check, size: 16, color: Colors.orange),
                                    ),
                                    const SizedBox(width: 12),
                                    Text(
                                      '30 Days Trial Features',
                                      style: TextStyle(fontSize: 15, color: Colors.grey.shade600),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  children: [
                                    Container(
                                      width: 24,
                                      height: 24,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(color: Colors.orange, width: 2),
                                      ),
                                      child: const Icon(Icons.check, size: 16, color: Colors.orange),
                                    ),
                                    const SizedBox(width: 12),
                                    Text(
                                      'Multi-Language Content',
                                      style: TextStyle(fontSize: 15, color: Colors.grey.shade600),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  children: [
                                    Container(
                                      width: 24,
                                      height: 24,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(color: Colors.orange, width: 2),
                                      ),
                                      child: const Icon(Icons.check, size: 16, color: Colors.orange),
                                    ),
                                    const SizedBox(width: 12),
                                    Text(
                                      'Unlimited Features',
                                      style: TextStyle(fontSize: 15, color: Colors.grey.shade600),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  children: [
                                    Container(
                                      width: 24,
                                      height: 24,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(color: Colors.orange, width: 2),
                                      ),
                                      child: const Icon(Icons.check, size: 16, color: Colors.orange),
                                    ),
                                    const SizedBox(width: 12),
                                    Text(
                                      'Data backup and recovery',
                                      style: TextStyle(fontSize: 15, color: Colors.grey.shade600),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                          Center(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.deepOrangeAccent,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                              child: Text('CHOOSE PLAN',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600, color: Colors.white),),
                            ),
                          ),
                          SizedBox(height: 20,),
                        ],
                      ),
                    );
                  },),
              ],
            ),
          ),
      
          Padding(
            padding: const EdgeInsets.all(40),
            child: Flex(
              direction: screenWidth >= 700 ? Axis.horizontal: Axis.vertical,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
      
                Container(
                  height: 700,
                  width: 650,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header
                      Row(
                        children: [
                          Container(
                            width: 4,
                            height: 20,
                            color: Colors.deepOrangeAccent,
                          ),
                          const SizedBox(width: 12),
                          const Text(
                            'CONTACT US',
                            style: TextStyle(
                              color: Colors.deepOrangeAccent,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Make an Online Appoinemnt Booking\nFor Business Planing.',
                        style: TextStyle(
                          fontSize: screenWidth >= 700 ?32:25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          height: 1.3,
                        ),
                      ),
                      const SizedBox(height: 40),
      
                      // Form Fields Row 1
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 60,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                  color: Colors.grey.shade300,
                                  width: 1,
                                ),
                              ),
                              child: const TextField(
                                decoration: InputDecoration(
                                  hintText: 'Your Name *',
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                  ),
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 24,
                                    vertical: 18,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: Container(
                              height: 60,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                  color: Colors.grey.shade300,
                                  width: 1,
                                ),
                              ),
                              child: const TextField(
                                decoration: InputDecoration(
                                  hintText: 'Your E-Mail *',
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                  ),
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 24,
                                    vertical: 18,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
      
                      // Form Fields Row 2
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 60,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                  color: Colors.grey.shade300,
                                  width: 1,
                                ),
                              ),
                              child: const TextField(
                                decoration: InputDecoration(
                                  hintText: 'Subject *',
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                  ),
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 24,
                                    vertical: 18,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: Container(
                              height: 60,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                  color: Colors.grey.shade300,
                                  width: 1,
                                ),
                              ),
                              child: const TextField(
                                decoration: InputDecoration(
                                  hintText: 'Phone *',
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                  ),
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 24,
                                    vertical: 18,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
      
                      // Message Field
                      Container(
                        height: 160,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                            color: Colors.grey.shade300,
                            width: 1,
                          ),
                        ),
                        child: const TextField(
                          maxLines: 6,
                          decoration: InputDecoration(
                            hintText: 'Message',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                            ),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 18,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
      
                      // Submit Button
                      Container(
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.deepOrangeAccent,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.orange.withOpacity(0.3),
                              blurRadius: 15,
                              offset: const Offset(0, 8),
                            ),
                          ],
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(30),
                            onTap: () {},
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 40),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    'SEND NOW',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.5,
                                    ),
                                  ),
                                  SizedBox(width: 12),
                                  Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
      
      
                Container(
                  height: 600,
                  width: 600,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey.shade200
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        margin: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.deepOrangeAccent,
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            // Animated Circle Background
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 3,
                                ),
                              ),
                            ),
                            // Play Text
                            const Text(
                              'Play',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            // Arc Decoration
                            Positioned(
                              top: 0,
                              right: 0,
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(50),
                                    bottomLeft: Radius.circular(50),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
      
        ],
      ),
    );
  }
}

class TrapezoidClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.moveTo(20, 0);
    path.lineTo(size.width - 20, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}


class _HoverTapCard extends StatefulWidget {
  final String title;
  final String subtitle;

  const _HoverTapCard({required this.title, required this.subtitle});

  @override
  State<_HoverTapCard> createState() => _HoverTapCardState();
}

class _HoverTapCardState extends State<_HoverTapCard> {
  bool _isHovered = false;
  bool _isTapped = false;

  @override
  Widget build(BuildContext context) {
    final bool isActive = _isHovered || _isTapped;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTapDown: (_) => setState(() => _isTapped = true),
        onTapUp: (_) => setState(() => _isTapped = false),
        onTapCancel: () => setState(() => _isTapped = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          decoration: BoxDecoration(
            color: isActive ? Colors.deepOrangeAccent : Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 6,
                offset: Offset(0, 4),
              ),
            ],
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 300),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: isActive ? Colors.white : Colors.black,
                ),
                child: Text(widget.title),
              ),
              const SizedBox(height: 8),
              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 300),
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: isActive ? Colors.white : Colors.grey.shade700,
                ),
                child: Text(widget.subtitle,textAlign: TextAlign.center,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
