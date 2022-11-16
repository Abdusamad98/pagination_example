part of 'pagination_cubit.dart';

abstract class PaginationState {}

class InitialState extends PaginationState {}

class LoadInProgress extends PaginationState {}

class LoadInSuccess extends PaginationState {
  final List<OrdersListItem> orders;

  LoadInSuccess({
    required this.orders,
  });
}

class LoadInFailure extends PaginationState {}

// class PaginationState extends Equatable {
//   final List<OrdersListItem> orders;
//   final bool isFinished;
//
//   PaginationState({
//     required this.orders,
//     required this.isFinished,
//   });
//
//   PaginationState copyWith({
//     List<OrdersListItem>? orders,
//     bool? isFinished,
//   }) =>
//       PaginationState(
//         orders: orders ?? this.orders,
//         isFinished: isFinished ?? this.isFinished,
//       );
//
//   @override
//   List<Object> get props => [
//         orders,
//         isFinished,
//       ];
// }
