import 'package:gatito_mimoso/models/card_type.dart';

class CardModel {
  CardType tipo;

  String titulo;
  String descripcion;

  bool aceptar = true;
  bool rechazar = true;
  bool postergar = true;

  List<CardModel> consecuencias = List.empty();

  CardModel({
    required this.tipo,
    required this.titulo,
    required this.descripcion,
    this.aceptar = true,
    this.rechazar = true,
    this.postergar = true,
  });
}

final List<CardModel> cartas = [
  CardModel(
      tipo: tipoEvento,
      titulo: "Estanflación",
      descripcion:
          "Lo bueno es que ahora que no tenés laburo no importa que los precios se hayan ido a la mierda."),
  CardModel(
      tipo: tipoEstablishment,
      titulo: "Dolarización",
      rechazar: false,
      descripcion:
          "Te vamos a hacer un favor, vamos a dejarte usar nuestra moneda. Si necesitás más... pedinos."),
  CardModel(
      tipo: tipoCasta,
      titulo: "Solidaridad hermano",
      descripcion:
          "Miralo pobrecito, anda sin laburo. Fijate si tenés un lugarcito en algún ministerio."),
  CardModel(
      tipo: tipoFuerzas,
      titulo: "¿¡Un K-Puto!?",
      descripcion:
          "Sabes que ver dos hombres besandose nos hace doler la panza, y si es K, todavía más. ¡Rajalo ya!."),
  CardModel(
      tipo: tipoEvento,
      titulo: "Cuando la vida te da limones...",
      descripcion:
          "Tu esbirra influencer convence a un montón de followers para ir a probar que la tierra es plana. Inesperadamente tenía razón y lo descubre cuando todos caen por el borde de la tierra y mueren en el espacio."),
];
