import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sample_project_3/number_fact_resp/number_fact_resp.dart';

Future<NumberFactResp> getNumberFact({required String number}) async {
  final _response =
      await http.get(Uri.parse('http://numbersapi.com/$number?json'));
final _bodyAsjason = jsonDecode(_response.body) as Map<String, dynamic>;
final _data = NumberFactResp.fromJson(_bodyAsjason);
return _data;
}
