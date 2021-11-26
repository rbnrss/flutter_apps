import 'dart:async';

import 'package:bookme/components/constants.dart';
import 'package:bookme/screens/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/bottom_navigation_components.dart';
import '../components/state_manager.dart';
import 'first_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ScrollController? _scrollController = ScrollController();

  @override
  void initState() {
    loadShops();
    super.initState();
  }

  void loadShops() async {
    await Provider.of<StateManager>(context, listen: false).getData();
  }

  void _discoverPage() {
    Timer(
      const Duration(milliseconds: 300),
      () {
        _scrollController!.animateTo(MediaQuery.of(context).size.width,
            duration: const Duration(milliseconds: 500),
            curve: Curves.fastOutSlowIn);
      },
    );
  }

  void _homePage() {
    Timer(const Duration(milliseconds: 300), () {
      _scrollController!.animateTo(0,
          duration: const Duration(milliseconds: 500),
          curve: Curves.fastLinearToSlowEaseIn);
    });
  }

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<StateManager>(context, listen: false);
    int myIndex = state.index;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          state.changeIndex(index);
          int checkIndex = state.index;
          setState(() {
            checkIndex == 1 ? _discoverPage() : _homePage();
          });
        },
        currentIndex: myIndex,
        type: BottomNavigationBarType.fixed,
        items: BottomNavigationComponents().itemList,
      ),
      body: NotificationListener<ScrollEndNotification>(
        child: CustomScrollView(
          // physics: const NeverScrollableScrollPhysics(),
          controller: _scrollController,
          scrollDirection: Axis.horizontal,
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    color: index == 0 ? kGreyShade : Colors.blue,
                    child: index == 0 ? const FirstScreen() : SecondScreen(),
                  );
                },
                childCount: 2,
              ),
            ),
          ],
        ),
        onNotification: (notification) {
          _scrollController!.position.pixels ==
                  _scrollController!.position.maxScrollExtent
              ? Provider.of<StateManager>(context, listen: false).changeIndex(1)
              : Provider.of<StateManager>(context, listen: false)
                  .changeIndex(0);
          setState(() {});

          return true;
        },
      ),
    );
  }
}
