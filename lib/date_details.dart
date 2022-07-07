import 'package:flutter/material.dart';
import 'package:json_access/prayer.dart';
class PrayerDetail extends StatelessWidget {
  prayer p;
  PrayerDetail(this.p);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Text(p.fajr ),
          Spacer(),
          Text(p.dhuhur ),
          Spacer(),
          Text(p.asar ),
          Spacer(),
          Text(p.maghrib),
          Spacer(),
          Text(p.isha),
          Spacer(),
          ElevatedButton(onPressed: ()=> Navigator.pop(context), child: Text('Go Back')),
        
        ],),
    );
  }
    
  }