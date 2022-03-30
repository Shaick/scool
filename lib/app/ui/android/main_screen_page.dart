import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scool/app/ui/android/home_tab.dart';
import 'package:scool/app/ui/android/journal_page.dart';
import 'package:scool/app/ui/android/profile_page.dart';
import 'package:scool/app/ui/android/search_page.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  GetStorage box = GetStorage('login_firebase');
  //final firestoreProvider = FirestoreProvider();
  TabController tabController;
  final selectedIndex = 0.obs;
  bool docsok;

  void onItemClicked(int index) {
    selectedIndex.value = index;
    tabController.index = selectedIndex.value;
  }

  @override
  void initState() {
/*     void gett() async {
      await firestoreProvider.ref.get().then((value) {
        docsok = value.data()["docsok"];
      });
    }  */

    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: tabController,
        children: [
          HomeTabPage(),
          SearchPage(),
          JournalPage(),
          ProfileTabPage(),
        ],
      ),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: "Buscar",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.date_range),
                label: "Agenda",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Perfil",
              ),
            ],
            unselectedItemColor: Colors.black54,
            selectedItemColor: Colors.blueAccent[700],
            type: BottomNavigationBarType.fixed,
            selectedLabelStyle: TextStyle(fontSize: 12),
            showUnselectedLabels: true,
            onTap: onItemClicked,
            currentIndex: int.parse(selectedIndex.value.obs.toString()),
          )),
    );
  }
}
