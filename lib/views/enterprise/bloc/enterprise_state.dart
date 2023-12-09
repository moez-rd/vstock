part of 'enterprise_bloc.dart';

final class EnterpriseState extends Equatable {
  final Enterprise enterprise;

  const EnterpriseState({required this.enterprise});

  @override
  List<Object?> get props => [enterprise];
}
