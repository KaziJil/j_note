// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:j_note/Screen/login_screen.dart';
//
// class SignUpScreen extends StatefulWidget {
//   const SignUpScreen({Key? key}) : super(key: key);
//
//   @override
//   _SignUpScreenState createState() => _SignUpScreenState();
// }
//
// class _SignUpScreenState extends State<SignUpScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Container(
//                 height: 150,
//                 width: 100,
//                 child: CircleAvatar(
//                   backgroundColor: Colors.black,
//                   child: Icon(
//                     Icons.person,
//                     size: 100,
//                   ),
//                 ),
//               ),
//               Container(
//                   child: Text(
//                 "Sign Up",
//                 style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
//               )),
//               SizedBox(height: 10,),
//               Container(
//                 margin: EdgeInsets.only(right: 15,left: 15),
//                 child: TextFormField(
//                   decoration: InputDecoration(
//                     hintText: "Enter Your Name",hintStyle: TextStyle(fontSize: 20,color: Colors.black),
//                     labelText: "Name:",
//                     labelStyle: TextStyle(fontSize: 20,color: Colors.blue),
//                     border: OutlineInputBorder()
//                   ),
//                   keyboardType: TextInputType.name,
//                 ),
//               ),
//               SizedBox(height: 10,),
//               Container(
//                 margin: EdgeInsets.only(right: 15,left: 15),
//                 child: TextFormField(
//                   decoration: InputDecoration(
//                       hintText: "Enter Your Phone Number",hintStyle: TextStyle(fontSize: 20,color: Colors.black),
//                       labelText: "Phone:",
//                       labelStyle: TextStyle(fontSize: 20,color: Colors.blue),
//                       border: OutlineInputBorder()
//                   ),
//                   keyboardType: TextInputType.phone,
//                   maxLength: 11,
//                 ),
//               ),
//               SizedBox(height: 10,),
//               Container(
//                 margin: EdgeInsets.only(right: 15,left: 15),
//                 child: TextFormField(
//                   decoration: InputDecoration(
//                       hintText: "Enter Your Email",hintStyle: TextStyle(fontSize: 20,color: Colors.black),
//                       labelText: "Email:",
//                       labelStyle: TextStyle(fontSize: 20,color: Colors.blue),
//                       border: OutlineInputBorder()
//                   ),
//                   keyboardType: TextInputType.emailAddress,
//                 ),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Container(
//                     margin: EdgeInsets.only(left: 15,top: 15),
//                     height: 50,
//                     width: 150,
//                     child: ElevatedButton(
//                       onPressed: (){
//                         Navigator.of(context).pop(MaterialPageRoute(builder: (context)=>LoginScreen()));
//                       },
//                       child: Text("Back"),
//                     ),
//                   ),
//                   SizedBox(width: 15,),
//                   Container(
//                     margin: EdgeInsets.only(left: 15,top: 15),
//                     height: 50,
//                     width: 150,
//                     child: ElevatedButton(
//                       onPressed: (){
//                         Navigator.of(context).push(MaterialPageRoute(builder: (contex)=>LoginScreen()));
//                       },
//                       child: Text("SignUp"),
//                     ),
//                   ),
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
