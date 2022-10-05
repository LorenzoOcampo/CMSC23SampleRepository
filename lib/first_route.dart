import 'package:flutter/material.dart';
import 'second_route.dart';
import 'extract_argments.dart';
import 'screen_arguments.dart';
import 'pass_arguments.dart';

class FirstRoute extends StatelessWidget {
  const FirstRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('First Route'),
        ),
        drawer: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text('Drawer Header'),
              ),
              ListTile(
                title: const Text('Second Screen'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/second');

                  // Update the state of the app.
                  // ...copy paste here the navigator.push method here
                  //you may navigate to SecondScreen
                },
              ),
              ListTile(
                title: const Text('Passed Argument'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(
                    context,
                    PassArgumentsScreen.routeName,
                    arguments: ScreenArguments(
                      'Accept Arguments Screen',
                      'This message is extracted in the onGenerateRoute '
                          'function.',
                    ),
                  );

                  // Update the state of the app.
                  // ...copy paste here the navigator.push method
                },
              ),
            ],
          ),
        ),
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                child: const Text('Go to Second route'),
                onPressed: () {
                  Navigator.pushNamed(context, '/second');
                },
              ),
              ElevatedButton(
                child: const Text('Go to Extract Arguments'),
                onPressed: () {
                  // When the user taps the button,
                  // navigate to a named route and
                  // provide the arguments as an optional
                  // parameter.
                  Navigator.pushNamed(
                    context,
                    ExtractArgumentsScreen.routeName,
                    arguments: ScreenArguments(
                      'Extract Arguments Screen',
                      'This message is extracted in the build method.',
                    ),
                  );
                },
              ),
              ElevatedButton(
                child: const Text('Go to pass arguments'),
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    PassArgumentsScreen.routeName,
                    arguments: ScreenArguments(
                      'Accept Arguments Screen',
                      'This message is extracted in the onGenerateRoute '
                          'function.',
                    ),
                  );
                },
              )
            ],
          ),
        ));
  }
}
