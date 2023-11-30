import 'package:flutter/material.dart';
import '../models/user_management.dart';
import '../screens/main_screen.dart';
import '../widgets/message_dialog.dart';

class LoginScreen extends StatefulWidget {
  final UserManagement userManagement;

  LoginScreen({required this.userManagement});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadUsers();
  }

  Future<void> _loadUsers() async {
    await widget.userManagement.initPrefs();
    await widget.userManagement.loadUsers();
  }

  Future<void> _createUser(BuildContext context) async {
    String userName = nameController.text.trim();
    if (userName.isNotEmpty) {
      bool created = await widget.userManagement.createUser(userName);
      if (created) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MainScreen(userName: userName),
          ),
        );
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return MessageDialog(
              title: 'Errore',
              message: 'Utente già esistente!',
              type: MessageType.error,
            );
          },
        );
      }
    }
  }

  Future<void> _login(BuildContext context) async {
    String userName = nameController.text.trim();
    if (userName.isNotEmpty) {
      if (widget.userManagement.userExists(userName)) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MainScreen(userName: userName),
          ),
        );
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return MessageDialog(
              title: 'Errore',
              message: 'Utente non registrato!',
              type: MessageType.error,
            );
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Management Demo - Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Nome',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                _createUser(context);
              },
              child: Text('Registrati'),
            ),
            SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {
                _login(context); // Aggiungi la logica per il login
              },
              child: Text('Accedi'),
            ),
          ],
        ),
      ),
    );
  }
}
