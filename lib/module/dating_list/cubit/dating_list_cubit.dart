import 'package:bloc/bloc.dart';
import 'package:dating_list/module/dating_list/model/dating_list_response.dart';
import '../../../../core/exceptions/api_error.dart';
import '../repository/dating_repository.dart';
import 'dating_list_state.dart';

class DatingListCubit extends Cubit<DatingListState> {
  final DatingRepository _datingRepository;

  DatingListCubit({
    required DatingRepository rideRepository,
  })  : _datingRepository = rideRepository,
        super(DatingListState.initial());

  List<Result> datingList = [];
  int _page = 1;

  void resetPage() {
    _page = 1;
    datingList = [];
  }

  Future<void> fetchDatingList({
    bool loadMore = false,
    bool loading = true,
  }) async {
    emit(state.copyWith(status: DatingListStatus.loading));
    if (loading) {
      emit(state.copyWith(
          status:
              loadMore ? DatingListStatus.loadMore : DatingListStatus.loading));
    }
    if (!loadMore) {
      resetPage();
    }
    try {
      DatingResponse response =
          await _datingRepository.fetchDatingList(_page, 10);
      if (response.results.isNotEmpty) {
        datingList.addAll(response.results);
        _page++;
        emit(state.copyWith(
            status: DatingListStatus.success, message: '', result: datingList));
      } else {
        print('No more data');
        emit(state.copyWith(
            status: DatingListStatus.success,
            message: state.message,
            result: datingList));
      }
    } on ApiError catch (e) {
      emit(state.copyWith(
          status: DatingListStatus.error, message: "${e.message}"));
    }
  }
}
