import 'package:flutter/material.dart';
import 'package:tic_tac_toe/constants/colors.dart';
import 'package:tic_tac_toe/constants/themes.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  bool oTurn = true;
  List<String> displayXO = ['', '', '', '', '', '', '', '', ''];
  int oScore = 0;
  int xScore = 0;
  int fillBoxes = 0;

  String resultDeclaration = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryOne,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
      ),
      backgroundColor: AppColors.primaryOne,
      body: Column(
        children: [
          Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Player O",
                        style: oTurn
                            ? ThemeText.textPlayerTurn
                            : ThemeText.textPlayer,
                      ),
                      Text(
                        oScore.toString(),
                        style: ThemeText.textScore,
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Player X",
                        style: !oTurn
                            ? ThemeText.textPlayerTurn
                            : ThemeText.textPlayer,
                      ),
                      Text(
                        xScore.toString(),
                        style: ThemeText.textScore,
                      )
                    ],
                  )
                ],
              )),
          Expanded(
              flex: 3,
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemCount: 9,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        _tapped(index);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                                width: 5, color: AppColors.primaryOne),
                            color: AppColors.primaryTwo),
                        child: Center(
                          child: Text(
                            displayXO[index],
                            style: ThemeText.textHome,
                          ),
                        ),
                      ),
                    );
                  })),
          Expanded(
              child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  resultDeclaration,
                  style: ThemeText.textWins,
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 16)),
                    onPressed: () {
                      _clearBoardAll();
                    },
                    child: const Text(
                      "Lancer un jeu!",
                      style: ThemeText.textPlayer,
                    ))
              ],
            ),
          )),
        ],
      ),
    );
  }

  void _clearBoard() {
    setState(() {
      displayXO = ['', '', '', '', '', '', '', '', ''];
      resultDeclaration = '';
      fillBoxes = 0;
    });
  }

  void _clearBoardAll() {
    setState(() {
      displayXO = ['', '', '', '', '', '', '', '', ''];
      resultDeclaration = '';
      fillBoxes = 0;
      oScore = 0;
      xScore = 0;
    });
  }

  void _tapped(int index) {
    if (resultDeclaration == '') {
      setState(() {
        if (oTurn && displayXO[index] == '') {
          displayXO[index] = '0';
          fillBoxes++;
        } else if (!oTurn && displayXO[index] == '') {
          displayXO[index] = 'X';
          fillBoxes++;
        }
        oTurn = !oTurn;
        _checkWinner();
        if (oScore == 3) {
          resultDeclaration = 'Player O Wins!';
        } else if (xScore == 3) {
          resultDeclaration = 'Player X Wins!';
        }
        // resultDeclaration = "okdkakaka";
      });
    }
  }

  void _updateScore(String winner) {
    if (winner == '0') {
      oScore++;
    } else {
      xScore++;
    }
  }

  void _checkWinner() {
    //NOTE check first row
    if (displayXO[0] == displayXO[1] &&
        displayXO[0] == displayXO[2] &&
        displayXO[0] != '') {
      setState(() {
        // resultDeclaration = 'Player ${displayXO[0]} Wins!';
        _updateScore(displayXO[0]);
      });
      _clearBoard();
    }

    //NOTE check second row
    if (displayXO[3] == displayXO[4] &&
        displayXO[3] == displayXO[5] &&
        displayXO[3] != '') {
      setState(() {
        // resultDeclaration = 'Player ${displayXO[3]} Wins!';
        _updateScore(displayXO[3]);
      });
      _clearBoard();
    }

    //NOTE check third row
    if (displayXO[6] == displayXO[7] &&
        displayXO[6] == displayXO[8] &&
        displayXO[6] != '') {
      setState(() {
        // resultDeclaration = 'Player ${displayXO[6]} Wins!';
        _updateScore(displayXO[6]);
      });
      _clearBoard();
    }

    //NOTE check first column
    if (displayXO[0] == displayXO[3] &&
        displayXO[0] == displayXO[6] &&
        displayXO[0] != '') {
      setState(() {
        // resultDeclaration = 'Player ${displayXO[0]} Wins!';
        _updateScore(displayXO[0]);
      });
      _clearBoard();
    }

    //NOTE check second column
    if (displayXO[1] == displayXO[4] &&
        displayXO[1] == displayXO[7] &&
        displayXO[1] != '') {
      setState(() {
        // resultDeclaration = 'Player ${displayXO[1]} Wins!';
        _updateScore(displayXO[1]);
      });
      _clearBoard();
    }

    //NOTE check third column
    if (displayXO[2] == displayXO[5] &&
        displayXO[2] == displayXO[8] &&
        displayXO[2] != '') {
      setState(() {
        // resultDeclaration = 'Player ${displayXO[2]} Wins!';
        _updateScore(displayXO[2]);
      });
      _clearBoard();
    }

    //NOTE check first diagonal
    if (displayXO[0] == displayXO[4] &&
        displayXO[0] == displayXO[8] &&
        displayXO[0] != '') {
      setState(() {
        // resultDeclaration = 'Player ${displayXO[0]} Wins!';
        _updateScore(displayXO[0]);
      });
      _clearBoard();
    }

    //NOTE check second diagonal
    if (displayXO[2] == displayXO[4] &&
        displayXO[2] == displayXO[6] &&
        displayXO[2] != '') {
      setState(() {
        // resultDeclaration = 'Player ${displayXO[2]} Wins!';
        _updateScore(displayXO[2]);
      });
      _clearBoard();
    }
    if (fillBoxes == 9) {
      setState(() {
        resultDeclaration = 'Nobody Wins';
      });
      _clearBoard();
    }
  }
}
