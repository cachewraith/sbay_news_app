
import 'package:get/get.dart';
import 'package:sbay_news_app/app/data/providers/api_provider.dart';

class DependencyInjection {
  static void init(){
    Get.put(ApiProvider());
  }
}