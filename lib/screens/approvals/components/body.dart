import 'package:approvals/models/approval_provider_model.dart';
import 'package:approvals/models/approvals.dart';
import 'package:approvals/screens/approvals/components/approval.dart';
import 'package:approvals/screens/approvals/components/approval_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var approvalProvider = context.watch<ApprovalProviderModel>();
    List<Approval> approvals = approvalProvider.approvals;
    return approvals.isEmpty
        ? const Center(
            child: Padding(
              padding: EdgeInsets.all(7.0),
              child: Text(
                "You have no Approvals",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
                textScaleFactor: 1.0,
              ),
            ),
          )
        : ListView.builder(
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            itemCount: approvals.length,
            itemBuilder: (_, index) => InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ApprovalDetailScreen(
                              approval: approvals[index])));
                },
                child: ApprovalBox(
                  approval: approvals[index],
                  index: index,
                )));
  }
}
