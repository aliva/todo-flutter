enum Priority {
  none,
  low,
  medium,
  high,
}

class TodoItem {
  String text;
  bool value;
  Enum priority;

  TodoItem({
    required this.text,
    this.value = false,
    this.priority = Priority.none,
  });
}
