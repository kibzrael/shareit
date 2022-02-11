import 'dart:io';

import 'package:flutter/material.dart';
import 'package:device_apps/device_apps.dart';

class Apps extends StatefulWidget {
  const Apps({Key? key}) : super(key: key);

  @override
  _AppsState createState() => _AppsState();
}

class _AppsState extends State<Apps> {
  List<Application> apps = [];

  @override
  void initState() {
    super.initState();
    fetchApps();
  }

  fetchApps() async {
    apps = await DeviceApps.getInstalledApplications(includeAppIcons: true);
  }

  @override
  Widget build(BuildContext context) {
    return apps.isEmpty
        ? const Center(child: CircularProgressIndicator())
        : GridView.builder(
            itemCount: apps.length,
            padding: const EdgeInsets.all(8),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, mainAxisSpacing: 8, crossAxisSpacing: 8),
            itemBuilder: (context, index) {
              ApplicationWithIcon app = apps[index] as ApplicationWithIcon;
              String size = '-';

              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.memory(app.icon),
                  ),
                  Text(
                    app.appName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 16.5),
                  ),
                  FutureBuilder<int>(
                      future: File(app.apkFilePath).length(),
                      builder: (context, snapshot) {
                        return Text(
                            snapshot.hasData ? fileSize(snapshot.data!) : '-');
                      })
                ],
              );
            },
          );
  }
}

String fileSize(int bytes) {
  String extension = 'B';
  double value = bytes.toDouble();

  if (value > 1000000000) {
    extension = 'GB';
    value = value / 1000000000;
  } else if (value > 1000000) {
    extension = 'MB';
    value = value / 1000000;
  } else if (value > 1000) {
    extension = 'KB';
    value = value / 1000;
  }

  return '${value.toStringAsFixed(1)} $extension';
}
