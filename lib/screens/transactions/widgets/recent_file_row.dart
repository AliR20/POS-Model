import 'package:flutter/material.dart';

class RecentFileRow extends StatelessWidget {
  const RecentFileRow({Key? key, required this.value, required this.items, required this.onChanged}) : super(key: key);
  final String value;
  final List<String> items;
  final Function(String?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return       Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Recent Files',
                            textAlign: TextAlign.start,
                            style: Theme.of(context).textTheme.headline1,
                          ),
                          Container(
                            height: 50,
                            padding: EdgeInsets.all(5.0),
                            width: 160,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5.0),
                                ),
                                border: Border.all(
                                    color:
                                        Theme.of(context).colorScheme.primary)),
                            child: Row(
                              children: [
                                Text(
                                  'Sort By ',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                                DropdownButton<String>(
                                  focusColor: Colors.white,
                                  underline: Container(),
                                  value: value,
                                  items: items.map((e) => DropdownMenuItem(
                                            value: e,
                                            child: Text(e),
                                          ))
                                      .toList(),
                                  onChanged: onChanged
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
  }
}