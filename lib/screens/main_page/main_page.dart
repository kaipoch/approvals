import "package:approvals/constants.dart";
import "package:approvals/models/approval_provider_model.dart";
import "package:approvals/models/query_provider_model.dart";
import "package:approvals/screens/approvals/approvals.dart";
import "package:approvals/screens/queries/queries.dart";
import "package:flutter/material.dart";
import "package:flutter_speed_dial/flutter_speed_dial.dart";
import "package:provider/provider.dart";

class MainPage extends StatefulWidget {
  static String routeName = "/mainPage";
  const MainPage({Key? key}) : super(key: key);

  @override
  State createState() => _MainPageState();
}

class _MainPageState extends State with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  static const List<Tab> myTabs = [
    Tab(text: "Approvals"),
    Tab(text: "Queries")
  ];

  late TabController _tabController;

  String approvalStatus = "PENDING";
  String queryStatus = "PENDING";

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
    List speedDialOptions = [
      [
        SpeedDialChild(
            child: const Icon(Icons.pending_actions),
            label: "Pending",
            backgroundColor: Colors.white,
            onTap: () {
              setState(() {
                approvalStatus = "PENDING";
              });
            }),
        SpeedDialChild(
            child: const Icon(Icons.credit_score_rounded),
            label: "Approved",
            backgroundColor: Colors.white,
            onTap: () {
              setState(() {
                approvalStatus = "APPROVED";
              });
            }),
        SpeedDialChild(
            child: const Icon(Icons.dangerous),
            label: "Rejected",
            backgroundColor: Colors.white,
            onTap: () {
              setState(() {
                approvalStatus = "REJECTED";
              });
            })
      ],
      [
        SpeedDialChild(
            child: const Icon(Icons.pending_actions),
            label: "Pending",
            backgroundColor: Colors.white,
            onTap: () {
              setState(() {
                queryStatus = "PENDING";
              });
            }),
        SpeedDialChild(
            child: const Icon(Icons.done_all),
            label: "Closed",
            backgroundColor: Colors.white,
            onTap: () {
              setState(() {
                queryStatus = "CLOSED";
              });
            }),
      ]
    ];
    context.read<ApprovalProviderModel>().getApprovals(approvalStatus);
    context.read<QueryProviderModel>().getQueries(queryStatus);

    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          bottom: PreferredSize(
            preferredSize: const Size(50.0, 50.0),
            child: Container(
              height: 50,
              padding: const EdgeInsets.all(5),
              child: TabBar(
                controller: _tabController,
                unselectedLabelColor: homeScreenDarkColor,
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                    gradient: const LinearGradient(colors: [
                      homeScreenPrimaryColor,
                      homeScreenSecondaryColor
                    ]),
                    borderRadius: BorderRadius.circular(50),
                    color: kSecondaryColor),
                tabs: myTabs,
              ),
            ),
          ),
        ),
        body: TabBarView(
            controller: _tabController,
            children: const [ApprovalScreen(), QueryScreen()]),
        floatingActionButton: SpeedDial(
          backgroundColor: homeScreenDarkColor,
          animatedIcon: AnimatedIcons.menu_close,
          children: speedDialOptions.elementAt(_selectedIndex),
        ),
      ),
    );
  }
}
