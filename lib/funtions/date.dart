class Today {
  DateTime selectedDate;

  Today({required this.selectedDate});

  int get day => selectedDate.day;
  int get month => selectedDate.month;
  int get year => selectedDate.year;

  // List for the date key
  List<int> get dateKey => [day, month, year];
}
