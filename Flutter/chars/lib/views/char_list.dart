import 'package:chars/provider/chars.dart';
import 'package:chars/routes/app_routes.dart';
import 'package:chars/widgets/char_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CharList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Chars chars = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Personagens'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(
                AppRoutes.CHAR_FORM,
              );
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: chars.count,
        itemBuilder: (ctx, i) => CharTile(chars.byIndex(i)),
      ),
    );
  }
}
