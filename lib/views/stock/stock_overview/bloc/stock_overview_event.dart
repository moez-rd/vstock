part of 'stock_overview_bloc.dart';

sealed class StockOverviewEvent extends Equatable {
  const StockOverviewEvent();

  @override
  List<Object?> get props => [];
}

class StockOverviewRequested extends StockOverviewEvent {
  const StockOverviewRequested();
}
