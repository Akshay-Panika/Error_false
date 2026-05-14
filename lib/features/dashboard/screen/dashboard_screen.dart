import 'package:flutter/material.dart';
import '../../about/screen/about_screen.dart';
import '../../book_now/screen/book_now_screen.dart';
import '../../footer/screen/footer_screen.dart';
import '../../home/screen/home_screen.dart';
import '../../services/screen/service_screen.dart';
import '../../testimonial/screen/testimonial_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  final ScrollController _scrollController = ScrollController();

  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _serviceKey = GlobalKey();
  final GlobalKey _testimonialKey = GlobalKey();
  final GlobalKey _bookKey = GlobalKey();
  final GlobalKey _footerKey = GlobalKey();

  /// SAFE SCROLL FUNCTION
  void _scrollToSection(GlobalKey key) {
    if (!mounted) return; // mounted check for safety

    final isMobile = MediaQuery.of(context).size.width <= 700;

    if (isMobile) {
      // Close drawer first safely
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;

        Navigator.of(context).maybePop();

        // small delay ensures drawer is closed
        Future.delayed(const Duration(milliseconds: 250), () {
          if (!mounted) return;

          final ctx = key.currentContext;
          if (ctx != null) {
            Scrollable.ensureVisible(
              ctx,
              duration: const Duration(milliseconds: 600),
              curve: Curves.easeInOut,
            );
          }
        });
      });

    } else {
      // Desktop scroll safe
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;

        final ctx = key.currentContext;
        if (ctx != null) {
          Scrollable.ensureVisible(
            ctx,
            duration: const Duration(milliseconds: 600),
            curve: Curves.easeInOut,
          );
        }
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final height = MediaQuery.of(context).size.height;

        return Scaffold(
          backgroundColor: Colors.deepOrangeAccent.withOpacity(0.1),

          /// Drawer only on mobile
          endDrawer: width <= 700
              ? Drawer(
            backgroundColor: Colors.transparent,
            elevation: 0,
            child: Align(
              alignment: Alignment.topRight,
              child: Material(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
                child: SizedBox(
                  width: 150,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10, right: 16),
                            child: IconButton(
                              icon: const Icon(Icons.close),
                              onPressed: () => Navigator.pop(context),
                            ),
                          ),
                        ],
                      ),
                      _drawerTile("Home", _homeKey),
                      _drawerTile("About", _aboutKey),
                      _drawerTile("Service", _serviceKey),
                      _drawerTile("Testimonial", _testimonialKey),
                      _drawerTile("Book Now", _bookKey),
                    ],
                  ),
                ),
              ),
            ),
          )
              : null,

          body: Column(
            children: [
              /// NAVBAR
              Container(
                height: height * 0.08,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: width >= 700
                      ? MainAxisAlignment.spaceAround
                      : MainAxisAlignment.spaceBetween,
                  children: [
                    /// LOGO
                    InkWell(
                      onTap: () => _scrollToSection(_homeKey),
                      child: const Text(
                        "❗❌",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),

                    /// DESKTOP MENU
                    if (width >= 700)
                      Row(
                        spacing: 16,
                        children: [
                          _menuButton("Home", _homeKey),
                          _menuButton("About", _aboutKey),
                          _menuButton("Service", _serviceKey),
                          _menuButton("Testimonial", _testimonialKey),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepOrangeAccent,
                            ),
                            onPressed: () => _scrollToSection(_bookKey),
                            child: const Text(
                              "Book Now",
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        ],
                      ),

                    /// MOBILE MENU BUTTON
                    if (width <= 700)
                      Builder(
                        builder: (context) => IconButton(
                          icon: const Icon(Icons.menu),
                          onPressed: () => Scaffold.of(context).openEndDrawer(),
                        ),
                      ),
                  ],
                ),
              ),

              /// BODY
              Expanded(
                child: SingleChildScrollView(
                  controller: _scrollController,
                  child: Column(
                    children: [
                      Container(key: _homeKey, child: HomeScreen(onBookNowTap: () => _scrollToSection(_bookKey))),
                      Container(key: _aboutKey, child:  AboutScreen(onBookNowTap: () => _scrollToSection(_bookKey))),
                      Container(key: _serviceKey, child: const ServiceScreen()),
                      Container(key: _testimonialKey, child: const TestimonialScreen()),
                      Container(key: _bookKey, child: const BookNowScreen()),
                      Container(key: _footerKey, child: const FooterScreen()),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  /// MENU BUTTON (Desktop)
  Widget _menuButton(String title, GlobalKey key) {
    return TextButton(
      onPressed: () => _scrollToSection(key),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.deepOrangeAccent,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  /// Drawer Tile (Mobile)
  Widget _drawerTile(String title, GlobalKey key) {
    return ListTile(
      title: Text(title, style: const TextStyle(color: Colors.deepOrangeAccent)),
      onTap: () => _scrollToSection(key),
    );
  }
}