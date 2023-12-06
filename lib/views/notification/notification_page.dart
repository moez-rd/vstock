import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vstock/views/history/history_detail_page.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 140,
          padding: const EdgeInsets.all(14),
          decoration: const BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(10),
            ),
          ),
          child: Stack(children: [
            const Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "Riwayat",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  height: 0,
                ),
              ),
            ),
            Align(
              alignment: const Alignment(1, -0.4),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications,
                  size: 26,
                  color: Colors.white,
                ),
              ),
            )
          ]),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(color: Colors.blue.shade50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  showModalBottomSheet(
                    showDragHandle: true,
                    context: context,
                    builder: (context) {
                      return const Center(child: Text("Hwllo Eowls"));
                    },
                  );
                },
                child: const Row(
                  children: [Text("Filter"), Icon(Icons.filter_alt)],
                ),
              )
            ],
          ),
        ),
        const HistoryList(),
      ],
    );
  }
}

class HistoryList extends StatefulWidget {
  const HistoryList({super.key});

  @override
  State<HistoryList> createState() => _HistoryListState();
}

class _HistoryListState extends State<HistoryList> {
  final List<Map<String, dynamic>> histories = [
    {
      'items': ['Original Tea', 'Peach Tea', 'Lemon Tea'],
      'type': 'Transaksi penjualan',
      'status': 'out',
      'date': DateTime.parse('2023-07-20 20:18:04Z')
    },
    {
      'items': ['Peach Tea'],
      'type': 'Masuk',
      'status': 'in',
      'date': DateTime.parse('2023-07-20 20:18:04Z')
    },
    {
      'items': ['Original Tea', 'Peach Tea', 'Lemon Tea'],
      'type': 'Transaksi penjualan',
      'status': 'out',
      'date': DateTime.parse('2023-07-20 20:18:04Z')
    },
    {
      'items': ['Peach Tea'],
      'type': 'Masuk',
      'status': 'in',
      'date': DateTime.parse('2023-07-20 20:18:04Z')
    },
    {
      'items': ['Peach Tea'],
      'type': 'Masuk',
      'status': 'in',
      'date': DateTime.parse('2023-07-20 20:18:04Z')
    },
    {
      'items': ['Peach Tea'],
      'type': 'Masuk',
      'status': 'in',
      'date': DateTime.parse('2023-07-20 20:18:04Z')
    },
    {
      'items': ['Original Tea', 'Peach Tea', 'Lemon Tea'],
      'type': 'Transaksi penjualan',
      'status': 'out',
      'date': DateTime.parse('2023-07-20 20:18:04Z')
    },
    {
      'items': ['Original Tea', 'Peach Tea', 'Lemon Tea'],
      'type': 'Transaksi penjualan',
      'status': 'out',
      'date': DateTime.parse('2023-07-20 20:18:04Z')
    },
    {
      'items': ['Original Tea', 'Peach Tea', 'Lemon Tea'],
      'type': 'Transaksi penjualan',
      'status': 'out',
      'date': DateTime.parse('2023-07-20 20:18:04Z')
    },
    {
      'items': ['Original Tea', 'Peach Tea', 'Lemon Tea'],
      'type': 'Transaksi penjualan',
      'status': 'out',
      'date': DateTime.parse('2023-07-20 20:18:04Z')
    },
    {
      'items': ['Original Tea', 'Peach Tea', 'Lemon Tea'],
      'type': 'Transaksi penjualan',
      'status': 'out',
      'date': DateTime.parse('2023-07-20 20:18:04Z')
    }
  ];

  Icon getIcon(String name) {
    switch (name) {
      case 'out':
        return const Icon(
          Icons.call_made,
          size: 34,
          color: Colors.red,
        );
      case 'in':
        return const Icon(
          Icons.call_received,
          size: 34,
          color: Colors.green,
        );
    }

    return const Icon(
      Icons.minimize,
      size: 34,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView.separated(
          itemCount: histories.length,
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
                  getIcon(histories[index]['status']),
                  const SizedBox(
                    width: 4,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 80,
                        child: Text(
                          histories[index]['items'].join(', '),
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                      Text(histories[index]['type']),
                      Text(DateFormat('dd MMM yyy hh:mm')
                          .format(histories[index]['date']))
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
