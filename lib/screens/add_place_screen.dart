
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/image_input.dart';
import '../providers/great_places.dart';

class AddPlaceScreen extends StatefulWidget {
  static const routeName = '/add-place';
  
  @override
  _AddPlaceScreenState createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  final _titleController = TextEditingController();
  File _pickedImage;

  void _selectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  void _savePlace() {
    if (_titleController.text.isEmpty || _pickedImage == null) {
      return;
    }
    Provider.of<Greatplaces>(context, listen: false).addPlace(_titleController.text, _pickedImage);
    Navigator.of(context).pop();
  }

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
                      ImageInput(_selectImage),
                    ],
                  ),
                ),
              )
            ),
            TextButton.icon(
              icon: Icon(Icons.add),
              label: Text('Ajouter un emplacement'),
              onPressed: _savePlace,
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