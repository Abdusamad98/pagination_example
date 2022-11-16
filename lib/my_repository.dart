import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:pagination_example/models/my_order_model.dart';

const String BASE_URL = 'https://colibri24.uz';
const String streetToken = '''Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX25hbWUiOiI5OTg5OTUyMTQ4NjIiLCJzY29wZSI6WyJvcGVuaWQiXSwiZXhwIjoxNzAwMDY5NjM0LCJpYXQiOjE2Njg1MzM2MzQsImF1dGhvcml0aWVzIjpbIlJPTEVfQ0xJRU5UIl0sImp0aSI6Im1OQl9Tc3BUTjJfZVdicnZtQXRZZVdrOHhJMCIsImNsaWVudF9pZCI6IndlYl9hcHAifQ.b-iV1IbV9g0WhvaphuvLfNiJE_NN_5RC64Zf72o4PyArwPtX5R6hGc2ProXks3oPCKwm-L6_dYY7WAfSekZ6S-Hwcu1EeSoghmdjtI99-5y71RO-4TZ7clD10O9yGQwj9WBfgAzxu0jJuaoUG0lForVAHi3ngNR__ujMw6GhxzawdeZR7oPq4M3rg2Ic8aeJEWIXESDVUklp9DrWPeToVUU31ya0K1wKzqbmajeEeEmJWGu3E9dorsuYVLxAjA2hkbcIhTyz_D6lrPzHyAwkjPqSXscWdVAiDaXtjj4OX3aD8sJD2W55KE1A2_FMDMMYa_WKOdRcYETd0rT_VPuNrQ''';

class MyRepository {
  static Future<List<OrdersListItem>> getOrdersList(int size, int page) async {
    Dio dio = Dio();
    dio.options.headers["Accept"] = "application/json";
    dio.options.headers["Authorization"] = streetToken;

    final Response response = await dio
        .get('$BASE_URL/services/mobile/api/orders-pageList', queryParameters: {
      "page": page,
      "size": size,
    });

    debugPrint('page=$page&size=$size');
    debugPrint('${response.statusCode}');

    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      List<OrdersListItem> orders = (response.data as List)
          .map((data) => OrdersListItem.fromJson(data))
          .toList();
      return orders;
    } else {
      throw Exception();
    }
  }
}
