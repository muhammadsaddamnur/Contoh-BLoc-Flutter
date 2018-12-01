import 'dart:async';

import 'package:flutter/material.dart';

class StreamCounterPage extends StatefulWidget {
  StreamCounterPage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _StreamCounterPage createState() => _StreamCounterPage();
}

class _StreamCounterPage extends State<StreamCounterPage> {
  final StreamController<int> _streamController = StreamController<int>();

  int _counter = 0;


  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Streams'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('You have pushed the button this many times: '),
            StreamBuilder<int>(
              stream: _streamController.stream,
              initialData: 0,
              builder: (BuildContext context, AsyncSnapshot<int> snapshot){
                return Text('${snapshot.data}', style: Theme.of(context).textTheme.display1,);
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _streamController.sink.add(++_counter);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
