import 'package:approvals/models/approvals.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Audit extends StatelessWidget {
  List<History> histories;
  Audit({Key? key, required this.histories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: histories.length,
      itemBuilder: (context, i) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            contentPadding: EdgeInsets.all(10),
            tileColor: Colors.grey.shade50,
            title: Text(
              histories[i].queryFor.toString(),
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              histories[i].comments.toString(),
              style: TextStyle(fontSize: 10),
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${DateFormat('yyyy-MMM-dd hh:mm a').format(histories[i].createdAt)}',
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                ),
                Container(
                  padding: const EdgeInsets.all(7.0),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    color: Colors.black54,
                  ),
                  child: Text(
                    histories[i].status,
                    style: const TextStyle(color: Colors.white, fontSize: 9),
                    textScaleFactor: 1.0,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
