import 'package:flutter/material.dart';

import 'model/expanse model.dart';

// Dart এর নিয়ম অনুযায়ী ক্লাস এর নাম বড় হাতের অক্ষরে (Expanse) করা হয়েছে
class Expanse extends StatefulWidget {
  const Expanse({super.key});

  @override
  State<Expanse> createState() => _ExpanseState();
}

class _ExpanseState extends State<Expanse> {
  final List<String> categoryList = ['food', 'transport', 'bills'];

  TextEditingController titleController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  DateTime expanseDate = DateTime.now();
  String? selectedValue;

  double totalAmount = 0.0;
  final List<ExpanseModel> _expanse = [];
  void showFrom() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            return Padding(
              padding: EdgeInsets.only(
                top: 10,
                left: 10,
                right: 10,
                bottom: MediaQuery.of(context).viewInsets.bottom + 10,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: titleController,
                    decoration: const InputDecoration(
                      labelText: "Title",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: amountController,
                    keyboardType: TextInputType
                        .number, // টাকার পরিমাণের জন্য নম্বর কিবোর্ড
                    decoration: InputDecoration(
                      labelText: "Amount",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  DropdownButtonFormField<String>(
                    value: selectedValue, // বর্তমান সিলেক্টেড ভ্যালু
                    hint: const Text("Select Category"), // শুরুতে যা দেখাবে
                    items: categoryList.map((String category) {
                      return DropdownMenuItem<String>(
                        value: category,
                        child: Text(
                          category,
                        ), // এখানে ক্যাটাগরির আসল নাম দেখাবে
                      );
                    }).toList(),
                    onChanged: (value) {
                      // setModalState ব্যবহার করে মডালের ভেতরের UI আপডেট করা হচ্ছে
                      setModalState(() {
                        selectedValue = value;
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 40,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        final amountC = double.tryParse(
                          amountController.text.trim(),
                        );
                        if (titleController.text.isNotEmpty ||
                            amountC != null) {
                          _addExpanse(
                            titleController.text,
                            amountC!,
                            expanseDate,
                            selectedValue!,
                          );

                          Navigator.pop(context);
                          titleController.clear();
                          amountController.clear();
                          selectedValue = null;
                        } else {
                          Navigator.pop(context);
                          titleController.clear();
                          amountController.clear();
                          selectedValue = null;
                        }
                      },
                      child: Text("Add", style: TextStyle(color: Colors.black)),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void _addExpanse(
    String title,
    double amount,
    DateTime date,
    String category,
  ) {
    setState(() {
      _expanse.add(
        ExpanseModel(
          title: title,
          amount: amount,
          category: category,
          date: date,
        ),
      );

      totalAmount += amount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("Expanse Tracker", style: TextStyle(color: Colors.white),),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // 1. Top Card (Uporer fixed card)
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 12.0,
              ),
              child: Card(
                color: Colors.teal.shade700,
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    vertical: 20.0,
                    horizontal: 16.0,
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'Total Amount',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        '\$$totalAmount',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // 2. Title Section (List er upore choto ekta title thakle premium lage)
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Recent Transactions',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),

            // 3. ListView Builder (Nicher scrolling list)
            Expanded(
              child: _expanse.isEmpty
            ? const Center(child: Text("No expenses added yet!")) : ListView.builder(
                itemCount: _expanse.length,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                itemBuilder: (context, index) {
                  final item = _expanse[index];
                  return Card(
                    elevation: 1.5,
                    margin: const EdgeInsets.only(bottom: 10.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        12,
                      ), // Subtle rounded corners
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 4.0,
                      ),
                      leading: CircleAvatar(
                        backgroundColor: Colors.teal.withOpacity(0.1),
                        child: Icon(
                          Icons.arrow_downward,
                          color: Colors.teal.shade700,
                        ), // Visual icon
                      ),
                      title: Text(
                        item.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                      subtitle: Text(
                        "${item.date.day}/${item.date.month}/${item.date.year}",
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 13,
                        ),
                      ),
                      trailing: Text(
                        '-\$${item.amount.toStringAsFixed(2)}', // Trailing-e price ba time dile UI ta perfect lage
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.red.shade700,
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
      floatingActionButton:FloatingActionButton(
        backgroundColor: Colors.teal,

        onPressed: (){
          showFrom();
        },child: Icon(Icons.add, color: Colors.white,),) ,
    );
  }
}
