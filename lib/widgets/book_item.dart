import 'package:phone_verification/providers/book.dart';
import 'package:phone_verification/providers/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookItem extends StatefulWidget {
  @override
  State<BookItem> createState() => _BookItemState();
}

class _BookItemState extends State<BookItem> {
  bool addToBag = false;

  @override
  Widget build(BuildContext context) {
    final book = Provider.of<Book>(context, listen: false);
    final cart = Provider.of<Cart>(context);

    return Container(
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      //padding: const EdgeInsets.only(left: 5, right: 5),
      height: 300.0,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Color.fromARGB(255, 224, 221, 221))),
      child: Stack(
        children: <Widget>[
          Container(
            color: Colors.grey.shade300,
            height: 150,
            width: 170,
            child: Center(
              child: Image.network(
                book.imageUrl,
                width: 110,
                height: 110,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 155,
            left: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  book.title,
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Text(
                  book.author,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  "Rs.${book.price} ",
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          addToBag == false
              ? Positioned(
                  left: 3,
                  bottom: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ButtonTheme(
                        minWidth: 20,
                        height: 30,
                        child: RaisedButton(
                          color: Color.fromARGB(255, 129, 17, 24),
                          onPressed: () {
                            cart.addItem(
                                book.id, book.price, book.title, book.imageUrl);
                            setState(() {
                              addToBag = !addToBag;
                            });
                          },
                          child: const Text(
                            "ADD TO BAG",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 8,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 3),
                      ButtonTheme(
                        minWidth: 20,
                        height: 30,
                        child: RaisedButton(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.grey)),
                          onPressed: () {},
                          child: const Text(
                            "WISHLIST",
                            style: TextStyle(
                              fontSize: 8,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              : Positioned(
                  left: 5,
                  bottom: 1,
                  child: ButtonTheme(
                    minWidth: 150,
                    height: 30,
                    child: RaisedButton(
                      color: Colors.blue.withOpacity(0.8),
                      onPressed: () {
                        Scaffold.of(context).hideCurrentSnackBar();
                        Scaffold.of(context).showSnackBar(
                          SnackBar(
                            content: const Text(
                              'Added to Cart..!!',
                              textAlign: TextAlign.center,
                            ),
                            duration: const Duration(seconds: 2),
                            action: SnackBarAction(
                                label: 'UNDO',
                                onPressed: () {
                                  setState(() {
                                    addToBag = !addToBag;
                                  });
                                  cart.removeSingleItem(book.id);
                                }),
                          ),
                        );
                      },
                      child: const Text(
                        "ADDED TO BAG",
                        style: TextStyle(
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
