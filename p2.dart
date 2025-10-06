1.	Main Entry Point

void main() {
 runApp(const KidsMathApp());
}
 
2.	HomeScreen Core (operation + mode selection)

class HomeScreen extends StatefulWidget {
 const HomeScreen({super.key});
 @override
 State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 Operation _operation = Operation.addition;
 Mode _mode = Mode.practice;
 int _level = 1;

 void _openPractice() {
	Navigator.of(context).push(MaterialPageRoute(
	builder: (_) => PracticeScreen(operation: _operation, level: _level, tts: _tts),
	));
 }

 void _openQuiz() {
	Navigator.of(context).push(MaterialPageRoute(
	builder: (_) => QuizScreen(operation: _operation, level: _level, tts: _tts),
	));
 }
}

3.	Problem Generation (Practice Mode)

void _generate() {
 final range = _rangeForLevel(widget.level);
 if (widget.operation == Operation.division) {
	b = _rand.nextInt(range) + 1;
	int multiplier = _rand.nextInt(range) + 1;
	a = b * multiplier; // divisible
 } else {
 
 }
}
4.	Checking Answer (Practice Mode)

void _submit() {
 final ans = num.tryParse(userAnswer);
 final correct = _correctAnswer();
 if (ans == correct) {
	feedback = 'Great! Correct';
 } else {
	feedback = 'Try again';
 
 }
 setState(() {});
}

5.	Quiz Question Generation

void _nextQuestion() {
 final range = _rangeForLevel(widget.level);
 if (widget.operation == Operation.division) {
	b = _rand.nextInt(range) + 1;
	a = b * (_rand.nextInt(range) + 1);
 } else {
 
 
 while (set.length < 4) {
	set.add(correct + (_rand.nextInt(7) - 3));
 }
 choices = set.toList()..shuffle();
}

6.	Checking Answer (Quiz Mode)

	score++;
 }
 if (questionNo >= total) {
	_showResult();
 } else {
	_nextQuestion();
 }
}
 
