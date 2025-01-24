import '../model/dating_list_response.dart';

enum DatingListStatus {
  initial,
  loading,
  success,
  error,
  loadMore
}

class DatingListState {
  final DatingListStatus status;
  final String message;
  final List<Result> result;

  DatingListState(
      {required this.status, required this.message, required this.result});

  factory DatingListState.initial() {
    return DatingListState(
        status: DatingListStatus.initial, message: '', result: []);
  }

  DatingListState copyWith(
      {DatingListStatus? status,
        String? message,
        List<Result>? result}) {
    return DatingListState(
        status: status ?? this.status,
        message: message ?? this.message,
        result: result ?? this.result);
  }
}
