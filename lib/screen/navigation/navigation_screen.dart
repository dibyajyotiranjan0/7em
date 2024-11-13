import 'package:em/screen/home/category_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import '../../static/colors.dart';
import 'package:provider/provider.dart';
import '../../viewmodel/tab_update/tab_update_viewmodel.dart';
import '../account/profile_screen.dart';
import '../home/home_screen.dart';
import '../home/property_cart.dart';
import '../myAdd/myAdd_scree.dart';
import '../sale/sell_screen.dart';

class NavigationScreen extends StatefulWidget {
  Widget child;
  int index;
  NavigationScreen({
    super.key,
    required this.child,
    required this.index,
  });
  @override
  _NavigationScreen createState() => _NavigationScreen();
}

class _NavigationScreen extends State<NavigationScreen>
    with SingleTickerProviderStateMixin {
  // int widget.index = 0;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<TabUpdateViewmodel>(context, listen: false)
        ..tabController =
            TabController(length: 4, vsync: this, initialIndex: widget.index)
        // ..tabbarListin(context)
        ..tabchangetoInd(widget.index);
    });
  }

  // @override
  // void didUpdateWidget(NavigationScreen oldWidget) {
  //   super.didUpdateWidget(oldWidget);

  //   // Update the TabController if widget.index changes
  //   if (widget.index !=
  //       Provider.of<TabUpdateViewmodel>(context, listen: false)
  //           .tabController
  //           .index) {
  //     Provider.of<TabUpdateViewmodel>(context, listen: false)
  //         .tabchangetoInd(widget.index);
  //   }
  // }

  @override
  void dispose() {
    Provider.of<TabUpdateViewmodel>(context, listen: false)
        .tabController
        ?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // backgroundColor: Colo.white,
      body: widget.child,
      // body: TabBarView(
      //   physics: NeverScrollableScrollPhysics(),
      //   controller: _tabController,
      //   children: [HomeScreen(), SellScreen(), MyAddscreen(), ProfileScreen()],
      // ),
      bottomNavigationBar:
          Consumer<TabUpdateViewmodel>(builder: (context, tab, _) {
        if (tab.tabController == null) {
          return SizedBox
              .shrink(); // Display nothing if tabController is not initialized
        }
        return BottomAppBar(
          height: 70,
          child: TabBar(
            dividerColor: Colors.transparent,
            indicatorColor: Colors.red.shade500,

            controller: tab.tabController,
            labelColor: Colors.redAccent,
            unselectedLabelColor: Colors.redAccent,

            // indicatorColor: Colors.blue,
            indicatorWeight: 0,
            // indicatorPadding: EdgeInsets.only(top: 0.0),
            indicator: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Colors.red.shade200, // Color of the indicator
                  width: 4.0, // Height of the indicator
                ),
              ),
            ),
            padding: EdgeInsets.zero,
            indicatorPadding: EdgeInsets.only(bottom: 5),
            labelPadding: EdgeInsets.zero,
            onTap: (index) {
              context.push('/home', extra: {'id': "0", 'sea': "home"});
              tab.tabchangetoInd(0);
              switch (index) {
                case 0:
                  context.push('/home', extra: {'id': "0", 'sea': "home"});
                  tab.tabchangetoInd(0);
                  // Provider.of<MapLoadViewmodel>(context, listen: false)
                  //     .removeMarkerndpathWithDestPath();
                  break;
                case 1:
                  context.push('/sellScreen', extra: {'id': "1"});
                  tab.tabchangetoInd(1);
                  // Provider.of<MapLoadViewmodel>(context, listen: false)
                  //     .removeMarkerndpathWithDestPath();
                  // context.go('/pastRecord', extra: {'id': "1"});
                  break;

                case 2:
                  context.push('/myadd', extra: {'id': "2"});
                  tab.tabchangetoInd(2);
                  // Provider.of<MapLoadViewmodel>(context, listen: false)
                  //     .removeMarkerndpathWithDestPath();
                  // context.go('/attendance', extra: {'id': "2"});
                  break;
                case 3:
                  context.push('/profie', extra: {'id': "3"});
                  tab.tabchangetoInd(3);
                  // Provider.of<MapLoadViewmodel>(context, listen: false)
                  //     .removeMarkerndpathWithDestPath();
                  // context.push('/profie', extra: {'id': "3"});
                  break;

                default:
                  context.push('/home', extra: {'id': "0", 'sea': "home"});
                  tab.tabchangetoInd(0);
                  // Provider.of<MapLoadViewmodel>(context, listen: false)
                  //     .removeMarkerndpathWithDestPath();
                  // context.go('/home', extra: {'id': "0"});
                  break;
              }
            },
            tabs: [
              // InkWell(
              //   onTap: () {
              //     context.push('/home', extra: {'id': "0", 'sea': "home"});
              //     tab.tabchangetoInd(0);
              //   },
              //   child:
              Tab(
                  icon: widget.index == 0
                      ? Icon(
                          Icons.home,
                          color: Colo.buttonPrimary,
                          size: 35,
                        )
                      : null,
                  text: widget.index == 0 ? null : 'Home'),
              // ),
              // InkWell(
              //   onTap: () {
              //     context.push('/sellScreen', extra: {'id': "1"});
              //     tab.tabchangetoInd(1);
              //   },
              //   child:
              Tab(
                  icon: widget.index == 1
                      ? Icon(
                          Icons.explore,
                          color: Colo.buttonPrimary,
                          size: 35,
                        )
                      : null,
                  text: widget.index == 1 ? null : 'Sell'),
              // ),
              // InkWell(
              // onTap: () {
              //   context.push('/myadd', extra: {'id': "2"});
              //   tab.tabchangetoInd(2);
              // },
              // child:
              Tab(
                  icon: widget.index == 2
                      ? Icon(
                          Icons.favorite_rounded,
                          color: Colo.buttonPrimary,
                          size: 35,
                        )
                      : null,
                  text: widget.index == 2 ? null : 'My Ads'),
              // ),
              // InkWell(
              //   onTap: () {
              //     context.push('/profie', extra: {'id': "3"});
              //     tab.tabchangetoInd(3);
              //   },
              //   child:
              Tab(
                icon: widget.index == 3
                    ? Icon(
                        Icons.settings,
                        color: Colo.buttonPrimary,
                        size: 35,
                      )
                    : null,
                text: widget.index == 3 ? null : 'Account',
              ),
              // ),
            ], // Color of the unselected tabs
            indicatorSize:
                TabBarIndicatorSize.tab, // Indicator size for the selected tab
          ),
        );
      }),
    );
  }
}
