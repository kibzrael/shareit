import 'package:flutter/material.dart';

class Receive extends StatefulWidget {
  const Receive({Key? key}) : super(key: key);

  @override
  _ReceiveState createState() => _ReceiveState();
}

class _ReceiveState extends State<Receive> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Receive files')),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
        child: Column(
          children: [
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                'Waiting for senders to connect...',
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
            ),
            Spacer(),
            Stack(
              children: [
                Center(
                  child: Card(
                    elevation: 4,
                    margin: EdgeInsets.only(top: 32),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 1.5,
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: Column(
                        children: [
                          SizedBox(height: 32),
                          Text(
                            'Device name',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: 12),
                          Container(
                            width: MediaQuery.of(context).size.width / 2,
                            height: MediaQuery.of(context).size.width / 2,
                            color: Colors.grey[200],
                            alignment: Alignment.center,
                            child: Text('Qr Code'),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Card(
                    elevation: 2,
                    shape: CircleBorder(),
                    child: CircleAvatar(
                      radius: 32,
                      backgroundColor: Colors.transparent,
                      child: Center(
                          child: Icon(
                        Icons.person,
                        size: 36,
                        color: Colors.grey[600],
                      )),
                    ),
                  ),
                ),
              ],
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
