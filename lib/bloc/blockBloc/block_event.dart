import 'package:equatable/equatable.dart';

abstract class BlockEvent extends Equatable{
  const BlockEvent();
  List<Object> get props => [];

}
class GetBlockList extends BlockEvent {}