import 'package:flutter/material.dart';
import '../story_brain.dart';

void main() => runApp(const AdventureGame());

class AdventureGame extends StatelessWidget {
  const AdventureGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(), // we are using the dark theme
      home: StoryPage(),
    );
  }
}

//GET THE STORYBRAIN FROM story_brain.dart
StoryBrain storyBrain = StoryBrain();

class StoryPage extends StatefulWidget {
  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 12,
                child: Center(
                  child: Text(
                    storyBrain.getStory(),
                    style: const TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: TextButton(
                  onPressed: () {
                    // CHOICE 1
                    setState(() {
                      storyBrain.nextStory(1);
                    });
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith(
                            (states) => Colors.red),
                    foregroundColor: MaterialStateProperty.resolveWith(
                            (states) => Colors.white),
                    shape: MaterialStateProperty.resolveWith(
                            (states) => const BeveledRectangleBorder()),
                  ),
                  child: Text(
                    storyBrain.getChoice1(),
                    style: const TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Expanded(
                flex: 2,
                child: Visibility(
                  visible: storyBrain.buttonShouldBeVisible(),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(48.0),
                      color: Colors.red
                    ),
                    child: TextButton(
                      onPressed: () {
                        // CHOICE 2
                        setState(() {
                          storyBrain.nextStory(2);
                        });
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith(
                                (states) => Colors.blue),
                        foregroundColor: MaterialStateProperty.resolveWith(
                                (states) => Colors.white),
                        shape: MaterialStateProperty.resolveWith(
                                (states) => const BeveledRectangleBorder()),
                      ),
                      child: Text(
                        storyBrain.getChoice2(),
                        style: const TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
