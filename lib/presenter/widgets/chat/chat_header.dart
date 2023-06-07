import 'package:flutter/material.dart';

class ChatHeader extends StatelessWidget implements PreferredSizeWidget {
  const ChatHeader({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(10),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                "https://www.lavanguardia.com/peliculas-series/images/profile/1963/6/w300/aDDn9kF809MMCIXGQ7Cl0crW7Zj.jpg"),
          ),
        ),
        title: SizedBox(
          width: screenWidth,
          child: const Text("Pepe viyuela"),
        ));
  }
}
