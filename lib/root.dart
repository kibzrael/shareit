import 'package:flutter/material.dart';
import 'package:shareit/file_transfer.dart';
import 'package:shareit/home.dart';
import 'package:shareit/settings.dart';

class Root extends StatefulWidget {
  const Root({Key? key}) : super(key: key);

  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> {
  late PageController controller;
  int pageIndex = 0;

  @override
  void initState() {
    super.initState();
    controller = PageController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: controller,
          children: const [
            Home(),
            FileTransfer(),
            Settings(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: pageIndex,
            onTap: (index) {
              controller.jumpToPage(index);
              setState(() => pageIndex = index);
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.download), label: 'Files'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'Settings'),
            ]));
  }
}
