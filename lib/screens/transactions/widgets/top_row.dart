import 'package:flutter/material.dart';

import 'alert_dialog_popup.dart';

class TopRow extends StatelessWidget {
  const TopRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Transactions',
                              style: Theme.of(context).textTheme.headline1),
                          SizedBox(
                            height: 53,
                            child: ElevatedButton.icon(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) => AlertDialogPopUp());
                              },
                              icon: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                              label: Text(
                                'Add Income/Expenses',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .copyWith(
                                      color: Colors.white,
                                    ),
                              ),
                            ),
                          )
                        ],
                      ),
                    );
  }
}