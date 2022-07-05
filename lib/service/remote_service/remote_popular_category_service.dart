import 'package:ecemmercapp/const.dart';
import 'package:http/http.dart'as http;

class  RemotePopularCategoryService {

    final client =  http.Client();
    var remoteUrl = '$baseUrl/api/papular-categroys';
    Future<dynamic> get() async {
      final response = await client.get(
        Uri.parse(
        '$remoteUrl?populate=categroy,categroy.image&pagination[start]=0&pagination[limit]=5')
      );
     return response;
    }
}