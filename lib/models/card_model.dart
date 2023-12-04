import 'package:gatito_mimoso/constants.dart';
import 'package:gatito_mimoso/models/card_type.dart';

class CardModel {
  CardType tipo;

  String titulo;
  String descripcion;

  bool aceptar = true;
  bool rechazar = true;
  bool postergar = true;

  String consecuenciasAceptar = '';
  String consecuenciasRechazar = '';
  String consecuenciasPostergar = '';

  CardModel({
    required this.tipo,
    required this.titulo,
    required this.descripcion,
    this.aceptar = true,
    this.rechazar = true,
    this.postergar = true,
    this.consecuenciasAceptar = '',
    this.consecuenciasRechazar = '',
    this.consecuenciasPostergar = '',
  });

  String consecuencias(AccionCarta accion) {
    if (accion == AccionCarta.aceptar) return consecuenciasAceptar;
    if (accion == AccionCarta.rechazar) return consecuenciasRechazar;
    if (accion == AccionCarta.postergar) return consecuenciasPostergar;
    return '';
  }
}

final cartas = {
  'G001': CardModel(
      tipo: tipoEvento,
      titulo: "Estanflación",
      descripcion:
          "Lo bueno es que ahora que no tenés laburo no importa que los precios se hayan ido a la mierda."),
  'E001': CardModel(
    tipo: tipoEstablishment,
    titulo: "Dolarización",
    rechazar: false,
    descripcion:
        "Te vamos a hacer un favor, vamos a dejarte usar nuestra moneda. Si necesitás más... pedinos.",
    consecuenciasAceptar: "+C,@G001",
    consecuenciasRechazar: "-C,@G001",
    consecuenciasPostergar: "@E001",
  ),
  'C001': CardModel(
      tipo: tipoCasta,
      titulo: "Solidaridad hermano",
      descripcion:
          "Miralo pobrecito, anda sin laburo. Fijate si tenés un lugarcito en algún ministerio."),
  'F001': CardModel(
      tipo: tipoFuerzas,
      titulo: "¿¡Un K-Puto!?",
      descripcion:
          "Sabes que ver dos hombres besandose nos hace doler la panza, y si es K, todavía más. ¡Rajalo ya!."),
  'G002': CardModel(
      tipo: tipoEvento,
      titulo: "Cuando la vida te da...",
      descripcion:
          "Tu esbirra influencer convence a un montón de followers para ir a probar que la tierra es plana. Inesperadamente tenía razón y lo descubre cuando todos caen por el borde de la tierra y mueren en el espacio."),
};
