import 'package:flutter/material.dart';
import 'constants.dart';

import 'pages/cart_page.dart';
import 'pages/catalog_page.dart';
import 'pages/favorites_page.dart';
import 'pages/home_page.dart';
import 'pages/profile_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  int homeIndex = 2;
  int catalogIndex = 1;
  int currentIndex = 2;

  final List<StatefulWidget> pages = const
  [
    FavoritesPage(),
    CatalogPage(),
    HomePage(),
    CartPage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      backgroundColor: secondaryColor,
      extendBody: true,
      extendBodyBehindAppBar: true,

      appBar: navBarTop(),

      body: IndexedStack
      (
        index: currentIndex,
        children: pages, 
      ),

      bottomNavigationBar: navBarBot(),

      floatingActionButton: navBarBotFAB(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  PreferredSizeWidget navBarTop()
  {
    double screenWidth = MediaQuery.of(context).size.width;
    double navBarTopHeight = screenWidth * navBarTopH;
    double fontSizeLrg = screenWidth * headingFontSize;
    double avatarRadius = screenWidth * iconSizeL;

    return AppBar
    (
      title: Row
      (
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: 
        [
          
              Row
              (
                children: 
                [
                  InkWell
                  (
                    onTap: () 
                    {
                      setState
                      (() 
                        {
                          currentIndex = homeIndex;
                        }
                      );
                    },
                    customBorder: const CircleBorder(),
                    child: Padding
                    (
                      padding: const EdgeInsets.all(4.0),
                      child: CircleAvatar
                      (
                        radius: avatarRadius,
                        backgroundColor: primaryColor,
                        backgroundImage: const AssetImage
                        (
                          "assets/images/logo.jpg"
                        )
                      ),
                    )
                  ),
                  const SizedBox
                  (
                    width: iconTextGap,
                  ),
                  GestureDetector
                  (
                    onTap: () 
                    {
                      setState
                      (() 
                        {
                          currentIndex = homeIndex;
                        }
                      );
                    },
                    child: Text
                    (
                      brandName,
                      style: TextStyle
                      (
                        fontSize: fontSizeLrg,
                        fontWeight: FontWeight.bold,
                        letterSpacing: letterSpacing,
                        color: headingTextColor
                      ),
                    ),
                  )
                ],
              ),
              InkWell
              (
                onTap: () 
                {
                  setState
                  (() 
                    {
                      currentIndex = pages.length - 1;
                    }
                  );
                },
                customBorder: const CircleBorder(),
                child: Padding
                (
                  padding: const EdgeInsets.all(4.0),
                  child: CircleAvatar
                  (
                    radius: avatarRadius,
                    backgroundColor: highlightColor,
                    child: CircleAvatar
                    (
                      radius: avatarRadius - 1,
                      backgroundColor: primaryColor,
                      child: CircleAvatar
                      (
                        radius: avatarRadius - 3,
                        backgroundColor: primaryColor,
                        backgroundImage: const AssetImage
                        (
                          "assets/images/userDemo.jpg"
                        )
                      ),
                    ),
                  ),
                )
              ),
        ],
      ),
      centerTitle: true,
      backgroundColor: primaryColor,
      toolbarHeight: navBarTopHeight,
      shape: const RoundedRectangleBorder
      (
        borderRadius: BorderRadius.only
        (
          bottomLeft: Radius.circular(elementBorderRadius),
          bottomRight: Radius.circular(elementBorderRadius),
        )
      ),
    );
  }
  Widget navBarBot()
  {
    double screenWidth = MediaQuery.of(context).size.width;
    double fontSizeReg = screenWidth * bodyFontSize;
    double iconSizeLrg = screenWidth * iconSizeL;

    return ClipRRect
    (
      borderRadius: const BorderRadius.only
      (
        topLeft: Radius.circular(elementBorderRadius),
        topRight: Radius.circular(elementBorderRadius),
      ),
      child: BottomAppBar
      (
        shape: const CircularNotchedRectangle(),
        child: Theme
        (
          data: Theme.of(context).copyWith
          (
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: BottomNavigationBar
          (
            onTap: (index) 
            {
              setState
              (() 
                {
                  currentIndex = index;
                }
              );
            },
            currentIndex: currentIndex,
            iconSize: iconSizeLrg,
            selectedItemColor: secondaryColor,
            unselectedItemColor: dimColor,
            backgroundColor: primaryColor,
            elevation: 0.0,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedLabelStyle: TextStyle
            (
              fontSize: fontSizeReg,
              fontWeight: FontWeight.bold,
              letterSpacing: letterSpacing,
            ),
            unselectedLabelStyle: TextStyle
            (
              fontSize: fontSizeReg,
              fontWeight: FontWeight.normal,
              letterSpacing: letterSpacing,
            ),
            type: BottomNavigationBarType.fixed,
            items:
            [
              const BottomNavigationBarItem
              (
                icon: Icon(Icons.favorite_rounded),
                label: "Favorites",
              ),
              const BottomNavigationBarItem
              (
                icon: Icon(Icons.menu_book_rounded),
                label: "Catalog",
              ),
              BottomNavigationBarItem
              (
                icon: SizedBox(height: iconSizeLrg),
                label: "Home",
              ),
              const BottomNavigationBarItem
              (
                icon: Icon(Icons.shopping_cart_rounded),
                label: "Cart",
              ),
              const BottomNavigationBarItem
              (
                icon: Icon(Icons.person_rounded),
                label: "Profile",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget navBarBotFAB()
  {
    double screenWidth = MediaQuery.of(context).size.width;
    double iconSizeLrg = screenWidth * iconSizeL;

    return SizedBox
    (
      height: iconSizeLrg * 2.5,
      width: iconSizeLrg * 2.5,
      child: FloatingActionButton
      (
        onPressed: () 
        {
          setState
          (() 
            {
              currentIndex = homeIndex;
            }
          );
        },
        backgroundColor: primaryColor,
        foregroundColor: currentIndex == homeIndex ? secondaryColor : secondaryColorDim,
        shape: RoundedRectangleBorder
        (
          side: const BorderSide
          (
            width: 4.0, 
            color: tertiaryColor,
          ),
          borderRadius: BorderRadius.circular(100.0),
        ),
        child: Icon
        (
          Icons.home_rounded,
          size: iconSizeLrg,
        ),
      ),
    );
  }
}

void main() => runApp
              (
                const MaterialApp
                (
                  debugShowCheckedModeBanner: false,
                  home: MainPage(),
                )
              );
