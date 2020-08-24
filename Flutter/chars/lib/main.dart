import 'package:chars/provider/chars.dart';
import 'package:chars/routes/app_routes.dart';
import 'package:chars/views/char_form.dart';
import 'package:chars/views/char_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Chars(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        routes: {
          AppRoutes.HOME: (_) => CharList(),
          AppRoutes.CHAR_FORM: (_) => CharForm()
        },
      ),
    );
  }
}
