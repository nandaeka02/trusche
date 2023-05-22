import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:trusche/pages/user/userHome_page.dart';
import 'package:trusche/pages/user/userPembayaran_page.dart';
import 'package:trusche/pages/user/userRiwayatPembayaran_page.dart';
// import 'package:flutter_svg/flutter_svg.dart';



class UserbotBar extends StatefulWidget {
  const UserbotBar({Key? key}) : super(key: key);

  @override
  State<UserbotBar> createState() => UserbotBarState();
}

class UserbotBarState extends State<UserbotBar> {
  /// Controller to handle PageView and also handles initial page
  final _pageController = PageController(initialPage: 2);

  int maxCount = 3;

  /// widget list
  final List<Widget> bottomBarPages = [
    const UserPembayaran(),
    const UserHomepage(),
    const UserRiwayatPembayaran(),

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
              color: HexColor("#EEF2E6"),
              showLabel: false,
              notchColor: HexColor("#609C56"),
              bottomBarItems: [
                const BottomBarItem(
                  inActiveItem: Icon(
                    Icons.account_balance_wallet_outlined,
                    color: Colors.blueGrey,
                  ),
                  activeItem: Icon(
                    Icons.account_balance_wallet_outlined,
                    color: Colors.white,
                  ),
                  itemLabel: 'Page 1',
                ),
                const BottomBarItem(
                  inActiveItem: Icon(
                    Icons.home,
                    color: Colors.blueGrey,
                  ),
                  activeItem: Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                  itemLabel: 'Page 2',
                ),

                ///svg example
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.ballot_outlined,
                    color: Colors.blueGrey,
                  ),
                  activeItem: Icon(
                    Icons.ballot_outlined,
                    color: Colors.white,
                  ),
                  itemLabel: 'Page 3',
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



class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.red, child: const Center(child: Text('Page 3')));
  }
}

