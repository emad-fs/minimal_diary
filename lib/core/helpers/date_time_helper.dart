import 'package:intl/intl.dart';

String getFormattedDate(DateTime date) =>
    DateFormat('yyyy-MM-dd HH:mm:ss').format(date);
