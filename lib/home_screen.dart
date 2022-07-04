import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'prayer.dart';

class homescreen extends StatefulWidget {
  const homescreen({ Key? key }) : super(key: key);
  

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  List<prayer> monthdata =[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('JSON'),
        centerTitle: true,),
        body: Container(
          child: ListView(
            children: [
              SizedBox(height:20),
              ElevatedButton(onPressed:()=> getdata(), child: Text('Get Data')),
              SizedBox(height:20),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: monthdata.length,
                itemBuilder: (context, index)
                {
                  return Row(
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
                  );
                }
              
                
                
                ),
            ],
          ),
        ),

    );

  }
    getdata() async
    {
      var url = Uri.parse('http://api.aladhan.com/v1/calendar?latitude=51.508515&longitude=-0.1254872&method=2&month=4&year=2017');
      var response = await http.get(url);
      Map<String,dynamic> data = jsonDecode(response.body);
      
      setState(() {
        monthdata = prayer.getmonthdata(data);
      });
    }
}