import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tender_sankalp/data/ecl_tender_data.dart';
import 'package:tender_sankalp/tenders_list/tender_item.dart';
import 'package:tender_sankalp/tenders_list/tender_list.dart';

class Tenders extends StatefulWidget {
  const Tenders({super.key});

  @override
  State<Tenders> createState() {
    return _TendersState();
  }
}

class _TendersState extends State<Tenders> {
  late ECLTenderData _tenderData;

  @override
  void initState() {
    super.initState();
    _tenderData = ECLTenderData();
    _loadData();
  }

  Future<void> _loadData() async {
    await _tenderData.getData();
    setState(() {});
  }

  Widget loading() {
    return const Center(child: CircularProgressIndicator(),);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 75.0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.deepOrangeAccent,
        title: Text(
          'TenderSankalp'.toUpperCase(),
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
              color: Colors.white,
              letterSpacing: 2.0),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.refresh_rounded, color: Colors.white),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: _tenderData.ecltenderinfo.isNotEmpty
                  ? TenderList(tenders: _tenderData.ecltenderinfo)
                  : loading(),
            ),
          ],
        ),
      ),
    );
  }
}
