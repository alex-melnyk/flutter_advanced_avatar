import 'package:flutter/material.dart';
import 'package:flutter_advanced_avatar/flutter_advanced_avatar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Advanced Avatar Example'),
        ),
        body: Center(
          child: GridView.count(
            shrinkWrap: true,
            crossAxisCount: 3,
            children: [
              AdvancedAvatar(
                name: 'John Doe',
                statusColor: Colors.red,
              ),
              AdvancedAvatar(
                name: 'Smith Corey',
                statusColor: Colors.green,
                statusAngle: 45,
              ),
              AdvancedAvatar(
                child: Icon(
                  Icons.account_circle,
                  color: Colors.white,
                  size: 40,
                ),
              ),
              AdvancedAvatar(
                name: 'John Doe',
                statusColor: Colors.red,
                size: 40,
              ),
              AdvancedAvatar(
                name: 'Smith Corey',
                statusColor: Colors.green,
                statusAngle: 45,
                size: 80,
              ),
              AdvancedAvatar(
                child: Icon(
                  Icons.account_circle,
                  color: Colors.white,
                  size: 40,
                ),
                size: 120,
              ),
              AdvancedAvatar(
                child: Text('CMYK'),
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      width: 16.0,
                      height: 16.0,
                      color: Colors.cyan,
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 16.0,
                      height: 16.0,
                      color: Colors.pinkAccent,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      width: 16.0,
                      height: 16.0,
                      color: Colors.yellow,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      width: 16.0,
                      height: 16.0,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              AdvancedAvatar(
                statusColor: Colors.deepOrange,
                image: AssetImage('assets/images/avatar.jpg'),
                foregroundDecoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.deepOrange.withOpacity(0.75),
                    width: 5.0,
                  ),
                ),
              ),
              AdvancedAvatar(
                statusSize: 16,
                statusColor: Colors.green,
                image: AssetImage('assets/images/avatar.jpg'),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      blurRadius: 16.0,
                    ),
                  ],
                ),
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 20,
                      height: 20,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                          width: 0.5,
                        ),
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        '12',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
