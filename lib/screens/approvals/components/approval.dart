import 'package:approvals/constants.dart';
import 'package:approvals/models/approvals.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ApprovalBox extends StatefulWidget {
  Approval approval;
  int? index;
  ApprovalBox({Key? key, this.index, required this.approval}) : super(key: key);

  @override
  State<ApprovalBox> createState() => _ApprovalBoxState();
}

class _ApprovalBoxState extends State<ApprovalBox> {
  Color statusColor = Colors.yellow;
  @override
  Widget build(BuildContext context) {
    if (widget.approval.status == "PENDING") {
      statusColor = Colors.orangeAccent;
    } else if (widget.approval.status == "APPROVED") {
      statusColor = Colors.green;
    } else if (widget.approval.status == "REJECTED") {
      statusColor = Colors.red;
    }
    return AnimatedContainer(
        duration: const Duration(milliseconds: 1000),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: homeScreenPrimaryColor),
        width: 200,
        margin: const EdgeInsets.all(8),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.approval.mailSubject,
                        style: const TextStyle(
                            color: homeScreenDarkColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                        textScaleFactor: 1.0,
                      ),
                      Text(
                        widget.approval.type,
                        style: const TextStyle(
                            color: homeScreenDarkColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 12),
                        textScaleFactor: 1.0,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    DateFormat('dd-MMM-yyyy').format(widget.approval.updatedAt),
                    style: const TextStyle(
                        color: homeScreenDarkColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 8),
                    textScaleFactor: 1.0,
                  ),
                )
              ],
            ),
            const Divider(color: Colors.black),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Raised By : ${widget.approval.initiator}',
                    style: const TextStyle(
                        color: homeScreenDarkColor, fontSize: 10),
                    textScaleFactor: 1.0,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Text(
                    '|',
                    style: TextStyle(color: homeScreenDarkColor, fontSize: 10),
                    textScaleFactor: 1.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    widget.approval.businessApplication,
                    style: const TextStyle(
                        color: homeScreenDarkColor, fontSize: 8),
                    textScaleFactor: 1.0,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Text(
                    '|',
                    style: TextStyle(color: homeScreenDarkColor, fontSize: 10),
                    textScaleFactor: 1.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      color: statusColor,
                    ),
                    child: Text(
                      widget.approval.status,
                      style: const TextStyle(color: Colors.white, fontSize: 9),
                      textScaleFactor: 1.0,
                    ),
                  ),
                )
              ],
            ),
          ],
        ));
  }
}
