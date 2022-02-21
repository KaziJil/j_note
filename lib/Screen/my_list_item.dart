import 'package:flutter/material.dart';
import 'package:j_note/Screen/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
class MyListItem extends StatefulWidget {
  const MyListItem({Key? key}) : super(key: key);

  @override
  _MyListItemState createState() => _MyListItemState();
}

class _MyListItemState extends State<MyListItem> {
  SharedPreferences? loginData;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      child: GestureDetector(
        onTap: (){
          loginData?.setBool("login", true);
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
        },
          child: Text("LogOut")),
    );
  }
}
