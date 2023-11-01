import 'package:flutter/material.dart';
import 'package:unicalm_v2/core/services/assessment_service.dart';
import 'package:unicalm_v2/core/views/home/home_page.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  int _currentPage = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();

    _pageController = PageController(
      initialPage: _currentPage,
    );
  }

  void _setCurrentPage(page) {
    setState(() {
      _currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
                controller: _pageController,
                onPageChanged: _setCurrentPage,
                children: const [
                  HomePage(),
                  AssessmentService(),
                ],
              ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPage,
        onTap: (page) {
          _pageController.animateToPage(
            page,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeIn,
          );
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Histórico',
          ),
        ],
      ),
    );
  }
}
