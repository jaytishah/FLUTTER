1.	Data (Words & Images)

final List<Map<String, String>> data = [
 {"word": "Apple", "image": "assets/images/apple.jpg"},
 {"word": "Ball", "image": "assets/images/ball.jpg"},
 
];
 
2.	Text-to-Speech (TTS)

Future<void> speak(String text) async {
 await tts.setSpeechRate(0.5);
 await tts.speak(text);
}

3.	Play Correct / Wrong Sounds

void playSound(String type) async {
 if (type == "correct") {
	await player.play(AssetSource("sounds/correct.mp3"));
 } else {
	await player.play(AssetSource("sounds/wrong.mp3"));
 }
}

4.	Generate Next Question

void nextQuestion() {
 final rand = Random();
 final newCurrent = data[rand.nextInt(data.length)];
 final Set<String> choiceSet = {newCurrent["word"]!};

 while (choiceSet.length < 4) {
	choiceSet.add(data[rand.nextInt(data.length)]["word"]!);
 }

 setState(() {
	current = newCurrent;
	options = choiceSet.toList()..shuffle();
 });

 speak("Find ${newCurrent["word"]}");
}

5.	Check Answer

void checkAnswer(String choice) {
 if (choice == current!["word"]) {
	playSound("correct");
	speak("Great! Correct answer");
	setState(() => score++);
 } else {
	playSound("wrong");
	speak("Oops! The correct answer is ${current!["word"]}");
 }

 Future.delayed(const Duration(seconds: 2), nextQuestion);
}
 
