import 'package:finance/consts.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import '../utils/generate_Random_Date.dart';
import '../utils/month_name_generator.dart';
import '../widgets/rounded_card.dart';
import '../utils/transactions.dart';

class FinancePage extends StatefulWidget {
  const FinancePage({Key? key}) : super(key: key);

  @override
  FinancePageState createState() => FinancePageState();
}

class FinancePageState extends State<FinancePage> {
  List<Transaction> transactions = [];
  double accountBalance = 0.0;
  double totalDeposits = 0.0;
  double totalWithdrawals = 0.0;
  final random = Random();

  String _formatValue(double value) {
    final intValue = value.toInt();
    final doubleValue = value - intValue;

    final formattedIntValue = intValue.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]}.',
    );

    final formattedDoubleValue = doubleValue.toStringAsFixed(2).split('.')[1];

    return '$formattedIntValue,$formattedDoubleValue';
  }

  void deposit() {
    final depositValue = random.nextDouble() * 999.99;
    final transaction = Transaction(
      description: 'Depósito',
      icon: Icons.arrow_upward,
      date: RandomDateGenerator.execute(),
      value: depositValue,
    );

    setState(() {
      transactions.add(transaction);
      accountBalance += depositValue;
      totalDeposits += depositValue;
    });
  }

  void withdraw() {
  double withdrawValue = random.nextDouble() * accountBalance;

  while (withdrawValue > accountBalance && accountBalance > 0.00) {
    if (accountBalance == 0.01 || accountBalance == 0.00) {
      break;
    }

    withdrawValue = random.nextDouble() * accountBalance;
  }

  if (withdrawValue >= 0.01 && withdrawValue <= 999.99) {
    final transaction = Transaction(
      description: 'Saque',
      icon: Icons.arrow_downward,
      date: RandomDateGenerator.execute(),
      value: -withdrawValue,
    );

    setState(() {
      transactions.add(transaction);
      accountBalance -= withdrawValue;
      totalWithdrawals -= withdrawValue;
    });
  }
}

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
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Container (
              width: MediaQuery.of(context).size.width * 0.85,
              height: 224,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                  lightPink,
                  dartPink,
                ]),
                borderRadius: BorderRadius.circular(4.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              padding: const EdgeInsets.all(16),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   const Text(
                    'Saldo',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color:  Colors.white,
                    ),
                  ),
                const SizedBox(height: 8),
                Text('R\$ ${_formatValue(accountBalance)}',
                  style: const TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        const Text(
                          'Depósitos:',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'R\$ ${_formatValue(totalDeposits)}',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Saques:',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'R\$ ${_formatValue(totalWithdrawals)}',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RoundedCart(
                  onPressed: deposit,
                  color: lightGreen,
                  text: 'Depósito',
                  icon: const Icon(
                    Icons.arrow_upward,
                    size: 20,
                    color: Colors.white,
                  ),
                ),
                RoundedCart(
                  onPressed: withdraw,
                  color: red,
                  text: 'Saque',
                  icon: const Icon(
                    Icons.arrow_downward,
                    size: 20,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
            child: ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (ctx, index) {
                final transaction = transactions[index];
                return Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 28, vertical: 8),
                    child: ListTile(
                      leading: Icon(transaction.icon),
                      title: Text(transaction.description),
                      subtitle: Text(
                        '${transaction.date.day} ${MonthNameGenerator.exeute(transaction.date.month)} ${transaction.date.year}',
                      ),
                      trailing: Text(
                        'R\$ ${_formatValue(transaction.value)}',
                        style: TextStyle(
                          color: transaction.value < 0 ? red : dartGreen,
                        ),
                      ),
                    ),
                  /* ), */
                );
              },
            ),
          ),
          ],
        ),
      ),
    );
  }
}

