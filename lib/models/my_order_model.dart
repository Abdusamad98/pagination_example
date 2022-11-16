
class OrdersListItem {
  int id;

  int brandId;

  String brandName;

  String brandImageUrl;

  int branchId;

  String branchName;

  String branchImageUrl;

  int orderNumber;

  String orderDate;

  double orderPrice;

  int paymentType;

  int paymentStatus;

  String courierName;

  String comment;

  int orderStatus;

  int productCount;

  OrdersListItem({
    required this.brandId,
    required this.branchId,
    required this.comment,
    required this.paymentType,
    required this.branchName,
    required this.id,
    required this.orderPrice,
    required this.orderDate,
    required this.orderStatus,
    required this.paymentStatus,
    required this.brandName,
    required this.brandImageUrl,
    required this.courierName,
    required this.branchImageUrl,
    required this.orderNumber,
    required this.productCount,
  });

  factory OrdersListItem.fromJson(Map<String, dynamic> json) {
    return OrdersListItem(
      brandId: json['brandId'] as int? ?? 0,
      branchId: json['branchId'] as int? ?? 0,
      comment: json['comment'] as String? ?? '',
      paymentType: json['paymentType'] as int? ?? 0,
      branchName: json['branchName'] as String? ?? '',
      id: json['id'] as int? ?? 0,
      orderPrice: (json['orderPrice'] as num?)?.toDouble() ?? 0.0,
      orderDate: json['orderDate'] as String? ?? '',
      orderStatus: json['orderStatus'] as int? ?? 0,
      paymentStatus: json['paymentStatus'] as int? ?? 0,
      brandName: json['brandName'] as String? ?? '',
      brandImageUrl: json['brandImageUrl'] as String? ?? '',
      courierName: json['courierName'] as String? ?? '',
      branchImageUrl: json['branchImageUrl'] as String? ?? '',
      orderNumber: json['orderNumber'] as int? ?? 0,
      productCount: json['productCount'] as int? ?? 0,
    );
  }
}