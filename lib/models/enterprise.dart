import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Enterprise extends Equatable {
  final String? name;
  final String? address;

  const Enterprise({
    this.name,
    this.address,
  });

  static const empty = Enterprise();

  bool get isEmpty => this == Enterprise.empty;

  bool get isNotEmpty => this != Enterprise.empty;

  @override
  List<Object?> get props => [name, address];

  factory Enterprise.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return Enterprise(
      name: data?['name'],
      address: data?['address'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (name != null) "name": name,
      if (address != null) "address": address,
    };
  }
}
