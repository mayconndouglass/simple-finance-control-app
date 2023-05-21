import 'package:flutter/material.dart';

import 'pages/finance_page.dart';


class FinanceApp extends StatelessWidget {
  const FinanceApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Controle Financeiro',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: const FinancePage(),
    );
  }
}
