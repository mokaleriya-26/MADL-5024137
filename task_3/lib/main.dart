

import 'package:flutter/material.dart';

void main() {
  runApp(const ExpenseTrackerApp());
}

class ExpenseTrackerApp extends StatelessWidget {
  const ExpenseTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expense Tracker',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const ExpenseHomePage(),
    );
  }
}

class ExpenseHomePage extends StatelessWidget {
  const ExpenseHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],

      appBar: AppBar(
        title: const Text(
          "Expense Tracker",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo,
        onPressed: () {},
        child: const Icon(Icons.add, color: Colors.white),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Balance Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.indigo,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Column(
                children: [
                  Text(
                    "Total Balance",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Rs. 6,999",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Recent Transactions",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(Icons.filter_list),
              ],
            ),

            const SizedBox(height: 15),

            Expanded(
              child: ListView(
                children: const [
                  ExpenseTile(
                    title: "Groceries",
                    amount: "Rs. 200",
                    date: "28 Jul 2026",
                    icon: Icons.shopping_cart,
                    color: Colors.green,
                  ),
                  ExpenseTile(
                    title: "Netflix",
                    amount: "Rs. 499",
                    date: "27 Jul 2026",
                    icon: Icons.movie,
                    color: Colors.red,
                  ),
                  ExpenseTile(
                    title: "Petrol",
                    amount: "Rs. 300",
                    date: "25 Jul 2026",
                    icon: Icons.local_gas_station,
                    color: Colors.orange,
                  ),
                  ExpenseTile(
                    title: "Restaurant",
                    amount: "Rs. 1000",
                    date: "22 Jul 2026",
                    icon: Icons.restaurant,
                    color: Colors.purple,
                  ),
                  ExpenseTile(
                    title: "Shopping",
                    amount: "Rs. 5000",
                    date: "20 Jul 2026",
                    icon: Icons.shopping_bag,
                    color: Colors.blue,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.indigo,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pie_chart),
            label: "Reports",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}

class ExpenseTile extends StatelessWidget {
  final String title;
  final String amount;
  final String date;
  final IconData icon;
  final Color color;

  const ExpenseTile({
    super.key,
    required this.title,
    required this.amount,
    required this.date,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        tileColor: Colors.indigo,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        leading: CircleAvatar(
          backgroundColor: color,
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
        subtitle: Text(
          date,
          style: const TextStyle(
            color: Colors.white70,
          ),
        ),
        trailing: Text(
          amount,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
