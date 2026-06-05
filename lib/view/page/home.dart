import "package:flutter/material.dart";
import 'package:shadcn_ui/shadcn_ui.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("puniyu launcher", style: ShadTheme.of(context).textTheme.h1),
      ),
    );
  }
}