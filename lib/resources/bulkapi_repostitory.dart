import 'package:go_india_stocks/models/bulkdeal_model.dart';
import 'package:go_india_stocks/resources/bulkapi_provider.dart';

class BulkApiRepository {
  final _bulkProvider =BulkApiProvider();

  Future<BulkdealModel> fetchBulkList() {
    return _bulkProvider.fetchBulkList();
  }
}
class NetworkError extends Error {}