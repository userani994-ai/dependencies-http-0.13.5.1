import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<String> analyzeHealth({
    required int age,
    required double height,
    required double weight,
    required String disease,
  }) async {
    final url = Uri.parse('https://your-api-endpoint.com/analyze');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'age': age,
        'height': height,
        'weight': weight,
        'disease': disease,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['recommendation']; // مثال: "يفيدك ✅" أو "ما يفيد ❌"
    } else {
      return 'خطأ في الاتصال بالذكاء الاصطناعي';
    }
  }
}
