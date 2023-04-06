import 'package:dio/dio.dart';

import '../base_client.dart';
import '../endpoints.dart';

class HomeApi {
  static Future<Response> getBannerList() async {
    return await BaseClient().get(
      EndPoints.bannersEndPoint,
    );
  }
}
