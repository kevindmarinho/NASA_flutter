import 'package:flutter_study_1/Nasa_Module/Models/APODModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApodApiService {
  final String baseUrl = "https://api.nasa.gov/planetary/apod";
  final String apiKey = "FRCwjbKmSS5vK8CgGgn8CcGpwkDS2ezaHjHh5VxA";

  Future<ApodModel?> fetchApod({DateTime? date}) async {
    String formattedDate = date?.toIso8601String().split('T')[0] ?? DateTime.now().toIso8601String().split('T')[0];
    print("valor obtido no picker $date");
    print("valor da data formatada: $formattedDate");
    final url = Uri.parse('$baseUrl?api_key=$apiKey&date=$formattedDate');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print("APOD Data : $data");
        return ApodModel.fromJson(data);
      } else {
        print("Failed to fetch APOD: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("error fetching APOD: $e");
      return null;
    }
  }
}
