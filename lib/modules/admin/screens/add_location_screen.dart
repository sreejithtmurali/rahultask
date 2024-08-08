import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddLocationScreen extends StatelessWidget {
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _districtController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();

  void _addLocation() {
    FirebaseFirestore.instance.collection('locations').add({
      'country': _countryController.text,
      'state': _stateController.text,
      'district': _districtController.text,
      'city': _cityController.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Location'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _countryController,
              decoration: InputDecoration(labelText: 'Country'),
            ),
            TextField(
              controller: _stateController,
              decoration: InputDecoration(labelText: 'State'),
            ),
            TextField(
              controller: _districtController,
              decoration: InputDecoration(labelText: 'District'),
            ),
            TextField(
              controller: _cityController,
              decoration: InputDecoration(labelText: 'City'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addLocation,
              child: Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}
