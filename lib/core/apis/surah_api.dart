import 'package:al_quran_app/core/models/surah.dart';
import 'package:http/http.dart' as http;

Future<List<Surah>> fetchSurah() async {
  var response =
      await http.get(Uri.parse('https://equran.id/api/surat/'));
  return surahFromJson(response.body);
}
