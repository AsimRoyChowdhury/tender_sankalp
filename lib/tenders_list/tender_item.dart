import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tender_sankalp/models/tender.dart';
import 'package:url_launcher/link.dart';
// import 'package:url_launcher/url_launcher.dart';

class TenderItem extends StatelessWidget {
  const TenderItem(this.tender, {super.key});

  final Tender tender;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Card(
        elevation: 0,
        color: Colors.deepOrange[100],
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                tender.tendernumber,
                style: GoogleFonts.poppins(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                tender.title,
                style: GoogleFonts.poppins(
                    fontSize: 18,
                    color: Colors.deepOrangeAccent,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              // Row(
              //   children: [
              //     Text(
              //       'Category: ',
              //       style: GoogleFonts.poppins(
              //         fontSize: 15,
              //         color: Colors.black,
              //       ),
              //     ),
              //     Text(
              //       'E and M',
              //       style: GoogleFonts.poppins(
              //           fontSize: 15,
              //           color: Colors.black,
              //           fontWeight: FontWeight.bold),
              //     ),
              //   ],
              // ),
              // Row(
              //   children: [
              //     Text(
              //       'Area: ',
              //       style: GoogleFonts.poppins(
              //         fontSize: 15,
              //         color: Colors.black,
              //       ),
              //     ),
              //     Text(
              //       'Kenda',
              //       style: GoogleFonts.poppins(
              //           fontSize: 15,
              //           color: Colors.black,
              //           fontWeight: FontWeight.bold),
              //     ),
              //   ],
              // ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Last Date of Sub:',
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    tender.lastdateofsub,
                    style: GoogleFonts.poppins(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Date of Opening: ',
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    tender.dateofopening,
                    style: GoogleFonts.poppins(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                        Colors.deepOrange[500],
                      ),
                    ),
                    onPressed: () async {
                      await Share.share(tender.link);
                    },
                    icon: const Icon(Icons.share),
                    color: Colors.amber[200],
                  ),
                  Row(
                    children: [
                      // TextButton(
                      //   style: ButtonStyle(
                      //       backgroundColor:
                      //           MaterialStatePropertyAll(Colors.blue[400])),
                      //   onPressed: () {},
                      //   child: Text(
                      //     'Notify Me'.toUpperCase(),
                      //     style: GoogleFonts.poppins(color: Colors.white),
                      //   ),
                      // ),
                      // const SizedBox(
                      //   width: 4,
                      // ),
                      Link(
                        uri: Uri.parse(tender.link),
                        target: LinkTarget.self,
                        builder: (context, openlink) => TextButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.green[400])),
                          onPressed: openlink,
                          child: Text(
                            'View More'.toUpperCase(),
                            style: GoogleFonts.poppins(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
