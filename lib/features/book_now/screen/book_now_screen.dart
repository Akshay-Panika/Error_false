import 'package:error_false/core/widget/screen_helper.dart';
import 'package:flutter/material.dart';
import '../../../core/widget/responsive_font.dart';


class BookNowScreen extends StatelessWidget {
  const BookNowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (ScreenHelper.isDesktop(context)) {
          return Container(
            height: 640,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  child: Image.asset('assets/service/akshay_panika_okay.jpeg'),
                ),
                Expanded(child: _formSection(context)),
              ],
            ),
          );
        }

        if (ScreenHelper.isTablet(context)) {
          return Container(
            height: 700,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Expanded(
                  child: Image.asset('assets/service/akshay_panika_okay.jpeg'),
                ),
                Expanded(child: _formSection(context)),
              ],
            ),
          );
        }

        return Container(
          height: 700,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Expanded(
                child: Image.asset('assets/service/akshay_panika_okay.jpeg'),
              ),
              Expanded(child: _formSection(context)),
            ],
          ),
        );
      },
    );
  }

  Widget _formSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        SizedBox(height: ScreenHelper.isDesktop(context)? 100:50),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text(
              "Book a Consultation",
              style: TextStyle(
                fontSize: RFont.size(context, 20, tablet: 30, desktop: 40),
                color: Colors.deepOrangeAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              "Scan the QR code or click the button below to connect with us directly on WhatsApp.",
              style: TextStyle(
                  fontSize: RFont.size(context, 12, tablet: 14, desktop: 16),
                  color: Colors.grey.shade700),
            ),
          ],
        ),

        const SizedBox(height: 50),

        Expanded(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/service/whatsapp_qr.jpeg'),
              ),
            ),
          ),
        ),
        const SizedBox(height: 50),
      ],
    );
  }
}
