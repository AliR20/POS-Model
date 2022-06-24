import 'package:flutter/material.dart';
import 'package:pos_model/screens/customers/widgets/image_container.dart';

class CustomersList extends StatelessWidget {
  const CustomersList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: 2,
        itemBuilder: (context, int index) {
          return ListTile(
            leading: Container(
               width: 60,
                height: 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                  image: NetworkImage(
                    'https://picsum.photos/200/300',
                  ),
                 
                  fit: BoxFit.cover,
                 
                ),
              ),
            ),
            title: Text('Benjamin Cole'),
            subtitle: Text('ben.cole@gmail.com'),
            trailing: Text('02/03/2022'),
          );
        });
  }
}
