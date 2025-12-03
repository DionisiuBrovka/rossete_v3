enum ProcessTaskStatus { pending, inProgress, completed, failed }

class ProcessTask {
  final String id;
  final String name;
  ProcessTaskStatus status;

  final Future<void> Function() _task;

  ProcessTask({
    required this.name,
    this.status = ProcessTaskStatus.pending,
    required Future<void> Function() task,
  }) : _task = task,
       id = DateTime.now().millisecondsSinceEpoch.toString();

  Future<void> execute() async {
    status = ProcessTaskStatus.inProgress;
    try {
      await _task();
      status = ProcessTaskStatus.completed;
    } catch (e) {
      status = ProcessTaskStatus.failed;
      rethrow;
    }
  }
}
