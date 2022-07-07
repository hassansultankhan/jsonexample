import 'package:flutter/material.dart';
import 'package:json_access/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class login extends StatefulWidget {
  const login({ Key? key }) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  void initState() {
    checklogin();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            Spacer(),
            ElevatedButton(onPressed: ()=> login(), child: Text('Login')),
          ],
        ),
      ),
      
    );
  }
  login()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('login', true);
     Navigator.push(context, MaterialPageRoute(builder: (context)=> homescreen()));
  }
  void checklogin() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool test = await prefs.getBool('login') ?? false;
    if(test){
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> homescreen()),
                                    (Route<dynamic> route ) => false);
    
    }
  
}
}

