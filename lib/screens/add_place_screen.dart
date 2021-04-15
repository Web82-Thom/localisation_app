import 'package:flutter/material.dart';

import '../widgets/image_input.dart';

class AddPlaceScreen extends StatefulWidget {
  static const routeName = '/add-place';
  
  @override
  _AddPlaceScreenState createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  final _titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajouter un emplacement'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[
                      TextField(
                        decoration: InputDecoration(labelText: 'Titre'),
                        controller: _titleController,
                      ),
                      SizedBox(height: 10,),
                      ImageInput(),
                    ],
                  ),
                ),
              )
            ),
            TextButton.icon(
              icon: Icon(Icons.add),
              label: Text('Ajouter un emplacement'),
              onPressed: () {},
              // materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              style : TextButton.styleFrom(
              elevation: 0,
              backgroundColor: Theme.of(context).accentColor,
              ),
            )
            
          ],
        ),
      ),      
    );
  }
}