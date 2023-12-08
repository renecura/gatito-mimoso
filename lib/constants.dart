import 'package:flutter/material.dart';
import 'package:gatito_mimoso/game_state.dart';
import 'models/patron_model.dart';

final gente = PatronModel(
  id: 'G',
  color: Colors.red.shade900,
  icon: Icons.group,
  status: Status.gente,
);
final casta = PatronModel(
  id: 'C',
  color: Colors.amber,
  icon: Icons.supervisor_account,
  status: Status.casta,
);
final fuerzas = PatronModel(
  id: 'F',
  color: Colors.green.shade800,
  icon: Icons.military_tech,
  status: Status.fuerzas,
);
final establishment = PatronModel(
  id: 'E',
  color: Colors.deepPurple,
  icon: Icons.account_balance,
  status: Status.establishment,
);

final patrones = {
  'G': gente,
  'C': casta,
  'F': fuerzas,
  'E': establishment,
};
PatronModel patron(String id) => patrones[id] ?? patrones['G']!;

enum Patron { gente, casta, fuerzas, establishment }

enum AccionCarta { nada, aceptar, rechazar, postergar }

const causas = {
  Status.gente:
      'El pueblo ya no aguantó más. Todo el mundo a la calle y se incendió el país. Hora de helicoptirizarse a la estratósfera.',
  Status.casta:
      'Amigui, socio, colega... ¿Que pasó? De acá salimos todos juntos, no hay YO en el mejor equipo de los últimos 50 años. Me parece que neceitas alinear los chakras en un retiro espiritual en Chapadmalal... uno permanente. Nosotros nos hacemos cargo.',
  Status.fuerzas:
      'A las fuerzas no les agradó que las dejaras de lado. Te metieron un tradicional golpe de estado. Lo bueno es que te dieron un pasaje en avion para sobrevolar el mar...',
  Status.establishment:
      'Cómo vas a morder la mano que te da de comer... de comer a vos mientras hambrea la gente, come on, all right. Tuvimos que intervenir y traerte un poco de freedom y poner algún gringo al mando.',
  Status.psicotico:
      'Quisiste hacer la tuya y la presión de los patrones fue demasiada. La ansiedad te supero, te disociaste de la realidad, tus dientes empezaron a rechinar y terminaste escupiendo espuma por la boca. La verdad a nadie le sorpredió este resultado.',
  Status.ok: '',
};
