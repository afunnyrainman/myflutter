import 'package:flutter/material.dart';

import 'myFlutterActivity.dart';

//应用入口
void main() => runApp(MyApp());
//路由表
Map<String, WidgetBuilder> routes;

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //注册路由
      routes: {"new_page": (context) => my()},
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      //先修改_counter对象，然后调用setState，然后调用build方法重新构建页面
      _counter++;
    });
  }

  void _inset() {
    setState(() {
      _counter++;
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //一列下来
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            FlatButton(
              child: Text("open my activity"),
              textColor: Colors.white,
              color: Colors.grey,
              onPressed: () {
                //点击导航到新页面
                /*Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (content) {
                          return my();
                          //默认情况下，当入栈一个新路由时，原来的路由仍然会被保存在内存中，如果想在路由没用的时候释放其所占用的所有资源，可以设置maintainState为false。
                        },
                        maintainState: true));*/

                Navigator.of(context).pushNamed("new_page").then((onValue) {
                  //返回值
                  print("onValue:" + onValue);
                });

                /*  Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context){
                  return new my(Title:"");
                }));*/
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
