import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

/*
Add dark-mode switching functionality to a simple Flutter App.

The App only needs to contain a single button, as well as an image with 2 possible source urls
- `https://media.istockphoto.com/vectors/cute-flat-sun-icon-vector-id1124567572?k=20&m=1124567572&s=612x612&w=0&h=qA2-ugQviG9uGvpn5-K90sK9w5QZjd3TetULc_5VECc=` or
- `https://www.kindpng.com/picc/m/87-870069_half-moon-clipart-outhouse-moon-clip-art-hd.png`

The button colour should also toggle between black and white.
*/

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Flutter - Themes',
          style: TextStyle(color: isDark ? Colors.white : Colors.black),
        ),
        backgroundColor: isDark ? Colors.black : Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 150,
                width: 150,
                child: Image.network(isDark
                    ? "https://www.kindpng.com/picc/m/87-870069_half-moon-clipart-outhouse-moon-clip-art-hd.png"
                    : "https://image.shutterstock.com/image-vector/sun-icon-vector-jpg-jpeg-260nw-414560848.jpg"),
              ),
              Padding(
                padding: EdgeInsets.only(top: 50),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isDark = !isDark;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: isDark ? Colors.black : Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 20,
                            color: Colors.black12,
                            spreadRadius: 12)
                      ],
                    ),
                    width: MediaQuery.of(context).size.width * .40,
                    height: 30,
                    child: Center(
                        child: Text(
                      isDark ? "Light Mode" : "Dark Mode",
                      style: TextStyle(
                        color: isDark ? Colors.white : Colors.black,
                      ),
                    )),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
