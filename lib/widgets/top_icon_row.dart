import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/responsive.dart';

class TopIconRow extends StatelessWidget {
  const TopIconRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: Responsive.isDesktop(context)
              ? MediaQuery.of(context).size.height * 0.07
              : 35,
          width: 45,
          margin: const EdgeInsets.all(7.0),
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              borderRadius: const BorderRadius.all(Radius.circular(10.0))),
          child: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/icons/refresh.svg',
            ),
            iconSize: 20,
          ),
        ),
        Container(
            margin: const EdgeInsets.all(7.0),
            height: Responsive.isDesktop(context)
                ? MediaQuery.of(context).size.height * 0.07
                : 38,
            width: 45,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                borderRadius: const BorderRadius.all(Radius.circular(10.0))),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.wifi),
              color: Theme.of(context).colorScheme.secondary,
            )),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: Responsive.isDesktop(context)
                ? MediaQuery.of(context).size.height * 0.07
                : 38,
            width: MediaQuery.of(context).size.width * 0.13,
            child: Responsive.isDesktop(context)
                ? ElevatedButton.icon(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).colorScheme.primary,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8.0),
                        ),
                      ),
                    ),
                    icon: SvgPicture.asset(
                      'assets/icons/table_icon.svg',
                      color: Colors.white,
                    ),
                    label: Text(
                      'Select Table',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(color: Colors.white),
                      maxLines: 1,
                    ))
                : Container(
                  decoration: BoxDecoration(borderRadius: const BorderRadius.all(
                          Radius.circular(8.0),
                        ),color: Theme.of(context).colorScheme.primary),
                  child: IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        'assets/icons/table_icon.svg',
                        color: Colors.white,
                      ),
                    ),
                ),
          ),
        ),
      ],
    );
  }
}
