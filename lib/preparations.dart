import 'package:flutter/material.dart';

class Preparations extends StatefulWidget {
  const Preparations({Key? key}) : super(key: key);

  @override
  _PreparationsState createState() => _PreparationsState();
}

class _PreparationsState extends State<Preparations> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Preparations'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 45,
              horizontal: 30,
            ),
            child: Text(
              'Enable the following settings to enable file sharing',
              style: TextStyle(
                  fontSize: 21,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.portable_wifi_off),
            title: const Text('Turn off hotspot'),
            trailing:
                OutlinedButton(onPressed: () {}, child: const Text('Settings')),
          ),
          ListTile(
            leading: const Icon(Icons.location_on),
            title: const Text('Turn on GPS'),
            subtitle:
                const Text('Turn on location to connect to nearby devices'),
            trailing:
                OutlinedButton(onPressed: () {}, child: const Text('Settings')),
          ),
          const SizedBox(height: 8),
          ListTile(
            leading: const Icon(Icons.sync),
            title: const Text('Grant permissions'),
            subtitle: const Text('Grant permissions to access your files'),
            trailing:
                OutlinedButton(onPressed: () {}, child: const Text('Settings')),
          ),
          const SizedBox(height: 8),
          ListTile(
            leading: const Icon(Icons.wifi),
            title: const Text('Turn on wifi'),
            subtitle: const Text(
                'Wifi will help you connect to your friend and transfer'),
            trailing:
                OutlinedButton(onPressed: () {}, child: const Text('Open')),
          ),
          const SizedBox(height: 8),
          ListTile(
            leading: const Icon(Icons.bluetooth),
            title: const Text('Open Bluetooth'),
            subtitle: const Text(
                'Bluetooth is used to accelerate the connection speed'),
            trailing:
                OutlinedButton(onPressed: () {}, child: const Text('Open')),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          width: double.infinity,
          height: 50,
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          decoration: BoxDecoration(
              color: Colors.blue, borderRadius: BorderRadius.circular(30)),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
            Icon(
              Icons.send,
              size: 27,
              color: Colors.white,
            ),
            SizedBox(width: 12),
            Text(
              'Next',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            )
          ]),
        ),
      ),
    );
  }
}
