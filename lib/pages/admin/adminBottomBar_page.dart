import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:trusche/configs/colors.dart';
import 'package:trusche/pages/admin/adminChat_page.dart';
import 'package:trusche/pages/admin/adminCitizen_page.dart';
import 'package:trusche/pages/admin/adminHome_page.dart';
import 'package:trusche/pages/admin/adminSchedule_page.dart';
import 'package:trusche/pages/admin/adminStatus_page.dart';

class AdminBottomBarPage extends StatefulWidget {
  const AdminBottomBarPage({super.key});

  @override
  State<AdminBottomBarPage> createState() => _AdminBottomBarPageState();
}

class _AdminBottomBarPageState extends State<AdminBottomBarPage> {
  PageController _pageController = PageController(initialPage: 2);
  int maxCount = 5;

  final List<Widget> bottomBarPages = [
    const AdminHomePage(),
    const AdminSchedulePage(),
    const AdminStatusPage(),
    const AdminCitizenPage(),
    const AdminChatPage(),

  ];

   @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
            bottomBarPages.length, (index) => bottomBarPages[index]),
      ),
      extendBody: true,
      bottomNavigationBar: (bottomBarPages.length <= maxCount)
          ? AnimatedNotchBottomBar(
              pageController: _pageController,
              color: Colors.white,
              showLabel: false,
              notchColor: ConstantColors.primaryColor,
              bottomBarItems: [
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.home_filled,
                    color: Colors.blueGrey,
                  ),
                  activeItem: Icon(
                    Icons.home_filled,
                    color: Colors.white,
                  ),
                  itemLabel: 'Page 1',
                ),
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.calendar_month,
                    color: Colors.blueGrey,
                  ),
                  activeItem: Icon(
                    Icons.calendar_month,
                    color: Colors.white,
                  ),
                  itemLabel: 'Page 2',
                ),
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.task_alt,
                    color: Colors.blueGrey,
                  ),
                  activeItem: Icon(
                    Icons.task_alt,
                    color: Colors.white,
                  ),
                  itemLabel: 'Page 3',
                ),
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.folder_shared,
                    color: Colors.blueGrey,
                  ),
                  activeItem: Icon(
                    Icons.folder_shared,
                    color: Colors.white,
                  ),
                  itemLabel: 'Page 4',
                ),
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.sms_outlined,
                    color: Colors.blueGrey,
                  ),
                  activeItem: Icon(
                    Icons.sms_outlined,
                    color: Colors.white,
                  ),
                  itemLabel: 'Page 5',
                ),
                
              ],
              onTap: (index) {
                /// control your animation using page controller
                _pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeIn,
                );
              },
            )
          : null,
    );
  }
}