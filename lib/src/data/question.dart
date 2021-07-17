/// [Question] is the class that implements the data model of a question of the SUS questionnarie.
class Question{
  String text;

  /// Default constructor of a [Question].
  Question({required this.text});

  /// Returns the status of a [Question].
  @override
  String toString() {
    return (StringBuffer('Question(')
          ..write('text: $text ')
          ..write(')'))
        .toString();
  } // toString

}// Question