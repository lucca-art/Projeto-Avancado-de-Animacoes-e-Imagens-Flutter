import 'dart:math';

class RandomUtils {
  // Função que retorna um valor aleatório entre 0.3 e 1.0
  static double getRandomProgress() {
    final random = Random();
    return 0.3 + (random.nextDouble() * 0.7); // Garante que o valor estará entre 0.3 e 1.0
  }
}
