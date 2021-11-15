import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:task_post_get/api/api.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          children: [
            MaterialButton(
              color: Colors.black,
              onPressed: () async {
                print('Posting data...');
                await postData().then((value) {
                  print(value);
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.SUCCES,
                    animType: AnimType.BOTTOMSLIDE,
                    title: 'Post',
                    desc: '$value',
                    btnOkOnPress: () {},
                  ).show();
                });
              },
              child: const Text(
                'Post',
                style: TextStyle(color: Colors.white),
              ),
            ),
            MaterialButton(
              color: Colors.deepOrangeAccent,
              onPressed: () async {
                print('Getting data...');

                await getData().then((value) {
                  print(value);
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.SUCCES,
                    animType: AnimType.BOTTOMSLIDE,
                    title: 'Get',
                    desc: '$value',
                    btnOkOnPress: () {},
                  ).show();
                });
              },
              child: Text('Get'),
            ),
          ],
        ),
      ),
    );
  }
}
