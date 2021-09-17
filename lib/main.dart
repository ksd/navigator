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
  String? _selectedUser;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Navigator(
        pages: [
          MaterialPage(
            child: UsersView(
              didSelectUser: (user) {
                setState(() => _selectedUser = user);
              },
            ),
          ),
          if (_selectedUser != null)
            MaterialPage(child: UserDetailsView(user: _selectedUser!))
        ],
        onPopPage: (route, result) {
          final page = route.settings as MaterialPage;
          if (page.key == UserDetailsView.valueKey) {
            _selectedUser = null;
          }
          return route.didPop(result);
        },
      ),
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

  final ValueChanged didSelectUser;

  UsersView({Key? key, required this.didSelectUser}) : super(key: key);

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
              onTap: () => didSelectUser(user),
            ));
          }),
    );
  }
}

class UserDetailsView extends StatelessWidget {
  static const valueKey = ValueKey('UserDetailsView');

  final String user;

  const UserDetailsView({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('User Details')),
        body: Center(child: Text('Hello, $user')));
  }
}
