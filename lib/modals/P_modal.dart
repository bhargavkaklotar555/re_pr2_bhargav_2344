import 'dart:developer';

class Pmodal {
  int? id;
  String? name;
  String? image;

  Pmodal(
    this.id,
    this.name,
    this.image,
  );

  Pmodal.init() {
    log("Modal Initialized...");
  }

  factory Pmodal.fromMap({required Map data}) {
    return Pmodal(
      data['id'],
      data['name'],
      data['image'],
    );
  }
}
