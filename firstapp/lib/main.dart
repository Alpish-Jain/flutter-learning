import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Home(),
    ));

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My first app!"),
        centerTitle: true,
        backgroundColor: Colors.red[600],
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Expanded(flex: 3, child: Image.asset('assets/download.png')),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(30),
              color: Colors.yellow,
              child: Text('1'),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(30),
              color: Colors.indigo,
              child: Text('2'),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(30),
              color: Colors.red[200],
              child: Text('3'),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Text("click!"),
        backgroundColor: Colors.deepPurple[900],
      ),
    );
  }
}
