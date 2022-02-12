import 'package:dio/dio.dart';
import 'package:go_india_stocks/models/blockdeal_model.dart';


class BlockApiProvider{
  final Dio _dio =Dio();
  final String _url = 'https://www.goindiastocks.com/api/service/GetBulkBlockDeal?fincode=100114&DealType=Block_Deal';

  Future<BlockdealModel> fetchBlockList() async {
    try{
      Response response = await _dio.get(_url);
      return BlockdealModel.fromJson(response.data);
    }catch (error, stacktrace){
      print("Exception occured : $error stackTrace: $stacktrace");
      return BlockdealModel.withError('Data not found / Connection issue');
    }
  }
}

 