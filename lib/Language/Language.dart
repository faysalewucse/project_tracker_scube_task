import 'package:get/get.dart';

import 'bn.dart';
import 'en.dart';

class Language extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': en,
    'bn_BD': bn,

  };
}