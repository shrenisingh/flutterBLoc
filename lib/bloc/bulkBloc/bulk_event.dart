import 'package:equatable/equatable.dart';

abstract class BulkEvent extends Equatable{
  const BulkEvent();
  List<Object> get props => [];

}
class GetBulkList extends BulkEvent {}