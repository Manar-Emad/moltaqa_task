import 'package:dio/dio.dart';
import 'package:moltaqa_task/shared/network/end_points.dart';

class DioHelper{
  static Dio? dio;

  static init()
  {
    dio=Dio(
      BaseOptions(
        baseUrl:ApiConstants.baseUrl,
        receiveDataWhenStatusError: true,
        // headers: {'Content-Type':'application/json',}
        // headers: {
        //   'Content-Type':'application/json',
        //   'lang':'en',
        // },
      ),
    );
  }



  ///POST DATA
  static Future<Response> postDataForm(
      {required url , Map< String , dynamic>? query,
        required Map< String , dynamic>? data ,
      } ) async
  {
    print('before header');
    dio?.options.headers= {
      'Accept':'application/json',
      'Content-Type': 'application/json',
    };
    print('after header');
    var formData = FormData.fromMap(data!);
    print('formdata====${formData.toString()}');
    return await dio!.post( url , data:data);
  }
// ///GET DATA
// static Future<Response> getData(
//     {required  url ,  Map< String , dynamic> ?query,
//       String? token,} ) async
// {
//   dio?.options.headers= {
//     'Accept':'application/json',
//   };
//   return await dio!.get( url ,queryParameters: query,);
// }
//
// ///POST DATA
// static Future<Response> postData(
//     {required  url , Map< String , dynamic>? query,
//       required Map< String , dynamic>? data ,
//     } ) async
// {
//   dio?.options.headers= {
//     'Accept':'application/json',
//   };
//   return await dio!.post( url ,queryParameters: query,data:data);
// }
}

