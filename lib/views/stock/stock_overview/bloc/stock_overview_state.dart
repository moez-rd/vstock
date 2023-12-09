part of 'stock_overview_bloc.dart';

enum StockOverviewStatus { initial, loading, success, failure }

final class StockOverviewState extends Equatable {
  final List<Product> products;
  final StockOverviewStatus status;

  const StockOverviewState({
    this.products = const [],
    this.status = StockOverviewStatus.initial,
  });

  @override
  List<Object?> get props => [products];

  StockOverviewState copyWith({
    List<Product> Function()? products,
    StockOverviewStatus Function()? status,
  }) {
    return StockOverviewState(
      products: products != null ? products() : this.products,
      status: status != null ? status() : this.status,
    );
  }
}
