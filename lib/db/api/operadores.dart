class Operadores {
  late int id;
  late String questions;
  late String alternatives;
  late String correct;

  Operadores({
    required this.id,
    required this.questions,
    required this.alternatives,
    required this.correct,
  });

  Operadores.fromJson(Map json)
      : id = json['id'],
        questions = json['questions'],
        alternatives = json['name'],
        correct = json['correct'];
}