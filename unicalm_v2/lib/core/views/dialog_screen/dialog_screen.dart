import 'package:flutter/material.dart';
import 'package:unicalm_v2/core/views/dialog_screen/dialog1/dialog_one_page.dart';
import 'package:unicalm_v2/core/views/dialog_screen/dialog1/dialog_three_page.dart';
import 'package:unicalm_v2/core/views/dialog_screen/dialog1/dialog_two_page.dart';
import 'package:unicalm_v2/core/ui/styles/constants.dart';

class DialogPageViewOne extends StatefulWidget {
  const DialogPageViewOne({super.key});

  @override
  State<DialogPageViewOne> createState() => _DialogPageViewOneState();
}

class _DialogPageViewOneState extends State<DialogPageViewOne> {
  final _pageController = PageController(initialPage: 0);

  int _activePage = 0;

  final List<Widget> _pages = [
    const DialogOnePage(),
    const DialogTwoPage(),
    const DialogThreePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: (page) {
              setState(() {
                _activePage = page;
              });
            },
            itemCount: _pages.length,
            itemBuilder: (context, index) {
              return _pages[index % _pages.length];
            },
          ),
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            height: 80,
            child: Container(
              color: Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List<Widget>.generate(
                  _pages.length,
                  (index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: InkWell(
                      onTap: () {
                        _pageController.animateToPage(
                          index,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      },
                      child: CircleAvatar(
                        radius: 8,
                        backgroundColor: _activePage == index 
                        ? ColorsConstants.secondaryColor
                        : ColorsConstants.primaryColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
