enum Complexity {
  simple,
  medium,
  difficult,
}

extension ParseToString on Complexity {
  String toPtBrString() {
    switch (this) {
      case Complexity.simple:
        return 'Simples';
      case Complexity.medium:
        return 'Médio';
      case Complexity.difficult:
        return 'Difícil';
      default:
        return 'Desconhecida';
    }
  }
}
