import 'package:approvals/constants.dart';
import 'package:approvals/models/approval_provider_model.dart';
import 'package:approvals/models/approvals.dart';
import 'package:approvals/screens/approvals/components/audit.dart';
import 'package:approvals/screens/approvals/components/raise_query.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ApprovalDetailScreen extends StatelessWidget {
  Approval approval;
  Color statusColor = Colors.yellow;
  final _commentController = TextEditingController();
  ApprovalDetailScreen({Key? key, required this.approval}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (approval.status == "PENDING") {
      statusColor = Colors.orangeAccent;
    } else if (approval.status == "APPROVED") {
      statusColor = Colors.green;
    } else if (approval.status == "REJECTED") {
      statusColor = Colors.red;
    }
    return Scaffold(
        appBar: AppBar(
          backgroundColor: homeScreenPrimaryColor,
          title: Text(
            approval.mailSubject,
            style: const TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.bold,
                fontSize: 13),
            textScaleFactor: 1.0,
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RaiseQueryScreen()));
              },
              icon: const Icon(
                Icons.contact_support,
                size: 25,
              ),
            )
          ],
          bottom: PreferredSize(
            preferredSize: const Size(100.0, 300.0),
            child: SizedBox(
              height: 300,
              width: 280,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.calendar_month),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            DateFormat('yyyy-MMM-dd hh:mm a')
                                .format(approval.updatedAt),
                            style: const TextStyle(
                                color: Colors.black54,
                                fontSize: 10,
                                fontWeight: FontWeight.bold),
                            textScaleFactor: 1.0,
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.all(7.0),
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15)),
                          color: statusColor,
                        ),
                        child: Text(
                          approval.status,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 12),
                          textScaleFactor: 1.0,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 150,
                            child: Text(
                              approval.type,
                              style: const TextStyle(
                                  color: Colors.black54,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                              textScaleFactor: 1.0,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: const EdgeInsets.all(5.0),
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              color: Colors.black54,
                            ),
                            child: Text(
                              approval.businessApplication,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 8),
                              textScaleFactor: 1.0,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Raised By : ${approval.initiator}',
                        style: const TextStyle(
                            color: Colors.black54,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                        textScaleFactor: 1.0,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.all(5),
                      child: SingleChildScrollView(
                        child: Text(
                          approval.mailContent,
                          style: const TextStyle(
                              color: Colors.black54, fontSize: 15),
                          textScaleFactor: 1.0,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: homeScreenDarkColor,
          child: const Icon(
            Icons.download,
          ),
          onPressed: () {},
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
        body: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              Container(
                height: 250,
                child: Audit(
                  histories: approval.history,
                ),
              ),
              approval.status == "PENDING"
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: _commentController,
                        decoration:
                            const InputDecoration(hintText: "Enter Comment"),
                      ),
                    )
                  : SizedBox.shrink(),
              approval.status == "PENDING"
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                            style: ButtonStyle(
                                padding: MaterialStateProperty.all<EdgeInsets>(
                                    EdgeInsets.all(15)),
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.red),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                        side: BorderSide(color: Colors.red)))),
                            child: SizedBox(
                              width: 100,
                              child: Center(
                                child: Text("Reject".toUpperCase(),
                                    style: TextStyle(fontSize: 14)),
                              ),
                            ),
                            onPressed: () => {
                                  Provider.of<ApprovalProviderModel>(context,
                                          listen: false)
                                      .approveRejectApprovals(approval.id,
                                          "REJECTED", _commentController.text),
                                  Navigator.pop(context)
                                }),
                        TextButton(
                            style: ButtonStyle(
                                padding: MaterialStateProperty.all<EdgeInsets>(
                                    EdgeInsets.all(15)),
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.blue),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                        side: BorderSide(color: Colors.blue)))),
                            child: SizedBox(
                              width: 100,
                              child: Center(
                                child: Text("Approve".toUpperCase(),
                                    style: TextStyle(fontSize: 14)),
                              ),
                            ),
                            onPressed: () => {
                                  Provider.of<ApprovalProviderModel>(context,
                                          listen: false)
                                      .approveRejectApprovals(approval.id,
                                          "APPROVED", _commentController.text),
                                  Navigator.pop(context)
                                }),
                      ],
                    )
                  : SizedBox.shrink(),
            ],
          ),
        ));
  }
}
