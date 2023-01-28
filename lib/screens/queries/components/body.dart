import 'package:approvals/models/queries.dart';
import 'package:approvals/models/query_provider_model.dart';
import 'package:approvals/screens/queries/components/query.dart';
import 'package:approvals/screens/queries/components/query_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var queryProvider = context.watch<QueryProviderModel>();
    List<Query> queries = queryProvider.queries;
    return queries.isEmpty
        ? const Center(
            child: Padding(
              padding: EdgeInsets.all(7.0),
              child: Text(
                "You have no Queries",
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
            itemCount: queries.length,
            itemBuilder: (_, index) => InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              QueryDetailScreen(query: queries[index])));
                },
                child: QueryBox(
                  query: queries[index],
                  index: index,
                )));
  }
}
