import 'package:al_quran_app/core/models/ayah.dart';
import 'package:http/http.dart' as http;

Future<Data> fetchAyah({int? number}) async {
  var response = await http.get(
    Uri.parse('https://equran.id/api/v2/surat/$number'),
  );
  return ayahFromJson(response.body).data;
}
