import 'package:flutter/material.dart';

// Dart এর নিয়ম অনুযায়ী ক্লাস এর নাম বড় হাতের অক্ষরে (Expanse) করা হয়েছে
class Expanse extends StatefulWidget {
  const Expanse({super.key});

  @override
  State<Expanse> createState() => _ExpanseState();
}

class _ExpanseState extends State<Expanse> {
  final List<String> categoryList = ['food', 'transport', 'bills'];

  // সিলেক্টেড ভ্যালু ট্র্যাক করার জন্য ভেরিয়েবল
  String? selectedValue;

  double totalAmount = 0.0;

  void showFrom() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // কিবোর্ড আসলে যেন ফর্মটি ওপরে উঠে যায়
      builder: (context) {
        // StatefulBuilder ব্যবহার করা হয়েছে যাতে মডালের ভেতরের স্টেট আপডেট করা যায়
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            return Padding(
              // কিবোর্ডের কারণে যেন ফর্ম ঢেকে না যায়, সেজন্য নিচের প্যাডিং ডাইনামিক করা হয়েছে
              padding: EdgeInsets.only(
                top: 10,
                left: 10,
                right: 10,
                bottom: MediaQuery.of(context).viewInsets.bottom + 10,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const TextField(
                    decoration: InputDecoration(
                      labelText: "Title",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const TextField(
                    keyboardType: TextInputType.number, // টাকার পরিমাণের জন্য নম্বর কিবোর্ড
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
                        child: Text(category), // এখানে ক্যাটাগরির আসল নাম দেখাবে
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
                  SizedBox(height: 40, width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal, foregroundColor: Colors.white
                      ) ,
                      onPressed: (){}, child: Text("Add", style: TextStyle(color: Colors.black),)),)
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        // মডাল ওপেন করার জন্য বাইরে setState দরকার নেই, সরাসরি ফাংশন কল করলেই হবে
        actions: [
          IconButton(
            onPressed: showFrom,
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: SafeArea(child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 60 ,right: 40, top: 10),
            child: Card(
              color: Colors.teal,
              child: SizedBox(
                height: 100,
                width: 200,
                child: Text(totalAmount.toString()),
              ),
            ),
          )
        ],
      )),
    );
  }
}