import 'package:flutter/material.dart';
import 'package:vstock/widgets/data_display_item.dart';

class EnterprisePage extends StatefulWidget {
  const EnterprisePage({super.key});

  @override
  State<EnterprisePage> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<EnterprisePage> {
  final Map<String, dynamic> store = {
    'name': 'Es Teh Nusantara',
    'address': 'Jl. Hang Suro Palembang'
  };

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
              child: Row(
                children: [
                  Text(
                    "Usaha",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      height: 0,
                    ),
                  ),
                ],
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
                onPressed: () {},
                child: const Row(
                  children: [
                    Text("Edit"),
                    SizedBox(
                      width: 4,
                    ),
                    Icon(
                      Icons.edit,
                      size: 20,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              DataDisplayItem(name: "Nama usaha", value: store['name']),
              const SizedBox(height: 10),
              DataDisplayItem(name: "Alamat", value: store['address']),
            ],
          ),
        ),
      ],
    );
  }
}
