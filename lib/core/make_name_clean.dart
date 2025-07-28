// 이름이 3단어 이상일 경우 분리한다.
String getRecipeName(String name) {
  final List<String> listOfName = name.split(' ');

  if (listOfName.length > 3) {
    final String firstWord = listOfName.sublist(0, 3).join(' ');
    final String lastWord = listOfName.sublist(3).join(' ');
    return '$firstWord\n$lastWord';
  }

  return name;
}
