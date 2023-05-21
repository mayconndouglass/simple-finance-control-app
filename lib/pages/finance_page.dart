import 'package:flutter/material.dart';

class FinancePage extends StatefulWidget {
  const FinancePage({Key? key}) : super(key: key);

  @override
  FinancePageState createState() => FinancePageState();
}

class FinancePageState extends State<FinancePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Controle Financeiro',
            style: TextStyle(color: Colors.black),
          ),
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}
