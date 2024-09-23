import 'localization_service.dart';

enum Translatekey {
  titleHome
}

extension TranslatekeyExtension on Translatekey {
  String get _string => toString().split('.')[1];

  String translate(context) {
    return LocalizationService.of(context).translate(_string) ?? "";
  }
}