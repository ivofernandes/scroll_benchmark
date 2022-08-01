import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int size = 5000;
    return Scaffold(
        appBar: AppBar(title: Text('Scroll benchmark')),
        body: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              MaterialButton(
                  child: Text('Simple scroll'),
                  color: Colors.orange,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return SimpleScrollWidget(size);
                    }));
                  }),
              MaterialButton(
                  child: Text('Recycle scroll'),
                  color: Colors.green,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return RecycleScrollWidget(size);
                    }));
                  })
            ],
          ),
        ));
  }
}

class SimpleScrollWidget extends StatelessWidget {
  final int size;

  const SimpleScrollWidget(this.size);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Simple Scroll')),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(10),
            child: Column(
              children: List.generate(size, (index) => RenderWidget(index)),
            ),
          ),
        ));
  }
}

class RecycleScrollWidget extends StatelessWidget {
  final int size;

  const RecycleScrollWidget(this.size);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Recycle Scroll')),
        body: ListView.builder(
            itemCount: size,
            itemBuilder: (context, index) {
              return RenderWidget(index);
            }));
  }
}

class RenderWidget extends StatelessWidget {
  final int index;
  const RenderWidget(this.index);

  @override
  Widget build(BuildContext context) {
    print('Building index $index');
    return Container(width: double.maxFinite, child: Text('$index'));
  }
}
