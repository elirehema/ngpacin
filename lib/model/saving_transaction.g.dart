// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saving_transaction.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SavingTransaction> _$savingTransactionSerializer =
    new _$SavingTransactionSerializer();

class _$SavingTransactionSerializer
    implements StructuredSerializer<SavingTransaction> {
  @override
  final Iterable<Type> types = const [SavingTransaction, _$SavingTransaction];
  @override
  final String wireName = 'SavingTransaction';

  @override
  Iterable<Object?> serialize(Serializers serializers, SavingTransaction object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.code;
    if (value != null) {
      result
        ..add('code')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.msisdn;
    if (value != null) {
      result
        ..add('msisdn')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.requestDate;
    if (value != null) {
      result
        ..add('requestDate')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.account;
    if (value != null) {
      result
        ..add('account')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.accountDesc;
    if (value != null) {
      result
        ..add('accountDesc')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.transType;
    if (value != null) {
      result
        ..add('transType')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.amount;
    if (value != null) {
      result
        ..add('amount')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.charge;
    if (value != null) {
      result
        ..add('charge')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.balance;
    if (value != null) {
      result
        ..add('balance')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  SavingTransaction deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SavingTransactionBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'code':
          result.code = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'msisdn':
          result.msisdn = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'requestDate':
          result.requestDate = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'account':
          result.account = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'accountDesc':
          result.accountDesc = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'transType':
          result.transType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'amount':
          result.amount = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'charge':
          result.charge = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'balance':
          result.balance = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$SavingTransaction extends SavingTransaction {
  @override
  final String? code;
  @override
  final String? description;
  @override
  final String? msisdn;
  @override
  final String? requestDate;
  @override
  final String? account;
  @override
  final String? accountDesc;
  @override
  final String? transType;
  @override
  final String? amount;
  @override
  final String? charge;
  @override
  final String? balance;

  factory _$SavingTransaction(
          [void Function(SavingTransactionBuilder)? updates]) =>
      (new SavingTransactionBuilder()..update(updates)).build();

  _$SavingTransaction._(
      {this.code,
      this.description,
      this.msisdn,
      this.requestDate,
      this.account,
      this.accountDesc,
      this.transType,
      this.amount,
      this.charge,
      this.balance})
      : super._();

  @override
  SavingTransaction rebuild(void Function(SavingTransactionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SavingTransactionBuilder toBuilder() =>
      new SavingTransactionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SavingTransaction &&
        code == other.code &&
        description == other.description &&
        msisdn == other.msisdn &&
        requestDate == other.requestDate &&
        account == other.account &&
        accountDesc == other.accountDesc &&
        transType == other.transType &&
        amount == other.amount &&
        charge == other.charge &&
        balance == other.balance;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc($jc(0, code.hashCode),
                                        description.hashCode),
                                    msisdn.hashCode),
                                requestDate.hashCode),
                            account.hashCode),
                        accountDesc.hashCode),
                    transType.hashCode),
                amount.hashCode),
            charge.hashCode),
        balance.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SavingTransaction')
          ..add('code', code)
          ..add('description', description)
          ..add('msisdn', msisdn)
          ..add('requestDate', requestDate)
          ..add('account', account)
          ..add('accountDesc', accountDesc)
          ..add('transType', transType)
          ..add('amount', amount)
          ..add('charge', charge)
          ..add('balance', balance))
        .toString();
  }
}

class SavingTransactionBuilder
    implements Builder<SavingTransaction, SavingTransactionBuilder> {
  _$SavingTransaction? _$v;

  String? _code;
  String? get code => _$this._code;
  set code(String? code) => _$this._code = code;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _msisdn;
  String? get msisdn => _$this._msisdn;
  set msisdn(String? msisdn) => _$this._msisdn = msisdn;

  String? _requestDate;
  String? get requestDate => _$this._requestDate;
  set requestDate(String? requestDate) => _$this._requestDate = requestDate;

  String? _account;
  String? get account => _$this._account;
  set account(String? account) => _$this._account = account;

  String? _accountDesc;
  String? get accountDesc => _$this._accountDesc;
  set accountDesc(String? accountDesc) => _$this._accountDesc = accountDesc;

  String? _transType;
  String? get transType => _$this._transType;
  set transType(String? transType) => _$this._transType = transType;

  String? _amount;
  String? get amount => _$this._amount;
  set amount(String? amount) => _$this._amount = amount;

  String? _charge;
  String? get charge => _$this._charge;
  set charge(String? charge) => _$this._charge = charge;

  String? _balance;
  String? get balance => _$this._balance;
  set balance(String? balance) => _$this._balance = balance;

  SavingTransactionBuilder();

  SavingTransactionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _code = $v.code;
      _description = $v.description;
      _msisdn = $v.msisdn;
      _requestDate = $v.requestDate;
      _account = $v.account;
      _accountDesc = $v.accountDesc;
      _transType = $v.transType;
      _amount = $v.amount;
      _charge = $v.charge;
      _balance = $v.balance;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SavingTransaction other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SavingTransaction;
  }

  @override
  void update(void Function(SavingTransactionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SavingTransaction build() {
    final _$result = _$v ??
        new _$SavingTransaction._(
            code: code,
            description: description,
            msisdn: msisdn,
            requestDate: requestDate,
            account: account,
            accountDesc: accountDesc,
            transType: transType,
            amount: amount,
            charge: charge,
            balance: balance);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
