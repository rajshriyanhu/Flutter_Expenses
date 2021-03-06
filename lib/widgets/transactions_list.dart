// ignore_for_file: use_key_in_widget_constructors, unused_field, prefer_const_constructors, sized_box_for_whitespace, prefer_const_constructors_in_immutables

import 'package:expenses/models/transactions.dart';
import 'package:expenses/widgets/transaction_item.dart';
import 'package:flutter/material.dart';

/*
--> '$' is a keyword (reserved key) in Dart is used for interpolation of any value as here we are doing string interpolation
--> To use any reserved key as a chracter we have to use '\' as '\$'
--> import 'package:intl/intl.dart'; is used here to validate the 'DateFormat()'
--> 'DateFormat()' is used to get a convienient form of Date and timme instead of just in string form
--> 'TextField()' is used to get the Text input from the user.
--> 'onfield' is called when the user initiates a change to the TextField's value: when they have inserted or deleted text.
--> Here 'SingleChildScrollView' widget is used to scroll the list of transaction only,
    while in main it will scroll up the input part too
--> 'SingleChildScrollView' inside the container ensures the scrolling of whole container
--> 'ListView' is an alternative for SinglechildScrollView, ListView can be used in 2 ways:
    as chlidren inside it or as ListView.builder()
--> ListView() with childern inside it is suitable for small list, while ListView.builder() is suitable for large Lists
    or where we don't know how many List entries are going to be saved
--> ListView.builder() always have 'itemBuilder: (context, index)' inside it which return the output, here it is the 'Card'
--> 'context' and 'index' reffers to the return value and the index of List repectively
    Here the context is 'Card' which contains the information of transaction and index is the index of 'transactions' 
--> Ternary condition is applied if the list of transaction is empty then the pic will show, 
    this condition is used before 'ListView.builder'
--> Image.asset is used to insert the image which mandetorily takes location of pic
--> To fit the image in sthe screen 'fit' is used which takes 'BoxFit' 
--> Here we have put image in 'Container' instead of 'column' because 'columns' take as much height as they can get, 
    so the image will not infer the size into which it should squeeze, it would need access the 'conatiner'.
    So it is advisable whenever there is an issue related with the size, wrap the things inside the 'Column'
--> To get the space b/w Text and image we define 'SizedBox' b/w, it which can take height and width as argument,
    'SizedBox' is white space so it does not appear on the UI
--> 'ListTile()' is a single fixed-height row that typically contains some text as well as a leading or trailing icon.
    'leading' is basically used to create the icons at the beginning of the List
--> After passing 'deleteTransaction' in TransactionList in 'main.dart' we have to accept it in this .dart file.
--> So here we create the function delteTx and passed it to the onpressed which takes the 'id' as an argument
*/

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  const TransactionList(this.transactions, this.deleteTx);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: transactions.isEmpty
          ? LayoutBuilder(
              builder: (context, constraints) {
                return Column(
                  children: <Widget>[
                    Text(
                      'No Transaction is added yet !',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        height: constraints.maxHeight * 0.7,
                        child: Image.asset(
                          'assets/pics/cat1.jpg',
                          fit: BoxFit.cover,
                        )),
                  ],
                );
              },
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return TransactionItem(
                    transactions: transactions[index], deleteTx: deleteTx);
              },
              itemCount: transactions.length,
            ),
    );
  }
}
