import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
class WorldTime{
  String location;
  late String time;
  String flag;
  String url;


  WorldTime({required this.location,required this.flag,required this.url});

  Future <void> getTime()async{
    try{
      Response response=await get(Uri.parse("http://worldtimeapi.org/api/timezone/$url"));
    Map data=jsonDecode(response.body);
    //print(data);
    //get properties
    String datetime=data['datetime'];
    String offset=data['utc_offset'].substring(1,3);
    //print(datetime);
    //print(offset);
    //create datetime object
    DateTime now=DateTime.parse(datetime);
    now=now.add(Duration(hours: int.parse(offset)));
    time=DateFormat.jm().format(now);   
    }
    catch(error){
      print('caught error: $error');
      time='sorry could not get time';
    }
  }
}