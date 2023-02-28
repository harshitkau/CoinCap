import 'package:dio/dio.dart';
import '../models/app_config.dart';
import 'package:get_it/get_it.dart';

class HTTPservice {
  final Dio dio = Dio();
  AppConfig? _appConfig;
  String? _base_url;

  HTTPservice() {
    _appConfig = GetIt.instance.get<AppConfig>();
    _base_url = _appConfig!.COIN_API_BASE_URL;
  }

  Future<Response?> get(String _path) async {
    try {
      String _url = "$_base_url$_path";
      Response _responce = await dio.get(_url);
      return _responce;
    } catch (e) {
      print('Error are being presented');
      print(e);
    }
  }
}
