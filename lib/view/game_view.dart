import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:xo/view/widget/custom_buttom.dart';

class GameView extends StatefulWidget {
  const GameView({super.key, required this.player1, required this.player2});

  final String player1;
  final String player2;

  @override
  State<GameView> createState() => _GameViewState();
}

class _GameViewState extends State<GameView> {
  late List<List<String>> broad;
  late String currentPlayer;
  late String winner;
  late bool gameOver;

  @override
  void initState() {
    super.initState();
    broad = List.generate(3, (_) => List.generate(3, (_) => ""));
    currentPlayer = "X";
    winner = "";
    gameOver = false;
  }

  void resetGame() {
    setState(() {
      broad = List.generate(3, (_) => List.generate(3, (_) => ""));
      currentPlayer = "X";
      winner = "";
      gameOver = false;
    });
  }

  void makeMove(int row, int col) {
    if (broad[row][col] != "" || gameOver) {
      return;
    }
    setState(() {
      broad[row][col] = currentPlayer;

      if (broad[row][0] == currentPlayer &&
          broad[row][1] == currentPlayer &&
          broad[row][2] == currentPlayer) {
        winner = currentPlayer;
        gameOver = true;
      } else if (broad[0][col] == currentPlayer &&
          broad[1][col] == currentPlayer &&
          broad[2][col] == currentPlayer) {
        winner = currentPlayer;
        gameOver = true;
      } else if (broad[0][0] == currentPlayer &&
          broad[1][1] == currentPlayer &&
          broad[2][2] == currentPlayer) {
        winner = currentPlayer;
        gameOver = true;
      } else if (broad[0][2] == currentPlayer &&
          broad[1][1] == currentPlayer &&
          broad[2][0] == currentPlayer) {
        winner = currentPlayer;
        gameOver = true;
      }
      currentPlayer = currentPlayer == "X" ? "O" : "X";
      if (!broad.any((row) => row.any((cell) => cell == ""))) {
        gameOver = true;
        winner = " its a bloc";
      }
      if (winner != "") {
        AwesomeDialog(
            context: context,
            dialogType: DialogType.success,
            // btnOkText: "rest",
            btnOkText: " Play Again ",
            title: winner == "X"
                ? "${widget.player1} !Win"
                : winner == "O"
                    ? "${widget.player2} !Win "
                    : "it is Tie",
            btnOkOnPress: () {
              resetGame();
            }).show();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF323D5B),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 70,
            ),
            SizedBox(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Turn : ",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Text(
                        currentPlayer == "X"
                            ? "${widget.player1}  ($currentPlayer)"
                            : "${widget.player2}$currentPlayer",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: currentPlayer == "X"
                                ? Colors.red
                                : Colors.cyanAccent),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF5F6B84),
                borderRadius: BorderRadius.circular(10),
              ),
              margin: const EdgeInsets.all(5),
              child: GridView.builder(
                padding: const EdgeInsets.only(
                    top: 15, right: 10, left: 10, bottom: 10),
                itemCount: 9,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 5, mainAxisSpacing: 5, crossAxisCount: 3),
                itemBuilder: (context, index) {
                  int row = index ~/ 3;
                  int col = index % 3;
                  return GestureDetector(
                    onTap: () {
                      makeMove(row, col);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF0E1E3A),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          broad[row][col],
                          style: TextStyle(
                            fontSize: 80,
                            fontWeight: FontWeight.bold,
                            color: broad[row][col] == "X"
                                ? Colors.red
                                : Colors.cyanAccent,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              CustomButtom(
                onTap: () => resetGame(),
                text: "Reset",
              ),
              const SizedBox(
                width: 30,
              ),
              CustomButtom(
                text: 'Main',
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
