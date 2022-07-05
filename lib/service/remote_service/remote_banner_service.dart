import 'package:ecemmercapp/const.dart';
import 'package:http/http.dart' as http;

class RemoteBannerService {
  var client = http.Client();
  var remoteUrl = '$baseUrl/api/bannars';

  Future<dynamic> get() async {
    var response = await client.get(
        Uri.parse('$remoteUrl?populate=image')
    );
    return response;
  }
}
