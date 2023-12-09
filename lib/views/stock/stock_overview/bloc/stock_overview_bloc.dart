import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vstock/models/product.dart';
import 'package:vstock/repositories/product_repository.dart';

part 'stock_overview_event.dart';
part 'stock_overview_state.dart';

class StockOverviewBloc extends Bloc<StockOverviewEvent, StockOverviewState> {
  final ProductRepository _productRepository;

  StockOverviewBloc(this._productRepository)
      : super(StockOverviewState(products: List<Product>.empty())) {
    on<StockOverviewRequested>(_onStockOverviewRequested);
  }

  Future<void> _onStockOverviewRequested(
    StockOverviewRequested event,
    Emitter<StockOverviewState> emit,
  ) async {
    emit(state.copyWith(status: () => StockOverviewStatus.loading));

    try {
      List<Product> products = await _productRepository.getAllByEnterpriseId(
          enterpriseId: "ZdgaJACfnrjchcW9fim7");
      emit(state.copyWith(
        status: () => StockOverviewStatus.success,
        products: () => products,
      ));
    } on Exception catch (e) {
      emit(state.copyWith(status: () => StockOverviewStatus.failure));
    }
  }
}
