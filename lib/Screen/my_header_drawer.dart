import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class MyHeaderDrawer extends StatefulWidget {
  const MyHeaderDrawer({Key? key}) : super(key: key);

  @override
  _MyHeaderDrawerState createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  SharedPreferences? loginData;
  String? email;
  String? userName;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initial();
  }
  void initial()async{
    loginData=await SharedPreferences.getInstance();
    setState(() {
      email=loginData?.getString("email");
      userName=loginData?.getString("userName");
    });
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 200,
        width: MediaQuery.of(context).size.width,
        color: Colors.orange,
        child: Center(
          child: Container(
            margin: EdgeInsets.only(top: 20),
            child: Column(
              children: [
                Container(
                  height: 100,
                    width: 100,
                    child: CircleAvatar(
                      child: Icon(Icons.person),
                    )),
                SizedBox(height: 3,),
                Text("$userName",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),),
                SizedBox(height: 3,),
                Text('$email',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
