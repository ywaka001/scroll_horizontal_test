import 'dart:ui';

import 'package:banana/riverpod_sample/notify/btn_widget.dart';
import 'package:banana/riverpod_sample/notify/todosnotifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

// void main() {
//   runApp(const MyApp());
// }

Future<void> main() async {
  // 初期化処理
  runApp(
    // ProviderScope 以下の Widget で Riverpod が有効になるになる
    ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(
          title: 'Flutter Demo 横スクロールさせたい。androidはできるがWindowsができない'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;
  final String bodyMsg = "test";

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        // etc.
      };
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  ScrollController _controller = ScrollController();
  double _scrollPosition = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
          // child: Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: <Widget>[
          // new SvgPicture.asset(
          //   'images/draw1.svg',
          //   // color: Color(0xff93D2D9),
          //   // width: 100,
          //   // height: 100,
          // ),
          // BtnWidGet(title: 'OK'),
          // Text(
          //   '$_counter',
          //   style: Theme.of(context).textTheme.headline4,
          // ),
          // Row(
          //   children: [
          // Container(
          //   width: 100,
          //   height: 100,
          //   decoration: BoxDecoration(
          //     color: Colors.blue[300],
          //     borderRadius: BorderRadius.circular(5),
          //   ),
          //   child: Text('1つ目'),
          // ),
          // Container(
          //     width: 300,
          //     child: Row(children: <Widget>[
          //       const SizedBox(
          //         width: 100,
          //         height: 400,
          //         child: Text('固定表示させたいパーツ'),
          //       ),
          //       Expanded(
          //           // ココ追加！！！！！！
          //           child: SingleChildScrollView(
          //               scrollDirection: Axis.horizontal,
          //               child: Row(children: <Widget>[
          //                 SizedBox(
          //                     width: 100,
          //                     height: 400,
          //                     child: const Text('横にスクロールしたいパーツ1')),
          //                 SizedBox(
          //                     width: 100,
          //                     height: 400,
          //                     child: const Text('横にスクロールしたいパーツ2')),
          //                 SizedBox(
          //                     width: 100,
          //                     height: 400,
          //                     child: const Text('横にスクロールしたいパーツ3')),
          //                 SizedBox(
          //                     width: 100,
          //                     height: 400,
          //                     child: const Text('横にスクロールしたいパーツ4')),
          //                 SizedBox(
          //                     width: 100,
          //                     height: 400,
          //                     child: const Text('横にスクロールしたいパーツ5')),
          //               ])))
          //     ])),
          // SizedBox(
          //   width: 500,
          //   height: 100,
          //   // decoration: BoxDecoration(
          //   //   color: Colors.green[300],
          //   //   borderRadius: BorderRadius.circular(5),
          //   // ),
          //   child: ListView(
          //     scrollDirection: Axis.horizontal,
          //     children: [
          //       Card(
          //         child: Container(
          //           width: 200,
          //         ),
          //         color: Colors.blue,
          //       ),
          //       Card(
          //         child: Container(
          //           width: 200,
          //         ),
          //         color: Colors.green,
          //       ),
          //       Card(
          //         child: Container(
          //           width: 200,
          //         ),
          //         color: Colors.yellow,
          //       ),
          //       Card(
          //         child: Container(
          //           width: 200,
          //         ),
          //         color: Colors.pink,
          //       ),
          //     ],
          //     shrinkWrap: true,
          //   ),
          // ),
          // Container(
          //   height: 100,
          //   child: ListView(
          //     shrinkWrap: true,
          //     scrollDirection: Axis.horizontal,
          //     children: [
          //       for (var i = 0; i < 10; i++)
          //         Padding(
          //           padding: const EdgeInsets.all(8.0),
          //           child: Container(
          //             color: Colors.green,
          //             child: Text('$i'),
          //           ),
          //         ),
          //     ],
          //     itemExtent: 50,
          //   ),
          // ),

          child:
              // Row(
              //   children: [
              //     Container(
              //       width: 100,
              //       height: 100,
              //       decoration: BoxDecoration(
              //         color: Colors.blue[300],
              //         borderRadius: BorderRadius.circular(5),
              //       ),
              //     ),
              //
              //   ],
              // ),
              //

              SingleChildScrollView(
        controller: _controller,
        child: Column(
          children: [
            SizedBox(
              height: 200,
              width: 500,
              child: Scrollbar(
                thumbVisibility: true,
                child: ScrollConfiguration(
                  behavior: MyCustomScrollBehavior(),
                  child: ListView.builder(
                    controller: _controller,
                    itemCount: 20,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Container(
                      height: 100,
                      width: 100,
                      margin: EdgeInsets.all(10),
                      child: Center(
                        child: Text('Card $index'),
                      ),
                      color: Colors.green[100],
                    ),

                    // {
                    //   return Padding(
                    //     padding: const EdgeInsets.all(8.0),
                    //     child: Container(
                    //       width: 100,
                    //       color: Colors.blue,
                    //       child: Text('$index'),
                    //     ),
                    //   );
                    // },
                  ),
                ),
              ),
            ),
          ],
        ),
      )
          //   ],
          // ),
          //   ],
          // ),
          ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
