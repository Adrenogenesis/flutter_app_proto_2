import 'package:flutter/material.dart';
import 'fetch.dart';
import 'menu.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(Home());
}

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        buttonColor: Colors.blue,
      ),
      home: MyHomePage(),
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/primary': (context) => FirstScreen(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/second': (context) => SecondScreen(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(

        title: Text('Protonwebmaster'),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.web,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyAppX()),
              );
            },
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Icon(Icons.search),
          ),
          IconButton(
            icon: const Icon(
              Icons.more_vert,
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/second');
            },
          ),
        ],
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView(
        children: [
          new UserAccountsDrawerHeader(
            accountName: new Text("Activateur France Num"),
            accountEmail: null,
            decoration: new BoxDecoration(
                image: new DecorationImage(
                    fit: BoxFit.fill,
                    image: new NetworkImage("https://dev.fredericbrodar.com/assets/img/protonweb.jpg")
                )
            ),
          ),
          new ListTile(
            title: new Text("Produits"),
            trailing: new Icon(Icons.arrow_upward),
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyAppX()),
              );
            },
          ),
          Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.arrow_drop_down_circle),
                  title: const Text('Card title 2'),
                  subtitle: Text(
                    'Secondary Text',
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Greyhound divisively hello coldly wonderfully marginally far upon excluding.',
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.start,
                  children: [
                    FlatButton(
                      textColor: const Color(0xFF6200EE),
                      onPressed: () {
                        // Perform some action
                      },
                      child: const Text('ACTION 1'),
                    ),
                    FlatButton(
                      textColor: const Color(0xFF6200EE),
                      onPressed: () {
                        // Perform some action
                      },
                      child: const Text('ACTION 2'),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: _launchURL,
                  child: Image.asset('assets/logo2.png'),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

_launchURL() async {
  const url = 'https://flutter.io';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Launch screen'),
          onPressed: () {
            // Navigate to the second screen when tapped.
          },
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate back to first screen when tapped.
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}

