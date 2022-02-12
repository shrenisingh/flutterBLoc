import 'package:equatable/equatable.dart';
import 'package:go_india_stocks/models/bulkdeal_model.dart';

abstract class BulkState extends Equatable {
  const BulkState();
  @override
  List<Object?> get props => [];

}
class BulkInitial extends BulkState {}
class BulkLoading extends BulkState {}
class BulkLoaded extends BulkState {
  final BulkdealModel bulkdealModel;
  const BulkLoaded(this.bulkdealModel);
}
class BulkError extends BulkState {
  final String? message;
  const BulkError(this.message);
}