import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vstock/config/collections.dart';
import 'package:vstock/models/product.dart';

class ProductRepository {
  ProductRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firebaseFirestore;

  Future<List<Product>> getAllByEnterpriseId({
    required String enterpriseId,
  }) async {
    final ref = _firebaseFirestore
        .collection(Collection.products)
        .withConverter(
          fromFirestore: Product.fromFirestore,
          toFirestore: (Product product, _) => product.toFirestore(),
        )
        .where("enterprise_id", isEqualTo: enterpriseId);

    final docSnap = await ref.get();

    print("DALDASJD");
    print(docSnap.docs.length);

    return docSnap.docs.map((doc) => doc.data()).toList();
  }

  Future<Product> getById({required String id}) async {
    final ref = _firebaseFirestore
        .collection(Collection.products)
        .doc(id)
        .withConverter(
          fromFirestore: Product.fromFirestore,
          toFirestore: (Product product, _) => product.toFirestore(),
        );

    final docSnap = await ref.get();
    return Future.value(docSnap.data());
  }

  Future<void> store({required Product product}) async {
    final ref =
        _firebaseFirestore.collection(Collection.products).withConverter(
              fromFirestore: Product.fromFirestore,
              toFirestore: (Product product, _) => product.toFirestore(),
            );

    await ref.add(product);
  }

  Future<void> update({required String id, required Product product}) async {
    final ref = _firebaseFirestore
        .collection(Collection.products)
        .doc(id)
        .withConverter(
          fromFirestore: Product.fromFirestore,
          toFirestore: (Product enterprise, _) => product.toFirestore(),
        );

    await ref.update(product.toFirestore());
  }

  Future<void> delete({required String id}) async {
    final ref = _firebaseFirestore
        .collection(Collection.products)
        .doc(id)
        .withConverter(
          fromFirestore: Product.fromFirestore,
          toFirestore: (Product product, _) => product.toFirestore(),
        );

    await ref.delete();
  }
}
