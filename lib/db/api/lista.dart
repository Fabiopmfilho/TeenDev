class Lista {
  late int id;
  late String questions;
  late String alternatives;
  late String correct;

  Lista({
    required this.id,
    required this.questions,
    required this.alternatives,
    required this.correct,
  });

  Lista.fromJson(Map json)
      : id = json['id'],
        questions = json['questions'],
        alternatives = json['name'],
        correct = json['correct'];
}