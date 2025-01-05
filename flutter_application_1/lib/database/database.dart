class Cvik {
  int id;
  String nazev;
  String partie;
  String obrazek;
  String popis;
  //List<int>? lastPerformances;
  

  Cvik({required this.id, required this.nazev, required this.partie, required this.obrazek, required this.popis});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nazev': nazev,
      'partie': partie,
      'obrazek': obrazek,
      'popis': popis,
    };
  }
Map<String, dynamic> toMapWithoutId() {
    return {
      'nazev': nazev,
      'partie': partie,
      'obrazek': obrazek,
      'popis': popis,
    };
  }
  factory Cvik.fromMap(Map<String, dynamic> map) {
    return Cvik(
      id: map['id'],
      nazev: map['nazev'],
      partie: map['partie'],
      obrazek: map['obrazek'],
      popis: map['popis'],
    );
  }

  Cvik copyWith({int? id, String? nazev, String? partie, String? obrazek, String? popis}) {
    return Cvik(
      id: id ?? this.id,
      nazev: nazev ?? this.nazev,
      partie: partie ?? this.partie,
      obrazek: obrazek ?? this.obrazek,
      popis: popis ?? this.popis
    );
  }
}


