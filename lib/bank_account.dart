import 'package:hive/hive.dart';

part 'bank_account.g.dart';

@HiveType(typeId: 1)
class BankAccount {

  @HiveField(0)
  String accHolderName;

  @HiveField(1)
  int balance;
  BankAccount({required this.accHolderName,required this.balance});
}
