import 'package:freezed_annotation/freezed_annotation.dart';

part 'label.freezed.dart';

@freezed
class Label with _$Label {
  @override
  final String labelTitle;

  const Label({required this.labelTitle});
}
