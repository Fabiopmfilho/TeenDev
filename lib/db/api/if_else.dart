class IfElse {
  late int id;
  late String questions;
  late String alternatives;
  late String correct;

  IfElse({
    required this.id,
    required this.questions,
    required this.alternatives,
    required this.correct,
  });

  IfElse.fromJson(Map json)
      : id = json['id'],
        questions = json['questions'],
        alternatives = json['name'],
        correct = json['correct'];
}