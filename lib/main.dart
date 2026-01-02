import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

enum MenuAction { delete }

// ==================== /* MyApp StatefulWidget */ ====================
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.dark;

  void changeTheme(bool isDark) {
    setState(() {
      _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Color appBarTextColor = _themeMode == ThemeMode.dark
        ? Colors.yellow
        : Colors.black;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: _themeMode,
      home: Scaffold(
        appBar: AppBar(
          leading: Builder(
            builder: (context) {
              return IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Info()),
                  );
                },
                icon: Icon(Icons.info, size: 35, color: Colors.amber),
              );
            },
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: Text(
            "NoteBook",
            style: TextStyle(
              color: appBarTextColor,
              fontSize: 20,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            PopupMenuButton<MenuAction>(
              icon: Icon(Icons.menu, color: Colors.amber, size: 30),
              onSelected: (value) {
                switch (value) {
                  case MenuAction.delete:
                    break;
                }
              },
              itemBuilder: (context) {
                return [
                  PopupMenuItem<MenuAction>(
                    value: MenuAction.delete,
                    child: Text("Delete"),
                  ),
                ];
              },
            ),
            Switch(
              value: _themeMode == ThemeMode.dark,
              onChanged: changeTheme,
            ),
          ],
        ),
        floatingActionButton: Builder(
          builder: (context) {
            return FloatingActionButton(
              backgroundColor: Colors.blueAccent,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditUpdateView(),
                  ),
                );
              },
              child: Icon(Icons.add, size: 30),
            );
          },
        ),
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1 / 1.2,
          ),
          itemCount: 3,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.amber,
              child: Column(
                children: <Widget>[
                  Text(
                    "Title",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                    ),
                  ),
                  // ignore: avoid_unnecessary_containers
                  Container(
                    child: Text(
                      "moeinit.com",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                      overflow: TextOverflow.fade,
                      maxLines: 5,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

// ==================== /* EditUpdateView StatefulWidget */ ====================
class EditUpdateView extends StatefulWidget {
  const EditUpdateView({super.key});

  @override
  State<EditUpdateView> createState() => _EditUpdateViewState();
}

class _EditUpdateViewState extends State<EditUpdateView> {
  ThemeMode _themeMode = ThemeMode.dark;
  void changeTheme(bool isDark) {
    setState(() {
      _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final Color appBarTextColor = _themeMode == ThemeMode.dark
        ? Colors.yellow
        : Colors.black;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: _themeMode,
      home: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              tooltip: "Add Text",
              onPressed: () {},
              icon: Icon(Icons.check, color: Colors.amber, size: 30),
            ),
            Switch(
              value: _themeMode == ThemeMode.dark,
              onChanged: changeTheme,
            ),
          ],
          leading: Builder(
            builder: (context) {
              return IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyApp()),
                  );
                },
                icon: Icon(
                  Icons.backspace_rounded,
                  color: Colors.amber,
                  size: 30,
                ),
              );
            },
          ),
          centerTitle: true,
          title: Text(
            "New Note",
            style: TextStyle(
              color: Colors.amber,
              fontSize: 30,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Column(
          children: <Widget>[
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                decoration: InputDecoration(
                  hint: Text(
                    "Title",
                    style: TextStyle(color: Colors.amber),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                decoration: InputDecoration(
                  hint: Text(
                    "Text",
                    style: TextStyle(color: Colors.amber),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ==================== /* Info StatefulWidget */ ====================
class Info extends StatefulWidget {
  const Info({super.key});

  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
  ThemeMode _themeMode = ThemeMode.dark;

  void changeTheme(bool isDark) {
    setState(() {
      _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    });
  }

  Future<void> _openmoeinit() async {
    final Uri url = Uri.parse("https://moeinit.com");
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception("Faild");
    }
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final Color appBarTextColor = _themeMode == ThemeMode.dark
        ? Colors.yellow
        : Colors.black;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: _themeMode,
      home: Scaffold(
        appBar: AppBar(
          actions: [
            Switch(
              value: _themeMode == ThemeMode.dark,
              onChanged: changeTheme,
            ),
          ],
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.backspace,
              size: 35,
              color: Colors.amber,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: Text(
            "Info Page",
            style: TextStyle(
              fontSize: 30,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Container(
                  height: 100,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      "moeinit.com",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(
                    Colors.amber,
                  ),
                ),
                onPressed: _openmoeinit,
                child: Text(
                  "Open moeinit.com Website",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
