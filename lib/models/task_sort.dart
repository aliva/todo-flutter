import 'package:todo/models/task.dart';

class TaskSort {
  static int defaultOrder(Task t1, Task t2) {
    if (t1.state == t2.state) {
      return TaskSort.orderByTime(t1, t2);
    }
    if (t1.state.isDone) {
      return 1;
    }
    return -1;
  }

  static int orderByTime(Task t1, Task t2) {
    var t1t = t1.createdAt as int;
    var t2t = t2.createdAt as int;

    if (t1t < t2t) {
      return 1;
    }
    if (t1t > t2t) {
      return -1;
    }
    return 0;
  }
}
