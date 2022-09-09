import 'package:flutter/material.dart';
import 'friendsScreen.dart';

class FullImageScreen extends StatelessWidget {
  final CardItem item;

  const FullImageScreen({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(title: Text(item.name)),
      body: Column(children: [
        AspectRatio(
          aspectRatio: 4 / 4,
          child: Image.network(
            item.urlImage,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 8)
      ]));
}
