import 'package:flutter/material.dart';

class BookNowScreen extends StatelessWidget {
  const BookNowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isDesktop = constraints.maxWidth > 1000;
        bool isTablet =
            constraints.maxWidth > 600 && constraints.maxWidth <= 1000;

        return Container(
          width: double.infinity,

          child: isDesktop
              ? _desktopLayout()
              : isTablet
              ? _tabletLayout()
              : _mobileLayout(),
        );
      },
    );
  }

  // ================= DESKTOP =================

  Widget _desktopLayout() {
    return SizedBox(
      height: 850,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          Container(
            margin: EdgeInsets.all(50),
            height: 650,width: 500,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/service/akshay_panika_okay.jpeg"),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 80, vertical: 80),
              child: _formSection(),
            ),
          ),
        ],
      ),
    );
  }


  Widget _tabletLayout() {
    return Column(
      children: [
        SizedBox(
          height: 400,width: 500,
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/service/akshay_panika_okay.jpeg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Padding(
          padding:
          const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
          child: _formSection(),
        ),
      ],
    );
  }

  Widget _mobileLayout() {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 600,width: 600,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/service/akshay_panika_okay.jpeg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: _formSection(),
          ),
        ],
      ),
    );
  }

  Widget _formSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 40),
        const Text(
          "Get In Touch",
          style: TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.bold,
            color: Colors.deepOrangeAccent,
          ),
        ),
        const SizedBox(height: 20),
         Text(
          "Have a project in mind that you think we’d be a great fit for it?\n"
              "We’d love to know what you’re thinking",
          style: TextStyle(
            fontSize: 16,
            height: 1.6,
            color: Colors.grey.shade700,
          ),
        ),
        const SizedBox(height: 40),

        /// Full Name + Email Row
        Row(
          children: [
            Expanded(child: _inputField("Full Name", "Full name")),
            const SizedBox(width: 20),
            Expanded(child: _inputField("Email Address", "Email address")),
          ],
        ),

        const SizedBox(height: 25),

        /// Phone
        _inputField("Your Phone Number", "Phone number"),

        const SizedBox(height: 25),

        /// Message
        _inputField("Message", "Write Your Queries", maxLines: 3),

        const SizedBox(height: 35),

        SizedBox(
          height: 50,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepOrangeAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            onPressed: () {},
            child: const Text(
              "Submit Now",
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        )
      ],
    );
  }

  Widget _inputField(String label, String hint,
      {int maxLines = 1}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 10),
        TextField(
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor: Colors.deepOrangeAccent.withOpacity(0.1),
            contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}
