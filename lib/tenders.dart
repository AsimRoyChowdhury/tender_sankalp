import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tender_sankalp/tenders_list/tender_item.dart';

class Tenders extends StatelessWidget {
  const Tenders({super.key});

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
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Expanded(
              child: TenderItem(),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Expanded(
              child: TenderItem(),
            ),
          ),
        ],
      ),
    );
  }
}
