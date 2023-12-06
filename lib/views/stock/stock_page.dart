import 'package:flutter/material.dart';
import 'package:vstock/common/data/products.dart';
import 'package:vstock/views/history/history_detail_page.dart';

class StockPage extends StatelessWidget {
  const StockPage({super.key});

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
          IconButton(onPressed: () {}, icon: const Icon(Icons.add_circle_outline))
        ],
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: ListView.separated(
          itemCount: products.length,
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
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(products[index]['image'],
                        height: 40, width: 40, fit: BoxFit.cover),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 80,
                        child: Text(
                          products[index]['name'],
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                      Text(
                          "${products[index]['code']} | Rp${products[index]['price']}"),
                      Text("Stok: ${products[index]['stock']}")
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
