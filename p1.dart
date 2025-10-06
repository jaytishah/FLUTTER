1.	Main Entry Point

void main() {
 runApp(const MyApp());
}
 
2.	Core Variables (Letters & Numbers List)

String.fromCharCode(65 + i));
final numbers = List.generate(10, (i) => (i + 1).toString());

String category = "letters";	// letters | numbers String mode = "learn";	// learn | play | quiz int currentIndex = 0;

3.	Text-to-Speech Function

Future<void> speak(String text) async {
 await tts.stop();
 await tts.setPitch(1.1);
 await tts.setSpeechRate(0.5);
 await tts.speak(text);
}

4.	Play Item (when a letter/number is clicked)

Future<void> playItem(int i) async {
 setState(() => currentIndex = i);
 await speak(items[i]);
}

5.	Autoplay (Play Mode)

void startAutoplay() {
 stopAutoplay();
 int i = 0;

 Future<void> playNext() async {
	if (i >= items.length) i = 0;  // loop back
	await playItem(i);
	i++;
	Future.delayed(const Duration(seconds: 2), playNext);
 }

 playNext();
}

void stopAutoplay() {
 autoplayTimer?.cancel();
 autoplayTimer = null;
}
 
6.	Quiz Question Generation

void makeQuizQuestion() {
 final rand = Random();
 final correct = items[rand.nextInt(items.length)];
 final Set<String> choices = {correct};

 while (choices.length < 4) {
	choices.add(items[rand.nextInt(items.length)]);
 }

 setState(() {
	quizCorrect = correct;
	quizChoices = choices.toList()..shuffle();
 });

 speak(correct);
}

7.	Answer Checking (Quiz Mode)

void chooseAnswer(String choice) {
 setState(() => attempts++);
 if (choice == quizCorrect) {
	setState(() => score++);
	speak("Correct");
 } else {
	speak("No, it is $quizCorrect");
 }
 
makeQuizQuestion);
}
