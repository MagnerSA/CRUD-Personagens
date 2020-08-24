import 'package:chars/models/char.dart';
import 'package:chars/provider/chars.dart';
import 'package:chars/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CharTile extends StatelessWidget {
  final Char char;

  const CharTile(this.char);

  @override
  Widget build(BuildContext context) {
    final image = char.imageUrl == null || char.imageUrl.isEmpty
        ? CircleAvatar(child: Icon(Icons.person))
        : CircleAvatar(backgroundImage: NetworkImage(char.imageUrl));

    return ListTile(
      leading: image,
      title: Text(char.name),
      subtitle: Text(char.birth),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.edit),
              color: Colors.blue,
              onPressed: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.CHAR_FORM,
                  arguments: char,
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.delete),
              color: Colors.red,
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: Text('Excluir Personagem'),
                    content: Text('Tem certeza?'),
                    actions: <Widget>[
                      FlatButton(
                        child: Text('Sim'),
                        onPressed: () => Navigator.of(context).pop(true),
                      ),
                      FlatButton(
                        child: Text('Não'),
                        onPressed: () => Navigator.of(context).pop(false),
                      ),
                    ],
                  ),
                ).then((confirmed) {
                  if (confirmed) {
                    Provider.of<Chars>(context, listen: false).remove(char);
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
