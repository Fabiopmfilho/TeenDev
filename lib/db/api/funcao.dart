class Funcao {
  late int id;
  late String questions;
  late String alternatives;
  late String correct;

  Funcao({
    required this.id,
    required this.questions,
    required this.alternatives,
    required this.correct,
  });

  Funcao.fromJson(Map json)
      : id = json['id'],
        questions = json['questions'],
        alternatives = json['name'],
        correct = json['correct'];
}
