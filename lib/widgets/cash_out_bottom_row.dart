import 'package:flutter/material.dart';
import 'package:pos_model/utils/responsive.dart';

class CashOutBottomRow extends StatelessWidget {
  const CashOutBottomRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
      
        Padding(
              padding: const EdgeInsets.all(3.0),
              child: SizedBox(
       height: MediaQuery.of(context).size.height * 0.07,
       width:  Responsive.isDesktop(context)
        ?MediaQuery.of(context).size.width * 0.15: 170,
       child: ElevatedButton.icon(
         
           onPressed: () {},
           style: ElevatedButton.styleFrom(
             primary: Theme.of(context).colorScheme.primary,
             shape: const RoundedRectangleBorder(
               borderRadius: BorderRadius.all(
                 Radius.circular(8.0),
               ),
             ),
           ),
           icon: const Icon(Icons.pause_circle_outline,color: Colors.white),
           label: const Text('Hold Cart',style: TextStyle(color: Colors.white,),)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: SizedBox(
       height: MediaQuery.of(context).size.height * 0.07,
       width: Responsive.isDesktop(context)
        ?MediaQuery.of(context).size.width * 0.15: 170,
       child: ElevatedButton.icon(
           onPressed: () {},
           style: ElevatedButton.styleFrom(
             primary: Theme.of(context).colorScheme.secondary,
             shape: const RoundedRectangleBorder(
               borderRadius: BorderRadius.all(
                 Radius.circular(8.0),
               ),
             ),
           ),
           icon: const Icon(Icons.arrow_circle_right_outlined,color:Colors.white,),
           
           label: const Text('Proceed',style: TextStyle(color: Colors.white),)),
              ),
            )
      ],),
    );
  }
}
