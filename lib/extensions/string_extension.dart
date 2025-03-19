import 'dart:math';

extension GenerateRandomAlphabet on String{
  String generateRandomAlphabet(int length) {
  const String chars = 'abcdefghijklmnopqrstuvwxyz';
    Random random = Random();
    return this + String.fromCharCodes(
      Iterable.generate(length, (_) => chars.codeUnitAt(random.nextInt(chars.length))),
    );
  }
}
