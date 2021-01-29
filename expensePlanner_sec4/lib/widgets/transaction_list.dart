import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  TransactionList(this._userTransactions, this.deleteTx);

  final Function deleteTx;

  final List<Transaction> _userTransactions;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        return Container(
          height: 515,
          child: _userTransactions.isEmpty
              ? Column(
                  children: [
                    Text(
                      'No transactions added yet!',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    SizedBox(
                      height: constraints.maxHeight * 0.2,
                    ),
                    Container(
                        height: constraints.maxHeight * 0.6,
                        child: Image.asset(
                          'assets/images/waiting.png',
                          fit: BoxFit.cover,
                        ))
                  ],
                )
              : ListView.builder(
                  itemBuilder: (ctx, index) {
                    return Card(
                      elevation: 5,
                      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                      child: ListTile(
                        leading: Padding(
                          padding: const EdgeInsets.all(1),
                          child: FittedBox(
                              child: CircleAvatar(
                            radius: 30,
                            child: Text('\$${_userTransactions[index].amount}'),
                          )),
                        ),
                        title: Text(
                          '${_userTransactions[index].title}',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        subtitle: Text(DateFormat.yMMMEd()
                            .format(_userTransactions[index].date)),
                        trailing: MediaQuery.of(context).size.width > 400
                            ? FlatButton.icon(
                                icon: Icon(Icons.delete),
                                label: Text('Delete'),
                                textColor: Theme.of(context).errorColor,
                                onPressed: () =>
                                    deleteTx(_userTransactions[index].id),
                              )
                            : IconButton(
                                icon: Icon(Icons.delete),
                                color: Theme.of(context).errorColor,
                                onPressed: () =>
                                    deleteTx(_userTransactions[index].id),
                              ),
                      ),
                    );
                  },
                  itemCount: _userTransactions.length,
                ),
        );
      },
    );
  }
}
