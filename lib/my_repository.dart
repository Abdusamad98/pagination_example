import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:pagination_example/models/my_order_model.dart';

const String BASE_URL = 'https://colibri24.uz';
const String streetToken = "TOKEN";

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
