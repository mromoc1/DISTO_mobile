class Palabra {
  int id;
  String palabra;

  Palabra({
    required this.id,
    required this.palabra,
  });

  factory Palabra.fromJson(Map<String, dynamic> json) => Palabra(
        id: json['id'],
        palabra: json['palabra'],
      );
  Map<String, dynamic> toMap() {
    return {"id": id, "palabra": palabra};
  }
}
