import 'package:flutter/material.dart';
import 'package:shareit/profile.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        actions: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).dividerColor),
              borderRadius: BorderRadius.circular(15),
              gradient: const LinearGradient(
                  colors: [Colors.blue, Colors.transparent], stops: [0.5, 0.5]),
            ),
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Icon(
                    Icons.light_mode,
                    color: Colors.white,
                    size: 21,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Icon(
                    Icons.dark_mode,
                    color: Colors.grey[800],
                    size: 21,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
          child: Column(
            children: [
              SizedBox(
                width: 90,
                height: 90,
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 45,
                      backgroundColor:
                          Theme.of(context).inputDecorationTheme.fillColor,
                      child: const Center(
                          child: Icon(
                        Icons.person,
                        size: 36,
                      )),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: InkWell(
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: ((context) => const Profile())));
                        },
                        child: const Card(
                          elevation: 3,
                          shape: CircleBorder(),
                          child: Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Icon(Icons.edit, size: 18),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 12),
              const Text('Device name',
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.w500)),
              const SizedBox(height: 30),
              const ListTile(
                leading: Icon(Icons.person_add_alt),
                title: Text('Invite'),
                trailing: Icon(Icons.keyboard_arrow_right, size: 18),
              ),
              const ListTile(
                leading: Icon(Icons.star_border),
                title: Text('Rate us'),
                trailing: Icon(Icons.keyboard_arrow_right, size: 18),
              ),
              const ListTile(
                leading: Icon(Icons.sd_storage),
                title: Text('Storage Location'),
                subtitle: Text('/Internal shared storage/Shareit'),
                trailing: Icon(Icons.keyboard_arrow_right, size: 18),
              ),
              const ListTile(
                leading: Icon(Icons.info_outline),
                title: Text('About'),
                trailing: Icon(Icons.keyboard_arrow_right, size: 18),
              ),
              const SizedBox(height: 30),
              const Text(
                'ShareIt',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const Text('v 1.0.0')
            ],
          ),
        ),
      ),
    );
  }
}
