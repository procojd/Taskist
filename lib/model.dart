class Task {
  String name;
  bool isdone;
  Task({required this.name, this.isdone = false});

  void toggle() {
    isdone = !isdone;
  }
}
