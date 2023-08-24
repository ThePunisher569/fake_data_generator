import 'package:json_annotation/json_annotation.dart';

part 'beer.g.dart';

@JsonSerializable(createFactory: true)
class Beer {
  final int id;
  final String uid, brand, name, style, hop, yeast, malts, ibu, alcohol, blg;

  Beer(this.id, this.uid, this.brand, this.name, this.style, this.hop,
      this.yeast, this.malts, this.ibu, this.alcohol, this.blg);

  factory Beer.fromJson(Map<String, dynamic> json) => _$BeerFromJson(json);

  @override
  String toString() {
    return 'Beer{id: $id, uid: $uid, brand: $brand, name: $name, style: $style, hop: $hop, yeast: $yeast, malts: $malts, ibu: $ibu, alcohol: $alcohol, blg: $blg}';
  }
}
