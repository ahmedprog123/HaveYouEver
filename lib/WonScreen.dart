import 'package:flutter/material.dart';
import 'HomeScreen.dart';

class WonScreen extends StatefulWidget {
  @override
  _WonScreenState createState() => _WonScreenState();
}

class _WonScreenState extends State<WonScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Have You Ever',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 70),
        child: Column(
          children: [
            Text(
              'winner',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                width: 200,
                height: 200,
                child: Image.asset('images/winner.png'),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            ElevatedButton(
              child: Text(
                'Play again',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
