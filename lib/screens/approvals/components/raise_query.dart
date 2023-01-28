import 'package:approvals/constants.dart';
import 'package:approvals/models/approval_provider_model.dart';
import 'package:approvals/models/approvals.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RaiseQueryScreen extends StatefulWidget {
  Approval approval;
  RaiseQueryScreen({Key? key, required this.approval}) : super(key: key);

  @override
  State<RaiseQueryScreen> createState() => _RaiseQueryScreenState();
}

class _RaiseQueryScreenState extends State<RaiseQueryScreen> {
  String? userSelected = "dhruv.patel@epikindifi.com";
  TextEditingController _commentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    context.read<ApprovalProviderModel>().getUsers(widget.approval.id);
    var approvalProvider = context.watch<ApprovalProviderModel>();
    List<String> users = approvalProvider.users;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: homeScreenPrimaryColor,
        title: const Text(
          "RAISE QUERY",
          style: TextStyle(
              color: Colors.black54, fontWeight: FontWeight.bold, fontSize: 13),
          textScaleFactor: 1.0,
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                widget.approval.mailSubject,
                style: const TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                    fontSize: 13),
                textScaleFactor: 1.0,
              ),
              DropdownButton<String>(
                value: userSelected,
                items: users.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newVal) {
                  setState(() {
                    userSelected = newVal;
                  });
                },
              ),
              TextField(
                controller: _commentController,
                maxLines: 8, //or null
              ),
              TextButton(
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.all(15)),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.blue)))),
                  child: SizedBox(
                    width: 100,
                    child: Center(
                      child: Text("Raise Query".toUpperCase(),
                          style: TextStyle(fontSize: 14)),
                    ),
                  ),
                  onPressed: () => {
                        Provider.of<ApprovalProviderModel>(context,
                                listen: false)
                            .raiseQuery(widget.approval.id, userSelected!,
                                _commentController.text),
                        Navigator.pop(context),
                        Navigator.pop(context)
                      }),
            ],
          ),
        ),
      ),
    );
  }
}
