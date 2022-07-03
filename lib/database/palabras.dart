class Palabra {
  int? id;
  String palabra;

  Palabra({
    this.id,
    required this.palabra,
  });

  factory Palabra.fromMap(Map<String, dynamic> json) => Palabra(
        id: json['id'],
        palabra: json['palabra'],
      );
  Map<String, dynamic> toMap() {
    return {"palabra": palabra};
  }
}
