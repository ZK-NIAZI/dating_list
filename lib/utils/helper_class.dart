import 'package:intl/intl.dart';

String formatDate(String isoDate) {
  try {
    DateTime dateTime = DateTime.parse(isoDate);
    String formattedDate = DateFormat('yyyy MMMM dd').format(dateTime);

    return formattedDate;
  } catch (e) {
    return 'Invalid date';
  }
}