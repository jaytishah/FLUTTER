
void main() {
 runApp(ITQuizApp());
}

2.	Question Model

class Question {
 final String subject;
 final String text;
 final List<String> options;
 
 final int correctIndex;

 Question({
	required this.subject,
	required this.text,
	required this.options,
	required this.correctIndex,
 });
}

3.	Quiz Page (Core Logic)

class QuizPage extends StatefulWidget {
 final String subject;
 QuizPage({required this
