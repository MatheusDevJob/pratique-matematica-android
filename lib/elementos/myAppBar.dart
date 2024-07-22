import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String titulo;
  const MyAppBar({super.key, required this.titulo});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Title(
        color: Colors.white,
        child: Text(
          titulo,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 128, 5, 159),
    );
  }
}
