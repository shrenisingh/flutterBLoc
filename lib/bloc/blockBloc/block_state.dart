import 'package:equatable/equatable.dart';
import 'package:go_india_stocks/models/blockdeal_model.dart';


abstract class BlockState extends Equatable {
  const BlockState();
  @override
  List<Object?> get props => [];

}
class BlockInitial extends BlockState {}
class BlockLoading extends BlockState {}
class BlockLoaded extends BlockState {
  final BlockdealModel blockdealModel;
  const BlockLoaded(this.blockdealModel);
}
class BlockError extends BlockState {
  final String? message;
  const BlockError(this.message);
}