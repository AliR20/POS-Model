import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TransactionContainer extends StatelessWidget {
  TransactionContainer(
      {Key? key,
      required this.name,
      required this.amount,
      required this.info,
      required this.imageUrl,
      required this.percent,
      required this.onTap, required this.isIncome})
      : super(key: key);
  final String name;
  final String amount;
  final String info;
  final String percent;
  final String imageUrl;
  final VoidCallback onTap;
  final bool isIncome;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.primary,
        ),
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        '\$$amount',
                        style: Theme.of(context).textTheme.headline2!.copyWith(
                            color: Theme.of(context).colorScheme.onBackground,
                            fontSize: 28.0
                            ),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    RichText(
                        text: TextSpan(
                      children: [
                        TextSpan(
                          text: '$percent% ',
                          style: TextStyle(
                            color: isIncome?Colors.green: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                            text: info,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(color: Colors.grey,fontSize: 18.0)),
                      ],
                    )),
                  ],
                ),
              ),
              SizedBox(
                width: 8.0,
              ),
              Container(
                  margin: const EdgeInsets.all(7.0),
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: 45,
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.background,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10.0))),
                  child: IconButton(
                    onPressed: null,
                    icon: SvgPicture.asset(imageUrl,color: isIncome? Colors.green: Colors.red,),
                    color: Theme.of(context).colorScheme.secondary,
                  )),
            ],
          ),
          SizedBox(height: 12.0,),
          InkWell(
            onTap: onTap,
            child: Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top: 5.0),
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              height: 60,
              width: 370,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.5)),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5.0),
                      bottomRight: Radius.circular(5.0))),
              child: Text(
                'See Details',
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(color: Theme.of(context).colorScheme.primary,fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
