import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vstock/viewmodels/app/app_bloc.dart';
import 'package:vstock/widgets/data_display_item.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<UserPage> {
  final Map<String, dynamic> store = {
    'name': 'Sania Fatimah',
    'username': 'example',
    'email': 'example@gmail.com'
  };

  @override
  Widget build(BuildContext context) {
    final user = context.select((AppBloc bloc) => bloc.state.user);

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
                    "Saya",
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
              DataDisplayItem(name: "Nama", value: user.name ?? ""),
              const SizedBox(height: 10),
              DataDisplayItem(name: "Email", value: user.email ?? ""),
              IconButton(
                key: const Key('homePage_logout_iconButton'),
                icon: const Icon(Icons.exit_to_app),
                onPressed: () {
                  context.read<AppBloc>().add(const AppLogoutRequested());
                },
              ),
            ],

          ),
        ),
      ],
    );
  }
}
