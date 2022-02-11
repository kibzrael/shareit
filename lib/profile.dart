import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          const Spacer(),
          SizedBox(
            child: Stack(
              children: [
                CircleAvatar(
                  radius: 36,
                  backgroundColor:
                      Theme.of(context).inputDecorationTheme.fillColor,
                  child: const Center(
                      child: Icon(
                    Icons.person,
                    size: 30,
                  )),
                ),
                const Align(
                  alignment: Alignment.bottomRight,
                  child: Card(
                    elevation: 3,
                    shape: CircleBorder(),
                    child: Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Icon(Icons.edit),
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 15),
          TextField(
            decoration: const InputDecoration(hintText: 'Device name'),
            onChanged: (text) {},
          ),
          const Spacer(),
          ElevatedButton(onPressed: () {}, child: const Text('Done')),
          const Spacer(),
        ],
      )),
    );
  }
}
