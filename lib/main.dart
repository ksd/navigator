import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UsersView(),
    );
  }
}

class UsersView extends StatelessWidget {
  final _users = [
    "Anders And",
    "Onkel Joakim",
    "Fætter Guf",
    "Bedstemor And",
    "Fætter Højben",
    "Bjørnebanden",
    "Hexia de Trick",
    "Andersine"
  ];

  UsersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
      ),
      body: ListView.builder(
          itemCount: _users.length,
          itemBuilder: (context, index) {
            final user = _users[index];
            return Card(
                child: ListTile(
              title: Text(user),
            ));
          }),
    );
  }
}

class UserDetailsView extends StatelessWidget {
  final String user;

  const UserDetailsView({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('User Details')),
        body: Center(child: Text('Hello, $user')));
  }
}
