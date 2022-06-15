import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:phone_verification/screens/books_overview_screen.dart';

class OrderSuccessful extends StatelessWidget {
  static const routeName = '/ordersucess';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 129, 17, 24),
        title: Text('Book Store'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Order Placed Successfully'),
            SizedBox(
              height: 20,
            ),
            FlatButton(
              color: Color.fromARGB(255, 129, 17, 24),
              onPressed: () {
                Navigator.of(context)
                .pushReplacementNamed(BookOverviewScreen.routeName);
              },
              child: Text(
                'Continue Shopping',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
