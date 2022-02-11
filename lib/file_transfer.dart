import 'package:flutter/material.dart';

class FileTransfer extends StatefulWidget {
  const FileTransfer({Key? key}) : super(key: key);

  @override
  _FileTransferState createState() => _FileTransferState();
}

class _FileTransferState extends State<FileTransfer>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
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
        title: const Text('Files Transfer'),
        bottom: TabBar(
            controller: tabController,
            labelStyle:
                const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            labelColor: Colors.black,
            tabs: const [Tab(text: 'Sent'), Tab(text: 'Received')]),
      ),
      body: TabBarView(controller: tabController, children: [
        for (int i = 0; i < 2; i++)
          ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) => ListTile(
                    title: Text('File $index'),
                    subtitle: const Text('Date transfered'),
                    leading: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          color:
                              Theme.of(context).inputDecorationTheme.fillColor,
                          borderRadius: BorderRadius.circular(5)),
                      child: Icon(
                        i == 0 ? Icons.file_upload : Icons.file_download,
                        size: 30,
                      ),
                    ),
                    trailing: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                          color:
                              Theme.of(context).inputDecorationTheme.fillColor,
                          borderRadius: BorderRadius.circular(15)),
                      child: const Text(
                        'size',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ))
      ]),
    );
  }
}
