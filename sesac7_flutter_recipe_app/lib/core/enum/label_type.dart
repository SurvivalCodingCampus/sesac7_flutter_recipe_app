enum LabelType {
  ingredient('Ingredient'),
  procedure('Procedure');

  const LabelType(this.labelValue);

  final String labelValue;
}

extension LabelTypeStringValues on List<LabelType> {
  List<String> get stringValues {
    return map((e) => e.labelValue).toList();
  }
}
