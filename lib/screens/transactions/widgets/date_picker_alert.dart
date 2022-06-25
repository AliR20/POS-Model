import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DatePickerAlert extends StatelessWidget {
  const DatePickerAlert({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Pick the Range of Date'),
      content: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: 400,
          child: SfDateRangePicker(
              selectionMode: DateRangePickerSelectionMode.multiRange)),
              actions: [
                TextButton(onPressed: (){}, child: Text('Save'),),
              ],
    );
  }
}
