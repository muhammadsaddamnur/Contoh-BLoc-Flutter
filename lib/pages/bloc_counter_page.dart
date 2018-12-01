import 'package:contohblocpattern/blocs/counter_bloc.dart';
import 'package:contohblocpattern/widgets/bloc_provider.dart';
import 'package:flutter/material.dart';

class BlocCounterPage extends StatefulWidget {
  BlocCounterPage({Key key}) : super(key: key);

  @override
  _BlocCounterPage createState() => _BlocCounterPage();
}

class _BlocCounterPage extends State<BlocCounterPage> {

  @override
  Widget build(BuildContext context) {
    final CounterBloc counterBloc = BlocProvider.of<CounterBloc>(context);

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
              stream: counterBloc.outCounter,
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
          counterBloc.incrementCounter.add(null);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
