import 'package:get/get.dart';
import 'package:myapp/data/api/api_client.dart';
import 'package:myapp/utilities/app_constant.dart';

class PopularProductRepo extends GetxService {
  final ApiClient apiClient;

  PopularProductRepo({required this.apiClient});

  Future<Response> getPopularProductList() async {
    return await apiClient.getData(AppConstant.DRINKS_URI);
  }
}
