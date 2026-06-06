import 'package:error_false/core/widget/screen_helper.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
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
                Expanded(child: Padding(
                  padding:  EdgeInsets.only(right: ScreenHelper.isDesktop(context) ? 120:0),
                  child: _formSection(context),
                )),
              ],
            ),
          );
        }

        if (ScreenHelper.isTablet(context)) {
          return Container(
            height: 800,
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
          height: 800,
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
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [

        SizedBox(height: ScreenHelper.isDesktop(context)? 100:50),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
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
              "To connect with us, scan the QR Code or click on the QR Code to contact us directly on WhatsApp.",
              style: TextStyle(
                  fontSize: RFont.size(context, 14, tablet: 15, desktop: 16),
                  color: Colors.grey.shade700),
            ),
          ],
        ),

        const SizedBox(height:20),

        Expanded(
          child: InkWell(
            onTap: () async {
              final Uri whatsappUri = Uri.parse(
                // "https://wa.me/918989207770",
                "https://wa.me/918989207770?text=Hello%20Akshay,%20I%20am%20interested%20in%20your%20services."
              );

              if (await canLaunchUrl(whatsappUri)) {
                await launchUrl(
                  whatsappUri,
                  mode: LaunchMode.externalApplication,
                );
              }
            },
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/service/whatsapp_qr.jpeg'),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 50),
      ],
    );
  }
}
