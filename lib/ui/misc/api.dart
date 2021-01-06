import 'package:dio/dio.dart';
import 'package:riverpod_examples/ui/misc/to-do.dart';

class Api {
  Dio _dio;
  Api() {
    _dio = Dio();
  }

  Future<TodoItem> getData() async {
    try {
      final response =
          await _dio.get('https://jsonplaceholder.typicode.com/todos/1');
      final res = TodoItem.fromJson(response.data);
      return res;
    } on DioError catch (e) {
      print(e.error);
      throw e.error;
    }
  }
}
