class NameOptimizer {
  static String _formatRecipeName(String name) {
    final List<String> listOfName = name.split(' ');

    if (listOfName.length > 3) {
      final String firstWord = listOfName.sublist(0, 3).join(' ');
      final String lastWord = listOfName.sublist(3).join(' ');
      return '$firstWord\n$lastWord';
    }

    return '\n$name';
  }

  static String getRecipeName(String name) {
    return _formatRecipeName(name);
  }
}
