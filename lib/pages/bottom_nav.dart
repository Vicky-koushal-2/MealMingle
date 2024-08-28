import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:mealmingle/pages/order.dart';
import 'package:mealmingle/pages/profile.dart';
import 'package:mealmingle/pages/walet.dart';

import 'home.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
 int currentTableIndex = 0;
 late List<Widget> page;
 late Widget currentPage;
late Home homepage;
late Profile profile;
late Order order;
late Walet walet;
  @override
  void initState()
  {
    homepage = Home();
    order = Order();
    profile = Profile();
    walet = Walet();
    page = [homepage, order,walet,profile];
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 65,
        backgroundColor: Colors.white,
        color: Colors.black,
        animationDuration: Duration(milliseconds: 500),
        onTap: (int index){
          setState(() {
            currentTableIndex=index;
          });

        },
        items: [
        Icon(Icons.home_outlined,
          color: Colors.white,
        ),
        Icon(Icons.shopping_bag_outlined,
        color: Colors.white,),
        Icon(Icons.wallet_outlined,color: Colors.white,),
        Icon(Icons.person_outline,color: Colors.white,),
      ],
      ),
      body: page[currentTableIndex],
    );
  }
}
