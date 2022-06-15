import 'package:firebase_auth/firebase_auth.dart';
import 'package:phone_verification/login.dart';
import 'package:phone_verification/screens/books_overview_screen.dart';
import 'package:phone_verification/screens/orders_screen.dart';
import 'package:phone_verification/screens/user_books_screen.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        AppBar(
          backgroundColor: Color.fromARGB(255, 129, 17, 24),
          title: Text('Hello Friend!'),
          automaticallyImplyLeading: false,
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.shop),
          title: Text('Shop'),
          onTap: () {
            Navigator.of(context)
                .pushReplacementNamed(BookOverviewScreen.routeName);
            //Navigator.of(context).pushReplacementNamed('/');
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.payment),
          title: Text('Orders'),
          onTap: () {
            Navigator.of(context).pushReplacementNamed(OrderScreen.routeName);
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.edit),
          title: Text('Manage Books'),
          onTap: () {
            Navigator.of(context)
                .pushReplacementNamed(UserBooksScreen.routeName);
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.exit_to_app),
          title: Text('Logout'),
          onTap: () async {
            Navigator.of(context).pop();
            Navigator.of(context).pushReplacementNamed('/');

            await FirebaseAuth.instance.signOut();
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => LoginScreen(),
              ),
            );
          },
        ),
      ]),
    );
  }
}
