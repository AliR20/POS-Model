import 'package:flutter/material.dart';
import 'package:pos_model/utils/responsive.dart';

class CashOutTopRow extends StatelessWidget {
  const CashOutTopRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: Responsive.isDesktop(context)?MediaQuery.of(context).size.width * 0.12 : 150,
                  child: ElevatedButton.icon(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        primary:  Theme.of(context).colorScheme.background,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8.0),
                          ),
                        ),
                      ),
                      icon:  Icon(
                        Icons.add,
                        color:  Theme.of(context).colorScheme.onBackground,
                      ),
                      label: Text(
                        'Add Customer',
                        style: Theme.of(context).textTheme.headline5,
                      )),
                ),
              ),
               SizedBox(width:Responsive.isDesktop(context)?200:  85,),
            
               Container(
                margin: const EdgeInsets.all(5.0),
                  height: Responsive.isDesktop(context)? MediaQuery.of(context).size.height * 0.07: 38,
            
                width: 45,
                decoration: BoxDecoration(
                    color:  Theme.of(context).colorScheme.background,
                    borderRadius: const BorderRadius.all(Radius.circular(10.0))),
                child: IconButton(
                  onPressed: (){},
                  icon: const Icon(Icons.add),
                  color:  Theme.of(context).colorScheme.onBackground,
                )),
                   Container(
                     margin: const EdgeInsets.all(5.0),
                  height: Responsive.isDesktop(context)? MediaQuery.of(context).size.height * 0.07: 38,
            
                width: 45,
                decoration:  BoxDecoration(
                    color:  Theme.of(context).colorScheme.background,
                    borderRadius: const BorderRadius.all(Radius.circular(10.0))),
                child: IconButton(
                  onPressed: (){},
                  icon: const Icon(Icons.table_chart),
                  color:  Theme.of(context).colorScheme.onBackground,
                )),
                   Container(
                     margin: const EdgeInsets.all(5.0),
                  height: Responsive.isDesktop(context)? MediaQuery.of(context).size.height * 0.07: 40,
            
                width: 45,
                decoration:  BoxDecoration(
                    color:  Theme.of(context).colorScheme.background,
                    borderRadius: const BorderRadius.all(Radius.circular(10.0))),
                child: IconButton(
                  onPressed: (){},
                  icon: const Icon(Icons.refresh),
                  color: Theme.of(context).colorScheme.onBackground,
                )),
            ],
          );
  }
}