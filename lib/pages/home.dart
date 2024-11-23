import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
    Map data={};
  @override
  Widget build(BuildContext context) {
    data=data.isNotEmpty ? data:ModalRoute.of(context)?.settings.arguments as Map;
    //String bgImage=data['isDaytime']?'day.png':'night.png';
    //Color bgcolor=data['isDaytime']?Colors.blue:Colors.indigo;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
          child: Column(
            children: <Widget>[
              TextButton.icon(onPressed: ()async{
                dynamic result=await Navigator.pushNamed(context, '/location');
                setState(() {
                  data={
                    'time':result['time'],
                    'location':result['location'],
                    'flag':result['flag'],
                  };
                });
              },
               icon: Icon(Icons.edit_location),
                label: Text('Edit Location')),
                SizedBox(height: 20.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(data['location'],
                    style: TextStyle(fontSize: 28.0,
                    letterSpacing: 2.0),
                    )
                  ],
                ),
                SizedBox(height: 20.0),
                Text(data['time'],
                style: TextStyle(
                  fontSize: 68.0,
                )),
            ],
          ),
        )
        ),
    );
  }
}