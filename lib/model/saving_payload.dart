
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'saving_payload.g.dart';

abstract class SavingPayload implements Built<SavingPayload, SavingPayloadBuilder>{
  String? get savingAccount;
  int? get amount;
  String? get savingFrequency;
  String? get savingPeriod;

  SavingPayload._();
  factory SavingPayload([updates(SavingPayloadBuilder b)]) = _$SavingPayload;

  factory SavingPayload.deposit(savingAccount, amount) => new _$SavingPayload._(
      savingAccount: savingAccount,
      amount: amount
  );
  factory SavingPayload.withdraw(savingAccount, amount) => new _$SavingPayload._(
      savingAccount: savingAccount,
      amount: amount
  );
  factory SavingPayload.createSavingAccount(savingFrequency, savingPeriod,amount) => new _$SavingPayload._(
      savingFrequency: savingFrequency,
      savingPeriod: savingPeriod,
      amount: amount
  );
  static Serializer<SavingPayload> get serializer => _$savingPayloadSerializer;
}