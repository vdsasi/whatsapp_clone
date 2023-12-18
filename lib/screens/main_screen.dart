/* This represents the Chats scree and AppBar for the app
*/
// new change added

import 'package:flutter/material.dart';
import 'package:whatsapp_clone/components/contact.dart';
import 'package:whatsapp_clone/constants/green_pallete.dart';
import 'package:whatsapp_clone/screens/calls_screen.dart';
import 'package:whatsapp_clone/screens/update_screen.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  static const List<Tab> myTabs = [
    Tab(text: 'Chats'),
    Tab(text: 'Updates'),
    Tab(text: 'Calls'),
  ];

  AppBar buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: true,
      title: const Text("WhatsApp", style: TextStyle(color: Colors.white)),
      backgroundColor: Pallete.mainScreenColors[200],
      actions: const [
        Icon(
          Icons.photo_camera_outlined,
          color: Colors.white,
          size: 24,
        ),
        SizedBox(width: 16),
        Icon(
          Icons.search_outlined,
          color: Colors.white,
          size: 24,
        ),
        SizedBox(width: 16),
        Icon(
          Icons.more_vert_outlined,
          color: Colors.white,
          size: 24,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ColorfulSafeArea(
        color: const Color(Pallete.appBarColor),
        child: DefaultTabController(
          length: myTabs.length,
          child: Scaffold(
            backgroundColor: const Color(Pallete.appBarColor),
            body: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    backgroundColor: Pallete.mainScreenColors[200],
                    title: buildAppBar(),
                    floating: true,
                    pinned: true,
                    snap: true,
                    bottom: TabBar(
                      indicatorPadding: EdgeInsets.zero,
                      indicatorColor: Colors.green,
                      unselectedLabelColor: Colors.white,
                      labelColor: Colors.white,
                      indicator: UnderlineTabIndicator(
                        borderSide: const BorderSide(width: 4, color: Colors.green),
                        insets: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.20,
                        ),
                      ),
                      tabs: const [
                        Tab(
                          child: Text(
                            "Chats",
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        Tab(
                          child: Text(
                            "Updates",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                        Tab(
                          child: Text(
                            "Calls",
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                  ),
                ];
              },
              body: Container(
                color: Pallete.mainScreenColors[100],
                child: TabBarView(
                  children: [
                    Center(
                      child: CustomScrollView(
                        slivers: [
                          SliverFixedExtentList(
                            itemExtent: 85.0,
                            delegate: SliverChildBuilderDelegate(
                              (BuildContext context, int index) {
                                return Container(
                                  alignment: Alignment.center,
                                  decoration: const BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        width: 0.5,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                  child: Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      child: const Contact(),
                                      onTap: () {
                                        // print("Pressed");
                                      },
                                    ),
                                  ),
                                );
                              },
                              childCount: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const UpdatesScreen(),
                    const CallsScreen(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
