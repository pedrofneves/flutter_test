import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: HomePage(),
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (context) => HomePage());
            break;
          case '/second':
            User user = settings.arguments;
            return MaterialPageRoute(
              builder: (context) => SecondHome(user: user),
            );
            break;
        }
      },
    ),
  );
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: new Center(
        child: RaisedButton(
          onPressed: () {
            User user = new User(name: 'Nitish', age: 18);
            Navigator.pushNamed(context, '/second', arguments: user);
          },
          child: Text('Second Home'),
        ),
      ),
    );
  }
}

class SecondHome extends StatelessWidget {
  final User user;

  SecondHome({this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${this.user.name} - ${this.user.age}'),
      ),
      body: new Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go Back'),
        ),
      ),
    );
  }
}

class User {
  final String name;
  final int age;

  User({this.name, this.age});
}