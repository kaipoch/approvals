import 'package:approvals/constants.dart';
import 'package:approvals/models/queries.dart';
import 'package:approvals/models/query_provider_model.dart';
import 'package:approvals/screens/queries/components/audit.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class QueryDetailScreen extends StatelessWidget {
  Query query;
  Color statusColor = Colors.yellow;
  final _commentController = TextEditingController();
  QueryDetailScreen({Key? key, required this.query}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (query.status == "PENDING_QUERY") {
      statusColor = Colors.orangeAccent;
    } else if (query.status == "CLOSED_QUERY") {
      statusColor = Colors.green;
    }
    return Scaffold(
        appBar: AppBar(
          backgroundColor: homeScreenPrimaryColor,
          title: Text(
            query.mailSubject,
            style: const TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.bold,
                fontSize: 13),
            textScaleFactor: 1.0,
          ),
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
                                .format(query.updatedAt),
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
                          query.status,
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
                              query.type,
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
                              query.businessApplication,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 8),
                              textScaleFactor: 1.0,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Raised By : ${query.initiator}',
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
                          query.mailContent,
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
                  histories: query.history,
                ),
              ),
              query.status == "PENDING_QUERY"
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: _commentController,
                        decoration:
                            const InputDecoration(hintText: "Enter Comment"),
                      ),
                    )
                  : SizedBox.shrink(),
              query.status == "PENDING_QUERY"
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
                                child: Text("Close".toUpperCase(),
                                    style: TextStyle(fontSize: 14)),
                              ),
                            ),
                            onPressed: () => {
                                  Provider.of<QueryProviderModel>(context,
                                          listen: false)
                                      .closeQuery(
                                          query.id, _commentController.text),
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
