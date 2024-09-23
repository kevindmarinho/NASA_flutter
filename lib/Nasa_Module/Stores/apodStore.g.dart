// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apodStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Apodstore on _ApodStore, Store {
  late final _$apodModelAtom =
      Atom(name: '_ApodStore.apodModel', context: context);

  @override
  ApodModel? get apodModel {
    _$apodModelAtom.reportRead();
    return super.apodModel;
  }

  @override
  set apodModel(ApodModel? value) {
    _$apodModelAtom.reportWrite(value, super.apodModel, () {
      super.apodModel = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_ApodStore.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$selectedDateAtom =
      Atom(name: '_ApodStore.selectedDate', context: context);

  @override
  DateTime get selectedDate {
    _$selectedDateAtom.reportRead();
    return super.selectedDate;
  }

  @override
  set selectedDate(DateTime value) {
    _$selectedDateAtom.reportWrite(value, super.selectedDate, () {
      super.selectedDate = value;
    });
  }

  late final _$fetchApodAsyncAction =
      AsyncAction('_ApodStore.fetchApod', context: context);

  @override
  Future<void> fetchApod({DateTime? date}) {
    return _$fetchApodAsyncAction.run(() => super.fetchApod(date: date));
  }

  late final _$selectDateAsyncAction =
      AsyncAction('_ApodStore.selectDate', context: context);

  @override
  Future<void> selectDate(BuildContext context) {
    return _$selectDateAsyncAction.run(() => super.selectDate(context));
  }

  @override
  String toString() {
    return '''
apodModel: ${apodModel},
isLoading: ${isLoading},
selectedDate: ${selectedDate}
    ''';
  }
}
