import "package:approvals/constants.dart";
import "package:flutter/material.dart";
import "package:flutter_speed_dial/flutter_speed_dial.dart";

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State createState() => _MainPageState();
}

class _MainPageState extends State with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  static const List<Tab> myTabs = [
    Tab(icon: Icon(Icons.offline_pin), text: "Approvals"),
    Tab(icon: Icon(Icons.contact_support), text: "Queries")
  ];

  late TabController _tabController;

  List speedDialOptions = [
    [
      SpeedDialChild(
          child: const Icon(Icons.pending_actions),
          label: "Pending",
          backgroundColor: Colors.white,
          onTap: () {}),
      SpeedDialChild(
          child: const Icon(Icons.credit_score_rounded),
          label: "Approved",
          backgroundColor: Colors.white,
          onTap: () {}),
      SpeedDialChild(
          child: const Icon(Icons.dangerous),
          label: "Rejected",
          backgroundColor: Colors.white,
          onTap: () {})
    ],
    [
      SpeedDialChild(
          child: const Icon(Icons.pending_actions),
          label: "Pending",
          backgroundColor: Colors.white,
          onTap: () {}),
      SpeedDialChild(
          child: const Icon(Icons.done_all),
          label: "Closed",
          backgroundColor: Colors.white,
          onTap: () {}),
    ]
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
    _tabController.addListener(_handleSelected);
  }

  void _handleSelected() {
    setState(() {
      _selectedIndex = _tabController.index;
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          bottom: TabBar(
            controller: _tabController,
            unselectedLabelColor: kSecondaryColor,
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BoxDecoration(
                gradient: const LinearGradient(
                    colors: [kPrimaryColor, kSecondaryColor]),
                borderRadius: BorderRadius.circular(50),
                color: kSecondaryColor),
            tabs: myTabs,
          ),
        ),
        body: TabBarView(controller: _tabController, children: const [
          Center(child: Text("approval")),
          Center(child: Text("Query"))
        ]),
        floatingActionButton: SpeedDial(
          animatedIcon: AnimatedIcons.menu_close,
          children: speedDialOptions.elementAt(_selectedIndex),
        ),
      ),
    );
  }
}
