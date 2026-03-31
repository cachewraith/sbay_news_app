import 'package:get/get.dart';
import 'package:sbay_news_app/app/data/models/news_model.dart';
import 'package:sbay_news_app/app/data/providers/api_provider.dart';

class HomeController extends GetxController {
  final _apiProvider = Get.find<ApiProvider>();

  Rx<NewsModel> news = Rx(NewsModel());
  var isLoading = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    getNews();
    super.onInit();
  }

  void getNews() async {
    try{
      isLoading (true);

      final res = await _apiProvider.fetchNews();

      if(res.statusCode != 200){
        throw res.statusMessage ?? "Something went wrong";
      }
      final data = res.data;
      news.value = NewsModel.fromJson(data);
    } catch (e) {
      print("Error : $e");
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading(false);
    }
  }
}
