import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:json_access/date_details.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login.dart';
import 'prayer.dart';

class homescreen extends StatefulWidget {
  const homescreen({Key? key}) : super(key: key);

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  List<prayer> monthdata = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JSON'),
        centerTitle: true,
      ),
      body: Container(
        child: ListView(
          children: [
            SizedBox(height: 20),

            ElevatedButton(onPressed: () => logout(), child: Text('Log out'),),
            ElevatedButton(onPressed: () => getdata(), child: Text('Get Data'),),
             Row(
            children: [
              Text("fajr"),
              Spacer(),
              Text('dhuhr'),
              Spacer(),
              Text('asr'),
              Spacer(),
              Text('magrib'),
              Spacer(),
              Text('isha'),
            ],),
            SizedBox(height: 20),


            ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: monthdata.length,
                itemBuilder: (context, index) {
                  return Column(
                  children: [
                  InkWell(
                  child: Row(
                    children: [
                      Text('${monthdata[index].fajr}'),
                      Spacer(),
                      Text('${monthdata[index].dhuhur}'),
                      Spacer(),
                      Text('${monthdata[index].asar}'),
                      Spacer(),
                      Text('${monthdata[index].maghrib}'),
                      Spacer(),
                      Text('${monthdata[index].isha}'),
                    ],
                  ),
                  onTap: ()=> move(monthdata[index])
                  
                  ),
                  const SizedBox(height: 5),
                  Container(
                    color: Colors.blueAccent,
                    height: 2,
                  ),

                  
                  ]
                  );

                }),
          ],
        ),
      ),
    );
  }

  int month = 07, year = 2022;
  
  getdata() async {
    var url = Uri.parse(
        "http://api.aladhan.com/v1/calendarByCity?city=Lahore&country=Pakistan&method=2&month=${month.toString()}&year=2022");
        
    var response = await http.get(url);
    Map<String, dynamic> data = jsonDecode(response.body);

    setState(() {
      monthdata = prayer.getmonthdata(data);
    });
  }


  move(prayer p){
    Navigator.push(context, MaterialPageRoute(builder: (context)=> PrayerDetail(p)));

  }
  logout() async {
     final SharedPreferences  prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => login()) ,
            (Route<dynamic> route) => false);

    // await prefs.setBool('login', false);
    // await prefs.remove('login');
     // prefs.clear() delete all key value pairs
    // prefs.remove('LOGIN) delete single key value pairs
  }


}
