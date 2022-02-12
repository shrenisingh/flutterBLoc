import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:go_india_stocks/models/bulkdeal_model.dart';

class BulkApiProvider {
  final Dio _dio = Dio();
  final String _url =
      'https://www.goindiastocks.com/api/service/GetBulkBlockDeal?fincode=100114&DealType=Bulk_Deal';

  Future<BulkdealModel> fetchBulkList() async {
    try {
      Response response = await _dio.get(_url);
      print(response.data.toString());

      return BulkdealModel.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured : $error stackTrace: $stacktrace");
      return BulkdealModel.withError('Data not found / Connection issue');
    }
  }
}
