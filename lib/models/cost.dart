enum Cost {
  cheap,
  fair,
  expensive,
}

extension ParseToString on Cost {
  String toPtBrString() {
    switch (this) {
      case Cost.cheap:
        return 'Barato';
      case Cost.fair:
        return 'Médio';
      case Cost.expensive:
        return 'Caro';
      default:
        return 'Desconhecido';
    }
  }
}
