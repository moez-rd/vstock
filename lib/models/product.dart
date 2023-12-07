import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

enum ProductType { drink, food }

class Product extends Equatable {
  final String? name;
  final ProductType? type;
  final String? code;
  final int? initStock;
  final DateTime? expiredDate;
  final int? price;
  final String? enterpriseId;

  const Product({
    this.name,
    this.type,
    this.code,
    this.initStock,
    this.expiredDate,
    this.price,
    this.enterpriseId,
  });

  static const empty = Product();

  bool get isEmpty => this == Product.empty;

  bool get isNotEmpty => this != Product.empty;

  @override
  List<Object?> get props =>
      [name, type, code, initStock, expiredDate, price, enterpriseId];

  factory Product.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return Product(
      name: data?['name'],
      type: ProductType.values.byName(data?['type']),
      code: data?['code'],
      initStock: data?['init_stock'],
      expiredDate: data?['expired_date'].toDate(),
      price: data?['price'],
      enterpriseId: data?['enterprise_id'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (name != null) "name": name,
      if (type != null) "type": type.toString().split(".")[1],
      if (code != null) "code": code,
      if (initStock != null) "init_stock": initStock,
      if (expiredDate != null) "expired_date": expiredDate,
      if (price != null) "price": price,
      if (enterpriseId != null) "enterprise_id": enterpriseId,
    };
  }
}
