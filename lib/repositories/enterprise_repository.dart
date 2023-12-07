import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vstock/config/collections.dart';
import 'package:vstock/models/enterprise.dart';

class EnterpriseRepository {
  EnterpriseRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firebaseFirestore;

  Future<void> store({required Enterprise enterprise}) async {}

  Future<Enterprise> getById({required String id}) async {
    final ref = _firebaseFirestore
        .collection(Collection.enterprises)
        .doc(id)
        .withConverter(
          fromFirestore: Enterprise.fromFirestore,
          toFirestore: (Enterprise enterprise, _) => enterprise.toFirestore(),
        );

    final docSnap = await ref.get();
    return Future.value(docSnap.data());
  }

  Future<void> update({
    required String id,
    required Enterprise enterprise,
  }) async {
    final ref = _firebaseFirestore
        .collection(Collection.enterprises)
        .doc(id)
        .withConverter(
          fromFirestore: Enterprise.fromFirestore,
          toFirestore: (Enterprise enterprise, _) => enterprise.toFirestore(),
        );

    await ref.update(enterprise.toFirestore());
  }
}
