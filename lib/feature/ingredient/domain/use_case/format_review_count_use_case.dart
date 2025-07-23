import 'package:intl/intl.dart';

class FormatReviewCountUseCase {
  String execute(int count) {
    return NumberFormat.compact().format(count);
  }
}
