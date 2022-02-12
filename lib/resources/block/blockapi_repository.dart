

import 'package:go_india_stocks/models/blockdeal_model.dart';
import 'package:go_india_stocks/resources/block/blockapi_provider.dart';

class BlockApiRepository {
  final _blockProvider =BlockApiProvider();

  Future<BlockdealModel> fetchBlockList() {
    return _blockProvider.fetchBlockList();
  }
}
class NetworkError extends Error {}