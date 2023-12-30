import 'package:flutter/material.dart';
import 'package:tender_sankalp/models/tender.dart';
import 'package:tender_sankalp/tenders_list/tender_item.dart';

class TenderList extends StatelessWidget {
  const TenderList({required this.tenders, super.key});

  final List<Tender> tenders;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tenders.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 0,
          child: TenderItem(tenders[index]),
        );
      },
    );
  }
}
