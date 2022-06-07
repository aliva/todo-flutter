enum _TaskStateEnum {
  active,
  done,
}

class TaskState {
  _TaskStateEnum _state = _TaskStateEnum.active;

  TaskState([String? str]) {
    if (str != null) {
      _state = _TaskStateEnum.values.byName(str);
    }
  }

  @override
  String toString() {
    return _state.name;
  }

  void toggleState() {
    if (_state == _TaskStateEnum.active) {
      _state = _TaskStateEnum.done;
    } else if (_state == _TaskStateEnum.done) {
      _state = _TaskStateEnum.active;
    } else {
      throw UnsupportedError("Unkown task state");
    }
  }

  bool get isDone => _state == _TaskStateEnum.done;

  @override
  bool operator ==(Object other) => other is TaskState && toString() == other.toString();

  @override
  int get hashCode => super.hashCode;
}
