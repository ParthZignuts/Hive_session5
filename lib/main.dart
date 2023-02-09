import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_storage/bank_account.dart';


 Box? box;
Future<void> main() async {

  await Hive.initFlutter();
  Hive.registerAdapter(BankAccountAdapter());
  box = await Hive.openBox('box');
  box!.put("bankAccount", BankAccount(accHolderName: "Parth", balance: 20000));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lime,
      ),
      home: HivestoragePage(),
    );
  }
}

class HivestoragePage extends StatefulWidget {
  const HivestoragePage({Key? key}) : super(key: key);

  @override
  State<HivestoragePage> createState() => _HivestoragePageState();
}

class _HivestoragePageState extends State<HivestoragePage> {

  @override
  Widget build(BuildContext context) {

   BankAccount name =box!.get('bankAccount');
    return Scaffold(
      appBar: AppBar(
        centerTitle: true ,
        title: Text("Hive"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("${name.accHolderName}"),
            Text("${name.balance}"),
          ],
        ),
      ),
    );
  }
}
