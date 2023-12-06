import 'package:equatable/equatable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

enum UserRole { owner, staff }

class User extends Equatable {
  final String? email;
  final String? name;
  final UserRole? role;
  final String? enterpriseId;

  const User({this.email, this.name, this.role, this.enterpriseId});

  static const empty = User();

  bool get isEmpty => this == User.empty;

  bool get isNotEmpty => this != User.empty;

  @override
  List<Object?> get props => [email, name, role, enterpriseId];

  factory User.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return User(
        name: data?['name'],
        email: data?['email'],
        role: UserRole.values.byName(data?['role']),
        enterpriseId: data?['enterprise_id']);
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (name != null) "": name,
      if (email != null) "": email,
      if (role != null) "": role.toString(),
      if (enterpriseId != null) "": enterpriseId,
    };
  }
}
