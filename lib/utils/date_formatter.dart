import 'package:intl/intl.dart';

class DateFormatter{
  static String formateDate(DateTime date){
    return DateFormat.yMMMd().format(date);
  }
}