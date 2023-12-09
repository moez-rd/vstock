import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vstock/config/dependencies.dart';
import 'package:vstock/repositories/product_repository.dart';
import 'package:vstock/views/history/history_detail_page.dart';
import 'package:vstock/views/stock/stock_overview/bloc/stock_overview_bloc.dart';

class StockOverviewPage extends StatelessWidget {
  const StockOverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StockOverviewBloc(getIt<ProductRepository>())
        ..add(const StockOverviewRequested()),
      child: const StockOverviewView(),
    );
  }
}

class StockOverviewView extends StatelessWidget {
  const StockOverviewView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text(
          "Stok Barang",
        ),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.add_circle_outline))
        ],
      ),
      body: BlocBuilder<StockOverviewBloc, StockOverviewState>(
        builder: (context, state) {
          if (state.products.isEmpty) {
            if (state.status == StockOverviewStatus.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state.status == StockOverviewStatus.failure) {
              return const Center(
                child: Text("Terdapat kesalahan"),
              );
            } else {
              return const SizedBox();
            }
          }

          return Container(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: ListView.separated(
              itemCount: state.products.length,
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(thickness: 0.3);
              },
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HistoryDetailPage(),
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      // ClipRRect(
                      //   borderRadius: BorderRadius.circular(10),
                      //   child: Image.asset(state.products[index]['image'],
                      //       height: 40, width: 40, fit: BoxFit.cover),
                      // ),
                      const SizedBox(
                        width: 8,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width - 80,
                            child: Text(
                              state.products[index].name ?? '',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                          Text(
                              "${state.products[index].code} | Rp${state.products[index].price}"),
                          Text("Stok: ${state.products[index].initStock}")
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
