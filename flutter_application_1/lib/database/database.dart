class Cvik {
  int id;
  String nazev;
  String partie;
  String obrazek;
  

  Cvik({required this.id, required this.nazev, required this.partie, required this.obrazek});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nazev': nazev,
      'partie': partie,
      'obrazek': obrazek,
    };
  }

  factory Cvik.fromMap(Map<String, dynamic> map) {
    return Cvik(
      id: map['id'],
      nazev: map['nazev'],
      partie: map['partie'],
      obrazek: map['obrazek'],
    );
  }

  Cvik copyWith({int? id, String? nazev, String? partie, String? obrazek}) {
    return Cvik(
      id: id ?? this.id,
      nazev: nazev ?? this.nazev,
      partie: partie ?? this.partie,
      obrazek: obrazek ?? this.obrazek,
    );
  }
}


