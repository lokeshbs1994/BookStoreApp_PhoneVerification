import 'package:phone_verification/providers/books.dart';
import 'package:phone_verification/providers/cart.dart';
import 'package:phone_verification/screens/cart_screen.dart';
import 'package:phone_verification/widgets/app_drawer.dart';
import 'package:phone_verification/widgets/badge.dart';
import 'package:phone_verification/widgets/bookgrid.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookOverviewScreen extends StatefulWidget {
  static const routeName = '/booksoverview';
  BookOverviewScreen({Key? key}) : super(key: key);

  @override
  State<BookOverviewScreen> createState() => _BookOverviewScreenState();
}

class _BookOverviewScreenState extends State<BookOverviewScreen> {
  var _isInit = true;
  var _isLoading = false;
  @override
  void initState() {
    // Provider.of<Books>(context).fetchAndSetBooks();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });

      Provider.of<Books>(context).fetchAndSetBooks().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 129, 17, 24),
        //leading: Text('BookStore'),
        title: Text('BookStore'),
        actions: [
          Consumer<Cart>(
            builder: (_, cart, ch) => Badge(
              value: cart.itemCount.toString(),
              child: ch!,
            ),
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
          )
        ],
      ),
      drawer: AppDrawer(),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : BooksGrid(),
    );
  }
}
