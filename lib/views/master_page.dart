import 'package:flutter/material.dart';
import 'package:vstock/views/history/history_page.dart';
import 'package:vstock/views/home/home_page.dart';
import 'package:vstock/views/enterprise/enterprise_page.dart';
import 'package:vstock/views/user/user_page.dart';

class MasterPage extends StatefulWidget {
  const MasterPage({super.key});

  static Page<void> page() => const MaterialPage<void>(child: MasterPage());

  @override
  State<MasterPage> createState() => _MasterPageState();
}

class _MasterPageState extends State<MasterPage> {
  int currentPageIndex = 0;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xffF1F5F9),
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentPageIndex,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          NavigationDestination(
            icon: Icon(Icons.history),
            label: "Riwayat",
          ),
          NavigationDestination(
            icon: Icon(Icons.storefront),
            label: "Usaha",
          ),
          NavigationDestination(
            icon: Icon(Icons.account_circle_outlined),
            label: "Saya",
          ),
        ],
      ),
      body: const <Widget>[
        HomePage(),
        HistoryPage(),
        EnterprisePage(),
        UserPage(),
      ][currentPageIndex],
    );
  }
}
