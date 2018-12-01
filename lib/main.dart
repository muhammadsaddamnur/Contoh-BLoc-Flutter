import 'dart:async';

import 'package:contohblocpattern/blocs/counter_bloc.dart';
import 'package:contohblocpattern/blocs/user_bloc.dart';
import 'package:contohblocpattern/pages/bloc_counter_page.dart';
import 'package:contohblocpattern/pages/bloc_user_page.dart';
import 'package:contohblocpattern/pages/stream_counter_page.dart';
import 'package:contohblocpattern/widgets/bloc_provider.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        bloc: UserBloc(),
        child: BlocUserPage(),
      ),
    );
  }
}

