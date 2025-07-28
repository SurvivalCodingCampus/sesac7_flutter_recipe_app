import 'dart:async';

import 'package:flutter/material.dart';

class Debouncer {
  final Duration delay;
  Timer? _timer;

  Debouncer({required this.delay});

  void run(VoidCallback action) {
    _timer?.cancel();

    _timer = Timer(delay, action);
  }

  void cancel() {
    _timer?.cancel();
  }
}
