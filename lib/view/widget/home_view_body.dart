import 'package:flutter/material.dart';
import 'package:xo/view/widget/custom_buttom.dart';
import '../game_view.dart';
import 'custom_form_field.dart';

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
            child: CustomFormField(controllerPlayer: controllerPlayer1 , label: "Player 1 Name",),
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: CustomFormField(controllerPlayer: controllerPlayer2, label: "Player 2 Name"),
          ),
          const SizedBox(
            height: 20,
          ),
          CustomButtom(onTap: (){
            if (formKey.currentState!.validate()) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  GameView(
                  player1: controllerPlayer1.text ,
                  player2: controllerPlayer2.text,
                )),
              );
            }
          }, text: "Start Game"),
        ],
      ),
    );
  }
}


