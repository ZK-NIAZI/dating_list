import 'package:dio/dio.dart';

import '../../../constants/api_endpoints.dart';
import '../../../core/exceptions/api_error.dart';
import '../../../core/network/dio_client.dart';
import '../../../utils/logger/logger.dart';
import '../model/dating_list_response.dart';

class DatingRepository {
  final DioClient _dioClient;

  final _log = logger(DatingRepository);

  DatingRepository({
    required DioClient dioClient,
  }) : _dioClient = dioClient;

  Future<DatingResponse> fetchDatingList(int page,int perPage) async {
    try {
      var response =
      await _dioClient.get(Endpoints.fetchList, queryParameters: {
        'page': page,
        'results': perPage,
      });

      DatingResponse datingResponse =
      DatingResponse.fromJson(response.data);
      if (datingResponse.results.isNotEmpty) {
        return datingResponse;
      } else {
        throw "Data Not Found";
      }
    } on DioException catch (e, stackTrace) {
      _log.e(e, stackTrace: stackTrace);
      throw ApiError.fromDioException(e);
    } on TypeError catch (e) {
      _log.e(e.stackTrace);
      throw ApiError(message: '$e', code: 0);
    } catch (e) {
      _log.e(e);
      throw ApiError(message: 'try fail : $e', code: 0);
    }
  }
}
