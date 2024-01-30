import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NavigationBar(),
    );
  }
}

class NavigationBar extends StatefulWidget {
  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<NavigationBar> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    HomePage(),
    SettingPage(),
    SearchPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Music App Example'),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Election 2020'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Will you vote for Trump'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('Yes'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('No'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            child: Text('Button 1'),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Hey, this is your Home Page'),
                  duration: Duration(seconds: 5),
                ),
              );
            },
            child: Text('Button 2'),
          ),
        ],
      ),
    );
  }
}

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool? isFemale;
  List<String> hobbies = [];

  void _updateHobbies(String hobby, bool? isChecked) {
    setState(() {
      if (isChecked ?? false) {
        hobbies.add(hobby);
      } else {
        hobbies.remove(hobby);
      }
    });
  }

  void _updateGender(bool? isFemaleSelected) {
    setState(() {
      isFemale = isFemaleSelected ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Choose Your Hobbi:',
                style: TextStyle(fontSize: 18),
              ),
              CheckboxListTile(
                title: Text('Football'),
                value: hobbies.contains('Football'),
                onChanged: (isChecked) => _updateHobbies('Football', isChecked),
              ),
              CheckboxListTile(
                title: Text('Baseball'),
                value: hobbies.contains('Baseball'),
                onChanged: (isChecked) => _updateHobbies('Baseball', isChecked),
              ),
              CheckboxListTile(
                title: Text('Swimming'),
                value: hobbies.contains('Swimming'),
                onChanged: (isChecked) => _updateHobbies('Swimming', isChecked),
              ),
              CheckboxListTile(
                title: Text('Basketball'),
                value: hobbies.contains('Basketball'),
                onChanged: (isChecked) =>
                    _updateHobbies('Basketball', isChecked),
              ),
              CheckboxListTile(
                title: Text('Shopping'),
                value: hobbies.contains('Shopping'),
                onChanged: (isChecked) => _updateHobbies('Shopping', isChecked),
              ),
              SizedBox(height: 10),
              Text(
                'Hobbies: ${hobbies.join(", ")}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                'Choose Your Gender:',
                style: TextStyle(fontSize: 16),
              ),
              RadioListTile<bool>(
                title: Text('Female'),
                value: true,
                groupValue: isFemale ?? false,
                onChanged: _updateGender,
              ),
              RadioListTile<bool>(
                title: Text('Male'),
                value: false,
                groupValue: isFemale ?? false,
                onChanged: _updateGender,
              ),
              SizedBox(height: 30),
              Text(
                'Hello: ${isFemale == true ? "Female" : "Male"}',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: Icon(Icons.album),
                    title: Text('Album'),
                  ),
                  ListTile(
                    leading: Icon(Icons.phone),
                    title: Text('Phone'),
                  ),
                  ListTile(
                    leading: Icon(Icons.contacts),
                    title: Text('Contact'),
                  ),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text('Setting'),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            backgroundColor: const Color.fromARGB(255, 158, 104, 100),
                            title: Row(
                              children: [
                                Icon(Icons.album),
                                SizedBox(width: 8),
                                Text('Sonu Nigam'),
                              ],
                            ),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('Best of Sonu Nigam Music'),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('Play'),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('Pause'),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: Text('Player'),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    padding: EdgeInsets.all(16.0),
                    child: Table(
                      border: TableBorder.all(),
                      children: [
                        TableRow(
                          children: [
                            TableCell(
                              child: Center(child: Text('Music')),
                            ),
                            TableCell(
                              child: Center(child: Text('Singer')),
                            ),
                            TableCell(
                              child: Center(child: Text('Year')),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            TableCell(
                              child: Center(child: Text('Anna Asti')),
                            ),
                            TableCell(
                              child: Center(child: Text('Po Baram')),
                            ),
                            TableCell(
                              child: Center(child: Text('2022')),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            TableCell(
                              child: Center(child: Text('Mot')),
                            ),
                            TableCell(
                              child: Center(child: Text('Kapkan')),
                            ),
                            TableCell(
                              child: Center(child: Text('2016')),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            TableCell(
                              child: Center(child: Text('Sadraddin')),
                            ),
                            TableCell(
                              child: Center(child: Text('Aiga Karap')),
                            ),
                            TableCell(
                              child: Center(child: Text('2023')),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}