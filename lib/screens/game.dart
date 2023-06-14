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
          const Expanded(
              flex: 1,
              child: Text(
                "Score Board",
                style: ThemeText.text,
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
              child: Text(
            resultDeclaration,
            style: ThemeText.textWins,
          )),
        ],
      ),
    );
  }

  void _tapped(int index) {
    setState(() {
      if (oTurn && displayXO[index] == '') {
        displayXO[index] = '0';
      } else if (!oTurn && displayXO[index] == '') {
        displayXO[index] = 'X';
      }
      oTurn = !oTurn;
      _checkWinner();
    });
  }

  void _checkWinner() {
    //NOTE check first row
    if (displayXO[0] == displayXO[1] &&
        displayXO[0] == displayXO[2] &&
        displayXO[0] != '') {
      setState(() {
        resultDeclaration = 'Player ' + displayXO[0] + ' Wins!';
      });
    }

    //NOTE check second row
    if (displayXO[3] == displayXO[4] &&
        displayXO[3] == displayXO[5] &&
        displayXO[3] != '') {
      setState(() {
        resultDeclaration = 'Player ' + displayXO[3] + ' Wins!';
      });
    }

    //NOTE check third row
    if (displayXO[6] == displayXO[7] &&
        displayXO[6] == displayXO[8] &&
        displayXO[6] != '') {
      setState(() {
        resultDeclaration = 'Player ' + displayXO[6] + ' Wins!';
      });
    }

    //NOTE check first column
    if (displayXO[0] == displayXO[3] &&
        displayXO[0] == displayXO[6] &&
        displayXO[0] != '') {
      setState(() {
        resultDeclaration = 'Player ' + displayXO[0] + ' Wins!';
      });
    }

    //NOTE check second column
    if (displayXO[1] == displayXO[4] &&
        displayXO[1] == displayXO[7] &&
        displayXO[1] != '') {
      setState(() {
        resultDeclaration = 'Player ' + displayXO[1] + ' Wins!';
      });
    }

    //NOTE check third column
    if (displayXO[2] == displayXO[5] &&
        displayXO[2] == displayXO[8] &&
        displayXO[2] != '') {
      setState(() {
        resultDeclaration = 'Player ' + displayXO[2] + ' Wins!';
      });
    }

    //NOTE check first diagonal
    if (displayXO[0] == displayXO[4] &&
        displayXO[0] == displayXO[8] &&
        displayXO[0] != '') {
      setState(() {
        resultDeclaration = 'Player ' + displayXO[0] + ' Wins!';
      });
    }

    //NOTE check second diagonal
    if (displayXO[2] == displayXO[4] &&
        displayXO[2] == displayXO[6] &&
        displayXO[2] != '') {
      setState(() {
        resultDeclaration = 'Player ' + displayXO[2] + ' Wins!';
      });
    }
    print(resultDeclaration);
  }
}
