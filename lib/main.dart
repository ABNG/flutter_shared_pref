import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttersharedpref/shared_pref.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserPreferences().init();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController textEditingController = TextEditingController();
  String myTextValue;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myTextValue = UserPreferences().data;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: textEditingController,
                  decoration: InputDecoration(
                      hintText: myTextValue,
                      hintStyle: TextStyle(
                        color: Colors.black54,
                      )),
                ),
                RaisedButton(
                  onPressed: () {
                    UserPreferences().data = textEditingController.text;
                  },
                  child: Text("Save Data"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
