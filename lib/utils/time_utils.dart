String dataTimeTran(String time) {
  if (time.isEmpty) return "--";
  int timestamp = int.parse(time);
  DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
  String formattedDateTime =
      '${dateTime.year}-${_addLeadingZero(dateTime.month)}-${_addLeadingZero(dateTime.day)} ${_addLeadingZero(dateTime.hour)}:${_addLeadingZero(dateTime.minute)}:${_addLeadingZero(dateTime.second)}';
  return formattedDateTime;
}

String _addLeadingZero(int value) {
  return value < 10 ? '0$value' : '$value';
}
