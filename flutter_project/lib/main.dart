import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
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

enum Answers{
  YES,
  NO
}

class _MyHomePageState extends State<MyHomePage> {

  String _value = '';

  void _setValue(String value) => setState(() => _value = value);

  Future _showDialog() async {
    var value = await showDialog(
      context: context,
      builder: (BuildContext context) => new AlertDialog(
        title: new Text('AlertDialog'),
        content: new Text('アラートダイアログです。YesかNoを選択してください。'),
        actions: <Widget>[
          new SimpleDialogOption(child: new Text('Yes'),onPressed: (){Navigator.pop(context, Answers.YES);},),
          new SimpleDialogOption(child: new Text('NO'),onPressed: (){Navigator.pop(context, Answers.NO);},),
        ],
      ),
    );

    switch(value) {
      case Answers.YES:
        _setValue('Yes');
        break;
      case Answers.NO:
        _setValue('NO');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('AlertDialog'),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Text(_value, style: TextStyle(fontSize: 50, color: Colors.blueAccent, fontWeight: FontWeight.w600),),
              new RaisedButton(onPressed: _showDialog, child: new Text('ダイアログを開く'),)
            ],
          ),
        ),
      ),
    );
  }
}
