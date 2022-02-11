import 'package:flutter/material.dart';
import 'package:shareit/files/photos.dart';
import 'package:shareit/preparations.dart';

class SelectFiles extends StatefulWidget {
  const SelectFiles({Key? key}) : super(key: key);

  @override
  _SelectFilesState createState() => _SelectFilesState();
}

class _SelectFilesState extends State<SelectFiles>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  List selected = [];

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Files'),
        bottom: TabBar(
            controller: tabController,
            isScrollable: true,
            labelStyle:
                const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            labelColor: Colors.black,
            tabs: const [
              Tab(text: 'Files'),
              Tab(text: 'Apps'),
              Tab(text: 'Photos'),
              Tab(text: 'Videos'),
              Tab(text: 'Audio'),
            ]),
      ),
      body: TabBarView(controller: tabController, children: [
        for (int i = 0; i < 5; i++)
          i == 2 ? Photos() : Center(child: Text('Tab $i'))
      ]),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          child: LayoutBuilder(builder: (context, constraints) {
            double width = (constraints.maxWidth - 30) / 2;
            return Row(children: [
              Container(
                width: width,
                height: 42,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[400]!, width: 2),
                    borderRadius: BorderRadius.circular(30)),
                child: Text(
                  'Selected ${selected.length}',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(width: 30),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: ((context) => const Preparations())));
                },
                child: Container(
                  width: width,
                  height: 42,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(30)),
                  child: const Text(
                    'Next',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
              ),
            ]);
          }),
        ),
      ),
    );
  }
}
