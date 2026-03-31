
import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:sbay_news_app/app/config/app_config.dart';

class ApiProvider extends GetxService{
  late Dio _dio;


  // initial value for object
  @override
  void onInit() {
    // TODO: implement onInit
    _initializeDio();
    super.onInit();
  }

  void _initializeDio() {
    _dio = Dio(BaseOptions(
      baseUrl: kBaseUrl,
      followRedirects: false,
      validateStatus: (status) {
        return status! < 500;
      },
      headers: {
        'Content-Type' : "application/json",
        'Accept' : "application/json"
      }
    ));
  }

  Future<Response> fetchNews() async {
    try{
      final res = await _dio.get("/api/v4/top-headlines?category=genera&lang=en&country=us&max=10&apikey=${kApiKey}");
      return res;
    } catch (e){
      rethrow;
    }
  }
}