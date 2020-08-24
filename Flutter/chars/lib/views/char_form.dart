import 'package:chars/models/char.dart';
import 'package:chars/provider/chars.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CharForm extends StatefulWidget {
  @override
  _CharFormState createState() => _CharFormState();
}

class _CharFormState extends State<CharForm> {
  final _form = GlobalKey<FormState>();

  final Map<String, String> _formData = {};

  void _loadFormData(Char char) {
    if (char != null) {
      _formData['id'] = char.id;
      _formData['name'] = char.name;
      _formData['birth'] = char.birth;
      _formData['imageUrl'] = char.imageUrl;
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final Char char = ModalRoute.of(context).settings.arguments;

    _loadFormData(char);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário de Personagem'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final isValid = _form.currentState.validate();

              if (isValid) {
                _form.currentState.save();

                Provider.of<Chars>(context, listen: false).put(
                  Char(
                    id: _formData['id'],
                    name: _formData['name'],
                    birth: _formData['birth'],
                    imageUrl: _formData['imageUrl'],
                  ),
                );

                Navigator.of(context).pop();
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[
              TextFormField(
                initialValue: _formData['name'],
                decoration: InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nome inválido';
                  }
                  return null;
                },
                onSaved: (value) => _formData['name'] = value,
              ),
              TextFormField(
                initialValue: _formData['birth'],
                decoration: InputDecoration(labelText: 'Nascimento'),
                onSaved: (value) => _formData['birth'] = value,
              ),
              TextFormField(
                initialValue: _formData['imageUrl'],
                decoration: InputDecoration(labelText: 'URL da Imagem'),
                onSaved: (value) => _formData['imageUrl'] = value,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
