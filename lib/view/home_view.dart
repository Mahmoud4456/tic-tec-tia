import 'package:flutter/material.dart';
import 'package:xo/view/widget/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF323D5B),
        body: HomeViewBody(),
    );
  }
}
