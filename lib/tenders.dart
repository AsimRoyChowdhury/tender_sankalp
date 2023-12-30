import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tender_sankalp/data/ecl_tender_data.dart';
import 'package:tender_sankalp/tenders_list/tender_item.dart';
import 'package:tender_sankalp/tenders_list/tender_list.dart';
import 'package:url_launcher/url_launcher.dart';

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
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  void fetchdata() {
    setState(() {
      _tenderData.ecltenderinfo
          .removeRange(0, _tenderData.ecltenderinfo.length);
      _loadData();
    });
  }

  Widget dataFetchSuccess() {
    return TenderList(tenders: _tenderData.ecltenderinfo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
        toolbarHeight: 75.0,
        centerTitle: true,
        // leading: IconButton(
        //   onPressed: () {},
        //   icon: const Icon(
        //     Icons.menu,
        //     color: Colors.white,
        //   ),
        // ),
        backgroundColor: Colors.deepOrangeAccent,
        title: Text(
          'TenderAlok'.toUpperCase(),
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
              color: Colors.white,
              letterSpacing: 2.0),
        ),
        actions: [
          IconButton(
            onPressed: () {
              fetchdata();
            },
            icon: const Icon(Icons.refresh_rounded, color: Colors.white),
          ),
        ],
      ),
      drawer: Drawer(
        elevation: 0,
        backgroundColor: Colors.deepOrangeAccent,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 8, 12, 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 80,
                  ),
                  Text(
                    'TenderAlok'.toUpperCase(),
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2.5),
                  ),
                  Divider(
                    thickness: 2,
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextButton(
                    style: ButtonStyle(
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.zero)),
                      ),
                      // padding: MaterialStatePropertyAll(
                      //   EdgeInsets.only(left: 0),
                      // ),
                      backgroundColor: MaterialStatePropertyAll(Colors.black26),
                    ),
                    onPressed: () {},
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.star_rate_rounded, color: Colors.white),
                        SizedBox(
                          width: 12,
                        ),
                        Text(
                          'Favourite Tenders',
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton(
                    style: ButtonStyle(
                        padding:
                            MaterialStatePropertyAll(EdgeInsets.only(left: 0))),
                    onPressed: () {
                      launchUrl(
                          Uri.https('maruticomputerasansol.business.site'),
                          mode: LaunchMode.inAppBrowserView);
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Created and Managed by',
                          style: GoogleFonts.poppins(color: Colors.white),
                        ),
                        Text(
                          'Maruti Computers',
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'All information are collected from \nwww.easterncoal.nic.in',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 0,
                color: Colors.lightGreen[200],
                shape: const RoundedRectangleBorder(
                    side: BorderSide(color: Colors.green),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 5.0),
                  child: Text(
                    'Total Available Tenders: ${_tenderData.ecltenderinfo.length}',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.green[900]),
                  ),
                ),
              ),
            ),
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
