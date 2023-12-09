import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vstock/models/enterprise.dart';
import 'package:vstock/repositories/enterprise_repository.dart';

part 'enterprise_event.dart';
part 'enterprise_state.dart';

class EnterpriseCubit extends Bloc<EnterpriseEvent, EnterpriseState> {
  final EnterpriseRepository _enterpriseRepository;

  EnterpriseCubit(this._enterpriseRepository)
      : super(const EnterpriseState(enterprise: Enterprise()));
}
