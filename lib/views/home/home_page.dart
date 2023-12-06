import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vstock/viewmodels/app/app_bloc.dart';
import 'package:vstock/views/stock/stock_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static Page<void> page() => const MaterialPage<void>(child: HomePage());

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentTab = 0;
  final List<Widget> screens = [];

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
          child: Stack(
            // mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [Profile()],
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
            ],
          ),
        ),
        const MenuWidget(),
      ],
    );
  }
}

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.select((AppBloc bloc) => bloc.state.user);
    print(user);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(
          Icons.person_outline,
          size: 24,
          color: Colors.white,
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              user.name ?? "",
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
                height: 0,
              ),
            ),
            const Text(
              "Owner",
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ],
    );
  }
}

class MenuWidget extends StatefulWidget {
  const MenuWidget({super.key});

  @override
  State<MenuWidget> createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  final List<String> menuNames = [
    "Stok",
    "Transaksi",
    "Laporan",
    "Staff",
  ];

  final List<IconData> menuIcons = [
    Icons.inventory,
    Icons.point_of_sale,
    Icons.summarize,
    Icons.group
  ];

  final List<Widget> pages = [
    StockPage(),
    StockPage(),
    StockPage(),
    StockPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      elevation: 1,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(34, 24, 34, 0),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Es Teh Nusantara",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
                Text(
                  "Jl. Hang Suro, Palembang",
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
          GridView.builder(
            itemCount: menuNames.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 30,
              mainAxisSpacing: 4,
              crossAxisCount: 3,
              childAspectRatio: 1.0,
            ),
            padding: const EdgeInsets.all(10),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return SizedBox(
                child: Material(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => pages[index],
                          ));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            menuIcons[index],
                            size: 30,
                            color: Colors.blue,
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            menuNames[index],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              height: 0,
                              fontSize: 12,
                              color: Color(0xff52525B),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
