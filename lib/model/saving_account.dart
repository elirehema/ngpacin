import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'saving_account.g.dart';

abstract class SavingAccount implements Built<SavingAccount, SavingAccountBuilder>{
  String? get account;
  String? get description;
  String? get balance;

  SavingAccount._();
  factory SavingAccount([updates(SavingAccountBuilder b)]) = _$SavingAccount;


  static Serializer<SavingAccount> get serializer => _$savingAccountSerializer;
}