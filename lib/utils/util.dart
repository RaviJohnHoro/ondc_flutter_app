import 'package:intl/intl.dart';

String getFormattedDate({DateTime? date}) {
  return DateFormat("yyyy-MM-ddTHH:mm:ss.SSS'Z'").format(
    date ?? DateTime.now(),
  );
}
