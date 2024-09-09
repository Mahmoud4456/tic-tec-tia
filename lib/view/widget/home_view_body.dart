import 'package:flutter/material.dart';

import '../game_view.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController controllerPlayer1 = TextEditingController();
  final TextEditingController controllerPlayer2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            " Welcome Friend",
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please Enter Your Name";
                }
                return null;
              },
              controller: controllerPlayer1,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: "Player 1 Name",
                labelStyle: TextStyle(color: Colors.white),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xD28974FF),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xD28974FF),
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please Enter Your Name";
                }
                return null;
              },
              controller: controllerPlayer2,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: "Player 2 Name",
                labelStyle: TextStyle(color: Colors.white),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xD28974FF),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xD28974FF),
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              if (formKey.currentState!.validate()) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  GameView(
                    player1: controllerPlayer1.text ,
                    player2: controllerPlayer2.text,
                  )),
                );
              }
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.green),
              padding: const EdgeInsets.all(15),
              child: const Text(
                "Start Game",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
