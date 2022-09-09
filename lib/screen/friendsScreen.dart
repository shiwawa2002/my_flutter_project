import 'package:flutter/material.dart';
import 'package:my_little_pony/screen/fullImageScreen.dart';

class FriendsScreen extends StatefulWidget {
  const FriendsScreen({Key? key}) : super(key: key);

  @override
  State<FriendsScreen> createState() => FriendsScreenState();
}

class FriendsScreenState extends State<FriendsScreen> {
  List<CardItem> items = [
    CardItem(
        urlImage:
        'https://static.wikia.nocookie.net/p__/images/6/6a/Fluttershy_Vector.png/revision/latest?cb=20170331104123&path-prefix=protagonist',
        name: 'Fluttershy'),
    CardItem(
        urlImage:
        'https://i.pinimg.com/originals/a6/9d/29/a69d29c25adcdda79e2fffb9f8dcce14.png',
        name: 'Pinkie Pie'),
    CardItem(
        urlImage:
        'https://static.wikia.nocookie.net/p__/images/7/74/Princess_Celestia-0.png/revision/latest?cb=20160917195701&path-prefix=protagonist',
        name: 'Princess Celestia'),
    CardItem(
        urlImage:
        'https://static.wikia.nocookie.net/mlpfanart/images/5/55/Rarity_vector_by_HelgiH.png/revision/latest?cb=20111008165948',
        name: 'Rarity'),
    CardItem(
        urlImage:
        'https://static.wikia.nocookie.net/mylittlebrony/images/1/1a/Applejack_vector_by_hombre0-d4a3lwt.png/revision/latest?cb=20130504145532',
        name: 'Applejack'),
    CardItem(
        urlImage:
        'https://i.pinimg.com/originals/ae/67/3f/ae673f288b3ce23fb31b0687d12d17bf.png',
        name: 'Rainbow Dash'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Hello My Friends')),
        body: Container(
          height: 250,
          child: ListView.separated(
            padding: EdgeInsets.all(10),
            scrollDirection: Axis.horizontal,
            itemCount: 6,
            separatorBuilder: (context, _) => SizedBox(width: 12),
            itemBuilder: (context, index) => buildCard(item: items[index]),
          ),
        ));
  }

  Widget buildCard({required CardItem item}) => Container(
      width: 200,
      color: Colors.cyan,
      child: Column(
        children: [
          Expanded(
              child: Material(
                child: Ink.image(
                  image: NetworkImage(item.urlImage),
                  fit: BoxFit.cover,
                  child: InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FullImageScreen(item: item),
                        )),
                  ),
                ),
              )),
          const SizedBox(height: 4),
          Text(
            item.name,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          )
        ],
      ));
}

class CardItem {
  final String urlImage;
  final String name;

  const CardItem({required this.urlImage, required this.name});
}
