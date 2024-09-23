// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nameStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NameStore on _NameStore, Store {
  Computed<String>? _$fullNameComputed;

  @override
  String get fullName => (_$fullNameComputed ??=
          Computed<String>(() => super.fullName, name: '_NameStore.fullName'))
      .value;

  late final _$nameAtom = Atom(name: '_NameStore.name', context: context);

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$surnameAtom = Atom(name: '_NameStore.surname', context: context);

  @override
  String get surname {
    _$surnameAtom.reportRead();
    return super.surname;
  }

  @override
  set surname(String value) {
    _$surnameAtom.reportWrite(value, super.surname, () {
      super.surname = value;
    });
  }

  late final _$middleNameAtom =
      Atom(name: '_NameStore.middleName', context: context);

  @override
  String get middleName {
    _$middleNameAtom.reportRead();
    return super.middleName;
  }

  @override
  set middleName(String value) {
    _$middleNameAtom.reportWrite(value, super.middleName, () {
      super.middleName = value;
    });
  }

  late final _$_NameStoreActionController =
      ActionController(name: '_NameStore', context: context);

  @override
  void changeFirstName() {
    final _$actionInfo = _$_NameStoreActionController.startAction(
        name: '_NameStore.changeFirstName');
    try {
      return super.changeFirstName();
    } finally {
      _$_NameStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeSurname() {
    final _$actionInfo = _$_NameStoreActionController.startAction(
        name: '_NameStore.changeSurname');
    try {
      return super.changeSurname();
    } finally {
      _$_NameStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeMiddleName() {
    final _$actionInfo = _$_NameStoreActionController.startAction(
        name: '_NameStore.changeMiddleName');
    try {
      return super.changeMiddleName();
    } finally {
      _$_NameStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetName() {
    final _$actionInfo =
        _$_NameStoreActionController.startAction(name: '_NameStore.resetName');
    try {
      return super.resetName();
    } finally {
      _$_NameStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
surname: ${surname},
middleName: ${middleName},
fullName: ${fullName}
    ''';
  }
}
