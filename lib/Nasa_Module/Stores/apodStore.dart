import 'package:mobx/mobx.dart';
import 'package:flutter_study_1/Nasa_Module/Models/APODModel.dart';
import 'package:flutter_study_1/Nasa_Module/Service/APODApiService.dart';
import 'package:flutter/material.dart';

part 'apodStore.g.dart';

class Apodstore = _ApodStore with _$Apodstore;

abstract class _ApodStore with Store {
  final ApodApiService apodApiService = ApodApiService();

  @observable
  ApodModel? apodModel;

  @observable
  bool isLoading = false;

  @observable
  DateTime selectedDate = DateTime.now();

  @action
  Future<void> fetchApod({DateTime? date}) async {
    isLoading = true;
    try {
      final apod = await apodApiService.fetchApod(date: date);
      apodModel = apod;
    } catch(e) {
      //algum erro
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> selectDate(BuildContext context) async {
  final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: selectedDate,
    firstDate: DateTime(1970),
    lastDate: DateTime.now(),
  );
  if (picked != null && picked != selectedDate) {
    selectedDate = picked;
    print("Data selecionada: ${picked.toString()}");
    await fetchApod(date: picked);
  }
}
}