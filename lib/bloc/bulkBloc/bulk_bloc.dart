
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_india_stocks/bloc/bulkBloc/bulk_event.dart';
import 'package:go_india_stocks/bloc/bulkBloc/bulk_state.dart';
import 'package:go_india_stocks/resources/bulkapi_repostitory.dart';

class BulkBloc extends Bloc<BulkEvent, BulkState>{
  BulkBloc() : super(BulkInitial()){
    final BulkApiRepository _bulkapiRepository = BulkApiRepository();
    on<GetBulkList>((event,emit) async {
try{
  emit(BulkLoading());
  final mList= await _bulkapiRepository.fetchBulkList();
  emit(BulkLoaded(mList));
  if(mList.bulkerror !=null){
    emit(BulkError(mList.bulkerror));
  }
} on NetworkError{
  emit(BulkError("Failed tto fetch data. Please check Internet Connection."));
}

    });
  }

  where(bool Function(dynamic elem) param0) {}
  


}

