import 'package:flutter/material.dart';
import 'package:my_app/SeconPage.dart';
import 'package:my_app/user.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          // leading: Image.asset(
          //   'images/profile.webp',
          //   width: 20,
          //   height: 20,
          //   fit: BoxFit.cover,
          // ),
          title: const Text("ian app"),
        ),
        body: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      // mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      // mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(
          height: 20,
        ),
        ProfileRow(),
        SizedBox(
          height: 20,
        ),
        MySearchBar(),
        MyHorizontal(),
        // Container(

        //   child: Text("Top babysitters"),
        // ),

        Row(children: [
          SizedBox(
            width: 20,
          ),
          Text(
            "Top babysitters",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          )
        ]),

        SizedBox(
          height: 20,
        ),
        MyUsers(),
        //MylistView()
      ],
    );
  }
}

class ProfileRow extends StatelessWidget {
  const ProfileRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        SizedBox(
          width: 20,
        ),
        CircleAvatar(
          radius: 30,
          // backgroundImage: NetworkImage('images/profile.webp'),
        ),

        // Image.asset(
        //   'images/profile.webp',
        //   width: 45,
        //   height: 45,
        //   fit: BoxFit.cover,
        // ),
        SizedBox(
          width: 10,
        ),
        Text(
          'Hello,Jenny!',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}

class MySearchBar extends StatelessWidget {
  const MySearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const SizedBox(
          width: 20,
        ),
        Container(
          width: 300,
          child: const Expanded(
            child: CupertinoSearchTextField(
              // controller: textController,
              placeholder: 'Search',
            ),
            // TextField(
            //   decoration: InputDecoration(
            //     border: OutlineInputBorder(),
            //     hintText: 'Enter a search term',
            //   ),
            // ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        IconButton(
            icon: const Icon(Icons.tune),
            onPressed: () {
              Navigator.push(
                context,
                CupertinoPageRoute(builder: (context) => const SecondPage()),
              );
            }),

        // const Icon(Icons.tune ),
      ],
    );
  }
}

class MyUsers extends StatelessWidget {
  const MyUsers({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
          itemCount: users.length,
          separatorBuilder: (BuildContext context, int index) {
            return const Divider(
              height: 15,
            );
          },
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
                leading: const CircleAvatar(
                  radius: 50,
                  // backgroundImage: NetworkImage('images/profile.webp'),
                ),
                title: Text(users[index].name),
                subtitle: SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Text(users[index].experience),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.yellow[500],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(users[index].stars),
                        ],
                      )
                    ],
                  ),
                ),
                trailing:
                    const Icon(Icons.arrow_forward_ios, color: Colors.blue));
          }),
    );
  }
}

class MyHorizontal extends StatelessWidget {
  const MyHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      height: 180,
      child: ListView(
        // This next line does the trick.
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          const SizedBox(
            width: 20,
          ),
          Container(
            width: 160,
            color: Colors.red,
          ),
          const SizedBox(
            width: 20,
          ),
          Container(
            width: 160,
            color: Colors.blue,
          ),
          const SizedBox(
            width: 20,
          ),
          Container(
            width: 160,
            color: Colors.green,
          ),
        ],
      ),
    );
  }
}

class MylistView extends StatelessWidget {
  const MylistView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
          child: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // const SizedBox(
                  //   width: 20,
                  // ),
                  const CircleAvatar(
                    radius: 25,
                    // backgroundImage: NetworkImage('images/profile.webp'),
                  ),
                  // const SizedBox(
                  //   width: 20,
                  // ),
                  Column(
                    children: [
                      Text('Anny White'),
                      Text('Experience: 5 years'),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.red[500],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text('41'),
                        ],
                      )
                    ],
                  ),
                  const Icon(Icons.arrow_forward_ios, color: Colors.blue)
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
