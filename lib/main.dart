import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:phone_verification/login.dart';
import 'package:phone_verification/providers/auth.dart';
import 'package:phone_verification/providers/books.dart';
import 'package:phone_verification/providers/cart.dart';
import 'package:phone_verification/providers/orders.dart';
import 'package:phone_verification/screens/books_overview_screen.dart';
import 'package:phone_verification/screens/cart_screen.dart';
import 'package:phone_verification/screens/edit_book_screen.dart';
import 'package:phone_verification/screens/orders_screen.dart';
import 'package:phone_verification/screens/success_order_screen.dart';
import 'package:phone_verification/screens/user_books_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Auth(),
        ),
        ChangeNotifierProxyProvider<Auth, Books>(
            create: (_) => Books('', []),
            update: (context, auth, previousBooks) {
              print('+++++++++++++++++++++++++++++');
              print(auth.token);

              return Books(
                //auth.token ?? '',
                auth.userId ?? '',
                previousBooks == null ? [] : previousBooks.items,
              );
            }),
        ChangeNotifierProvider.value(
          value: Cart(),
        ),
        ChangeNotifierProxyProvider<Auth, Orders>(
          create: (_) => Orders('', []),
          update: (ctx, auth, previousOrders) {
            print('+++++++++++++++++++++++++++');
            print(auth.token);
            print('*****************************');
            return Orders(
              //auth.token ?? '',
              auth.userId ?? '',
              previousOrders == null ? [] : previousOrders.orders,
            );
          },
        ),
      ],
      child: MaterialApp(
        home: LoginScreen(),
        routes: {
          BookOverviewScreen.routeName: (context) => BookOverviewScreen(),
          CartScreen.routeName: (context) => CartScreen(),
          OrderScreen.routeName: (context) => OrderScreen(),
          OrderSuccessful.routeName: (context) => OrderSuccessful(),
          UserBooksScreen.routeName: (context) => UserBooksScreen(),
          EditBookScreen.routeName: (context) => EditBookScreen(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
