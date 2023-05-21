import 'package:finance/consts.dart';
import 'package:flutter/material.dart';

import '../utils/get_month_name.dart';
import '../widgets/rounded_card.dart';
import '../utils/transactions.dart';

class FinancePage extends StatefulWidget {
  const FinancePage({Key? key}) : super(key: key);

  @override
  FinancePageState createState() => FinancePageState();
}

class FinancePageState extends State<FinancePage> {
  List<Transaction> transactions = [];

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
              margin: const EdgeInsets.symmetric(horizontal: 16),
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
                Text('R\$ ${_formatValue(1.500)}',//TODO valor deve ser futuramente dinamico
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
                          'R\$ ${_formatValue(1.50)}',
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
                            'R\$ ${_formatValue(0.0)}',//TODO Aqui é valor dinamico
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
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RoundedCart(
                  color: Colors.greenAccent,
                  text: 'Depósito',
                  icon: Icon(
                    Icons.arrow_upward,
                    size: 20,
                    color: Colors.white,
                  ),
                ),
                RoundedCart(
                  color: Colors.red,
                  text: 'Saque',
                  icon: Icon(
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
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(
                          color: transaction.value < 0 ? Colors.red : Colors.greenAccent,
                          width: 4,
                        ),
                      ),
                    ),
                    child: ListTile(
                      leading: Icon(transaction.icon),
                      title: Text(transaction.description),
                      subtitle: Text(
                        '${transaction.date.day} ${getMonthName(transaction.date.month)} ${transaction.date.year}',
                      ),
                      trailing: Text(
                        'R\$ ${_formatValue(transaction.value)}',
                        style: TextStyle(
                          color: transaction.value < 0 ? Colors.red : Colors.greenAccent,
                        ),
                      ),
                    ),
                  ),
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

