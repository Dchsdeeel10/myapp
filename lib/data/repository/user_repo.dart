import 'package:get/get.dart';
import 'package:myapp/data/api/api_client.dart';
import 'package:myapp/utilities/app_constant.dart';

class UserRepo {
  final ApiClient apiClient;
  UserRepo({required this.apiClient});

  Future<Response> getUserInfo() async {
    return await apiClient.getData(AppConstant.USER_INFO_URI);
  }
}
