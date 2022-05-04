import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'saving_transaction.g.dart';
abstract class SavingTransaction implements Built<SavingTransaction, SavingTransactionBuilder> {
  String? get code;
  String? get description;

  String? get  msisdn;
  String? get requestDate;
  String? get account;
  String? get accountDesc;
  String? get  transType;
  String? get  amount;
  String? get charge;
  String? get  balance;

  SavingTransaction._();
  factory SavingTransaction([updates(SavingTransactionBuilder b)]) = _$SavingTransaction;

  static Serializer<SavingTransaction> get serializer => _$savingTransactionSerializer;
}