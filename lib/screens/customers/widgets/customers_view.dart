import 'package:flutter/material.dart';
import 'package:pos_model/screens/customers/widgets/customer_list.dart';
import 'package:pos_model/screens/customers/widgets/image_container.dart';

class CustomerView extends StatelessWidget {
  const CustomerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           ImageContainer(
            height: 150,
            width: 200,
           ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: 'Vincent Lobo',
                        style: Theme.of(context).textTheme.headline1),
                    TextSpan(
                      text: ' #542845',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ])),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      'vincent.lobo@wanpik.com',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(color: Colors.grey),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Text(
                      '+12-8541235476',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(color: Colors.grey),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextButton.icon(
                        onPressed: () {},
                        icon: Icon(
                          Icons.edit,
                        ),
                        label: Text('Edit'),
                      ),
                      TextButton.icon(
                        onPressed: () {},
                        icon: Icon(
                          Icons.delete,
                        ),
                        label: Text('Delete'),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 26.0),
                        child: SizedBox(
                          width: 100,
                          height: 40,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text('Remove'),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    side: BorderSide(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary)),
                                onPrimary:
                                    Theme.of(context).colorScheme.primary),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Recent Customers',
            style: Theme.of(context)
                .textTheme
                .headline3!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
        ),
       CustomersList(
        
       ),
      ],
    );
  }
}
