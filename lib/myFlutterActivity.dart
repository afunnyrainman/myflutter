import 'package:flutter/material.dart';
import 'main.dart';

class my extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: AppBar(
        title: Text("new activity"),
      ),
      body: Center(
        child:Column(
          //居中
          mainAxisAlignment: MainAxisAlignment.center,
          //子view
          children: <Widget>[
            FlatButton(
              child: Text("第二个页面"),
              textColor: Colors.white,
              color: Colors.grey,
              onPressed: (){
                //关闭页面
                Navigator.popAndPushNamed(context, "返回给你的数据");
              },
            )
          ],
        ),
      ),
    );
  }
}
