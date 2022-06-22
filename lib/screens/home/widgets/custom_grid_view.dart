import 'package:flutter/material.dart';

import '../../../models/grid_model.dart';
import '../../../utils/responsive.dart';

class CustomGridView extends StatelessWidget {
  const CustomGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.fitHeight,
      child: Container(
          margin: Responsive.isDesktop(context) ? EdgeInsets.all(15):EdgeInsets.all(18) ,
          height: MediaQuery.of(context).size.height * 1.2,
          width: MediaQuery.of(context).size.width * 0.9,
          child: GridView.builder(
              itemCount: gridList.length,
             physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: Responsive.isDesktop(context) ? 4 : 2,
                crossAxisSpacing: Responsive.isDesktop(context) ? 10.0 : 25.0,
                mainAxisSpacing: Responsive.isDesktop(context) ? 5 : 15,
                childAspectRatio: Responsive.isDesktop(context) ? 1.2 : 0.8,
              
              ),
              itemBuilder: (context, int position) {
                return Container(
                  height: MediaQuery.of(context).size.height ,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  child: Column(
               
                    mainAxisAlignment: Responsive.isDesktop(context)
                        ? MainAxisAlignment.center
                        : MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(5.0),
                        height: Responsive.isDesktop(context) ? 120 : 100,
                        width: 140,
                        child: Image.asset(gridList[position].imageUrl),
                      ),
                      Text(
                        gridList[position].name,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline4!.copyWith(color: Theme.of(context).colorScheme.onBackground),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        gridList[position].prize,
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      const SizedBox(
                        height: 15,
                      )
                    ],
                  ),
                );
              })),
    );
  }
}
