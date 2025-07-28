import 'dart:async';

class Debounce {
  final Duration delay;
  Timer? _timer;

  Debounce(this.delay);

  void run(Function action) {
    _timer?.cancel();
    _timer = Timer(delay, () {
      action();
    });
  }

  void cancel() {
    _timer?.cancel();
  }
}
