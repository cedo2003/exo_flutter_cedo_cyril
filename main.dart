import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Contact {
  String name;
  int phoneNumber;

  Contact({required this.name, required this.phoneNumber});
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GESTION DE CONTACT',
      home: ContactList(),
    );
  }
}

class ContactList extends StatefulWidget {
  @override
  _ContactListState createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  List<Contact> contacts = [
    Contact(name: 'ODJO Benhila', phoneNumber: '95 93 92 73'),
    Contact(name: 'BRO Petit', phoneNumber: '99 99 99 99'),
  ];

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('APPLICATION DE GESTION DE CONTACT'),
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(contacts[index].name),
            subtitle: Text(contacts[index].phoneNumber),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  contacts.removeAt(index);
                });
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showContactDialog(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _showContactDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Ajouter un contact'),
          content: Column(
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Nom et Prénom'),
              ),
              TextField(
                controller: phoneController,
                decoration: InputDecoration(labelText: 'Numéro de téléphone'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Annuler l\'enrégistrement'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  contacts.add(Contact(
                    name: nameController.text,
                    phoneNumber: phoneController.text,
                  ));
                  nameController.clear();
                  phoneController.clear();
                });
                Navigator.pop(context);
              },
              child: Text('Ajouter le contact'),
            ),
          ],
        );
      },
    );
  }
}
