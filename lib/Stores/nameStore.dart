import 'package:mobx/mobx.dart';
 
part 'nameStore.g.dart';


 
class NameStore = _NameStore with _$NameStore;
 
abstract class _NameStore with Store {
  @observable
  String name = 'kevin';
 
  @observable
  String surname = 'dias';
  @observable
  String middleName = 'middle';
 
  @computed
  String get fullName => '$name $middleName $surname ';
 
  @action
  void changeFirstName() {
    name = name == 'Jane' ? 'Gabriel' : 'Jane';
  }
 
  @action
  void changeSurname() {
    surname = surname == 'Doe' ? 'Dop' : 'Doe';
  }
   @action
  void changeMiddleName() {
    middleName = middleName == 'aaa' ? 'dias' : 'aaa';
  }
  @action
  void resetName() {
    name = 'Kevin';
    surname = 'Dias';
  }
}