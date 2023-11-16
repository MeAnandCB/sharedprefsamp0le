import 'package:color_picker_sample/view/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Color> mycolorList = [
    Colors.red,
    Colors.yellow,
    Colors.orange,
    Colors.green,
  ];

  List<int> selecteddataList = [];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () async {
                final SharedPreferences obj =
                    await SharedPreferences.getInstance();

                obj.setBool("isLogged", false);

                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LogingScreen(),
                    ),
                    (route) => false);
              },
              icon: Icon(Icons.logout))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) => StatefulBuilder(
                    builder: (context, insetState) {
                      return Container(
                        child: ListView.builder(
                          itemCount: 4,
                          itemBuilder: (context, index) => InkWell(
                            onTap: () {
                              selectedIndex = index;
                              selecteddataList.add(selectedIndex);
                              print(selecteddataList);
                              insetState(() {});
                              setState(() {});
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: mycolorList[index].withOpacity(.5),
                                    border: selectedIndex == index
                                        ? Border.all(
                                            color: mycolorList[index], width: 5)
                                        : null),
                                height: 50,
                                width: 50,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ));
        },
      ),
      body: ListView.builder(
        itemCount: selecteddataList.length,
        itemBuilder: (context, index) => Container(
          height: 50,
          width: 100,
          color: mycolorList[selecteddataList[index]],
        ),
      ),
    );
  }
}
