import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vstock/widgets/data_display_item.dart';

class HistoryDetailPage extends StatefulWidget {
  const HistoryDetailPage({super.key});

  @override
  State<HistoryDetailPage> createState() => _HistoryDetailScreenState();
}

class _HistoryDetailScreenState extends State<HistoryDetailPage> {
  final Map<String, dynamic> historyDetail = {
    'items': [
      {'name': 'Original Tea', 'code': '#E2W1', 'amount': 2},
      {'name': 'Thai Tea', 'code': '#E2W1', 'amount': 1},
      {'name': 'Peach Tea', 'code': '#E2W1', 'amount': 1},
    ],
    'type': 'Transaksi penjualan',
    'stockBefore': 192,
    'stockAfter': 188,
    'date': DateTime.parse('2023-07-20 20:18:04Z'),
    'status': 'out'
  };

  Icon getIcon(String name) {
    switch (name) {
      case 'out':
        return const Icon(
          Icons.call_made,
          size: 20,
          color: Colors.red,
        );
      case 'in':
        return const Icon(
          Icons.call_received,
          size: 20,
          color: Colors.green,
        );
    }

    return const Icon(
      Icons.minimize,
      size: 20,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Text("Peach Tea"),
            const SizedBox(width: 2),
            getIcon(historyDetail['status']),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Barang',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Colors.blue),
              ),
              DataTable(
                headingRowHeight: 24,
                horizontalMargin: 0,
                dividerThickness: 0.3,
                columns: const <DataColumn>[
                  DataColumn(
                    label: Expanded(
                      child: Text(
                        "Nama",
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Expanded(
                      child: Text(
                        "Kode",
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Expanded(
                      child: Text(
                        "Jumlah",
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ],
                rows: List<DataRow>.generate(
                  historyDetail['items'].length,
                  (index) => DataRow(
                    cells: <DataCell>[
                      DataCell(Text(historyDetail['items'][index]['name'])),
                      DataCell(Text(historyDetail['items'][index]['code'])),
                      DataCell(
                        Text(
                          historyDetail['items'][index]['amount'].toString(),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 10),
          DataDisplayItem(
            name: "Tanggal",
            value:
                DateFormat('dd MMMM yyy hh:mm').format(historyDetail['date']),
          ),
          const SizedBox(height: 10),
          DataDisplayItem(
            name: "Jenis",
            value: historyDetail['type'].toString(),
          ),
          const SizedBox(height: 10),
          DataDisplayItem(
            name: "Stok sebelumnya",
            value: historyDetail['stockBefore'].toString(),
          ),
          const SizedBox(height: 10),
          DataDisplayItem(
            name: "Stok setelahnya",
            value: historyDetail['stockAfter'].toString(),
          )
        ],
      ),
    );
  }
}
