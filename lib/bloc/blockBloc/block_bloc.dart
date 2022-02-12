
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_india_stocks/bloc/blockBloc/block_event.dart';
import 'package:go_india_stocks/bloc/blockBloc/block_state.dart';
import 'package:go_india_stocks/resources/block/blockapi_repository.dart';


class BlockBloc extends Bloc<BlockEvent, BlockState>{
  BlockBloc() : super(BlockInitial()){
    final BlockApiRepository _blockapiRepository = BlockApiRepository();
    on<GetBlockList>((event,emit) async {
try{
  emit(BlockLoading());
  final mList= await _blockapiRepository.fetchBlockList();
  emit(BlockLoaded(mList));
  if(mList.blockerror !=null){
    emit(BlockError(mList.blockerror));
  }
} on NetworkError{
  emit(BlockError("Failed tto fetch data. Please check Internet Connection."));
}

    });
  }

  where(bool Function(dynamic elem) param0) {}
  


}

