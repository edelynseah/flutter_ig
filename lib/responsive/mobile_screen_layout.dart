import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({Key? key}) : super(key: key);

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  int _page = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void navigationTapped(int page) {
    pageController.jumpToPage(page);
  }

  void onPageChanged(int page){
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
            // ignore: sort_child_properties_last
            children: [
              Text('home'),
              Text('search'),
              Text('post'),
              Text('reels'),
              Text('profile'),
              Center(
                child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Ink(
                        color: Colors.blue,
                        width: MediaQuery.of(context).size.width / 2,
                        height: MediaQuery.of(context).size.width / 15,
                        child: const Center(
                            child: Text('Go Back',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold))))),
              ),
            ],
            physics: const NeverScrollableScrollPhysics(),
            controller: pageController,
            onPageChanged: onPageChanged),
        bottomNavigationBar: CupertinoTabBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home,
                    color: _page == 0 ? Colors.black : Colors.grey),
                label: '',
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
                icon: Icon(Icons.search,
                    color: _page == 1 ? Colors.black : Colors.grey),
                label: '',
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_circle,
                    color: _page == 2 ? Colors.black : Colors.grey),
                label: '',
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
                icon: Icon(Icons.movie,
                    color: _page == 3 ? Colors.black : Colors.grey),
                label: '',
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
                icon: Icon(Icons.perm_identity,
                    color: _page == 4 ? Colors.black : Colors.grey),
                label: '',
                backgroundColor: Colors.white),
          ],
          // important !!
          onTap: navigationTapped,
        ));
  }
}
