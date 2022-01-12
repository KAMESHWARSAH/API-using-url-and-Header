
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}



class  Home extends StatelessWidget {
String mytext="";

  @override
  Widget build(BuildContext context) {
    getApiData() async  {
      var url = Uri.parse('http://sc.nectarinfotel.com/rest/V1/getimagedata',

      );

      Response response=await get(url, headers: {
        'Authorization':
        'Bearer 8i3z1gvmhiz90g6e7r5khuy54ohh4z8n',
      },);
      print(response.statusCode);
      if(response.statusCode==200){
        print('success');
        final data=jsonDecode(response.body);
        //print(data);
        mytext = data [1]['image'];
        print(data);
        //mytext.toString();
        debugPrint("Message");
      }
      else{
        print('some thing is wrong');
      }
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("API Test"),
      ),
      body: Center(

        child: Container(
          padding:  EdgeInsets.fromLTRB(10, 20, 20, 40),
          margin: EdgeInsets.all(40),

          child: Column(

            children: [
              Text('text'),

              TextButton(
                onPressed: (){
                  getApiData();
                },
                child: Text(
                    'Call API '
                ),

              )
            ],
          ),
        ),


      ),

    );
  }
}
