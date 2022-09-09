import 'package:flutter/material.dart';
import 'package:my_little_pony/screen/friendsScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My App",
      home: MyHomePage(),
      theme: ThemeData(primarySwatch: Colors.purple),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Hello Flutter อิอิ')),
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'สวัสดีชาวโลกทุกท่าน',
                  style: TextStyle(fontSize: 20, color: Colors.purple),
                ),
                Text(
                  'เรามีชื่อว่า Twilight Sparkle มาจากโลกโพนี่',
                  style: TextStyle(fontSize: 20, color: Colors.purple),
                ),
                Image(
                    image: NetworkImage(
                        'https://i.pinimg.com/originals/d7/f4/0d/d7f40deaee319c3e20a76b05eacda682.png')),
                Text(
                  'กดเพื่อไปพบกับเพื่อนๆ ของฉันได้เลย',
                  style: TextStyle(fontSize: 20, color: Colors.purple),
                ),
                FloatingActionButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => FriendsScreen()));
                  },
                  child: Icon(Icons.arrow_forward_sharp),
                )
              ],
            )));
  }
}
