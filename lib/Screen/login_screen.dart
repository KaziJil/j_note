import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:j_note/Screen/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
 SharedPreferences? loginData;
 bool? newUser;

  TextEditingController nameController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    check_if_user_in_login();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 100),
                height: 150,
                width: 100,
                child: CircleAvatar(
                  backgroundColor: Colors.black,
                  child: Icon(
                    Icons.person,
                    size: 100,
                  ),
                ),
              ),
              Container(
                  child: Text(
                "Sign Up",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              )),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.only(right: 15, left: 15),
                child: TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                      hintText: "Enter Your Name",
                      hintStyle: TextStyle(fontSize: 20, color: Colors.black),
                      labelText: "Name:",
                      labelStyle: TextStyle(fontSize: 20, color: Colors.blue),
                      border: OutlineInputBorder()),
                  keyboardType: TextInputType.name,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.only(right: 15, left: 15),
                child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                      hintText: "Enter Your Email",
                      hintStyle: TextStyle(fontSize: 20, color: Colors.black),
                      labelText: "Email:",
                      labelStyle: TextStyle(fontSize: 20, color: Colors.blue),
                      border: OutlineInputBorder()),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 15, top: 15),
                height: 50,
                width: 150,
                child: ElevatedButton(
                  onPressed: () {
                   String  userName=nameController.text;
                   String email=emailController.text;
                   if(userName !='' && email !=''){
                     print("Succesfully Login");
                     loginData?.setBool("Login", false);
                     loginData?.setString("userName", userName);
                     loginData?.setString("email", email);
                     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));
                   }


                  },
                  child: Text("Login"),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                      child: Container(
                        margin: EdgeInsets.only(top: 10,left: 15),
                          child: Text("You don'n have account?",style: TextStyle(fontSize: 20,color: Colors.black),))),
                  GestureDetector(
                    onTap: (){
                      // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SignUpScreen()));
                    },

                      child: Container(
                    margin: EdgeInsets.only(top: 10,left: 3),
                      child: Text("SignUp",style: TextStyle(color: Colors.red,fontSize: 20),))),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
  void check_if_user_in_login()async{
    loginData=await SharedPreferences.getInstance();
    newUser=(loginData?.getBool("Login") ?? true);

    print(newUser);
    if(newUser==false){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));
    }
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.dispose();
    emailController.dispose();
  }
}
