import 'package:adoptapet/feature/meet/domain/entity/meet_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/constants/api_endpoints.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/networking/remote/http_service.dart';
import '../../../../core/shared_prefs/user_shared_prefs.dart';

final meetRemoteDataSourceProvider = Provider(
      (ref) => MeetRemoteDataSource(
    dio: ref.read(httpServiceProvider),
    userSharedPrefs: ref.read(userSharedPrefsProvider),
  ),
);
class MeetRemoteDataSource{
  final Dio dio;
  final UserSharedPrefs userSharedPrefs;
  MeetRemoteDataSource({required this.dio, required this.userSharedPrefs});

  Future<Either<Failure,bool>> scheduleMeet(MeetEntity meet) async{
    try{
      String? token;
      var data = await userSharedPrefs.getUserToken();
      data.fold(
            (l) => token = null,
            (r) => token = r!,
      );

      if (token == null) {
        return Left(Failure(statusCode: '0', error: 'Token null'));
      }
      Response response = await dio.post(
          ApiEndpoints.meet,
          data: {
            "scheduledDate" : meet.scheduledDate,
            "pickupTime": meet.pickupTime,
            "pet": meet.petId,
          },
          options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      if(response.statusCode == 200){
        return const Right(true);
      }else{
        return Left(
            Failure(
                error: response.data["message"],
                statusCode: response.statusCode.toString()
            )
        );
      }
    }on DioException catch(e){
      return Left(
          Failure(
            error: e.error.toString(),
            statusCode: e.response?.statusCode.toString()??'0',
          )
      );
    }
  }
}