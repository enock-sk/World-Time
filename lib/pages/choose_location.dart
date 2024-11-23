import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List <WorldTime> locations=[
    WorldTime(url: 'Europe/London',location: "London", flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin',location: "Berlin  ", flag: 'uk.png'),
    WorldTime(url: 'Africa/Cairo',location: "Cairo", flag: 'uk.png'),
    WorldTime(url: 'Africa/Nairobi',location: "Nairobi", flag: 'uk.png'),
    WorldTime(url: 'America/Chicago',location: "Chicago", flag: 'uk.png'),
    WorldTime(url: 'America/Ne w_York',location: "New_York", flag: 'uk.png'),
    WorldTime(url: 'Asia/Jakarta',location: "Jakarta", flag: 'uk.png'),
  ];
  void updateTime(index) async{
  WorldTime instance=locations[index];
  await instance.getTime();
  //navigate to home screen and pop data
  Navigator.pop(context,{
    'location': instance.location,
        'flag':instance.flag,
        'time': instance.time,
  }); 
}
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('choose location'),
        centerTitle: true,
        elevation: 0,
      ), 
      body: ListView.builder(
         itemCount: locations.length,
         itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0,horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: (){
                  updateTime(index);
                },
                title: Text(locations[index].location),
                // leading: CircleAvatar(
                //     backgroundImage: AssetImage('assets/${locations[index].flag}'),
                // ),
              ),  
            ),
          );
         }
      ),
    );
  }
}