import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TenderItem extends StatelessWidget {
  const TenderItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.deepOrange[100],
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
        child: Column(
          children: [
            Text(
              'ECL/SID/AGENT/NIT/E&M/23-24/14 (SL NO.3), dt. 28-Dec-2023',
              style: GoogleFonts.poppins(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              'Repairining and overhauling of CDS Exchange of JK Unit of Siduli Coliery.',
              style: GoogleFonts.poppins(
                fontSize: 15,
                color: Colors.black,
              ),
            ),
            Row(
              children: [
                Text(
                  'Category: ',
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'E and M',
                  style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'Area: ',
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'Kenda',
                  style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Row(
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
                  '13 Jan 2024 upto 13:00 Hrs',
                  style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'Date of Opening: ',
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
                Text(
                  '13 Jan 2024 upto 16:30 Hrs',
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
                  onPressed: () {},
                  icon: const Icon(Icons.star_border_rounded),
                  color: Colors.amber[200],
                ),
                TextButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.blue[400])),
                    onPressed: () {},
                    child: Text(
                      'Notify Me'.toUpperCase(),
                      style: GoogleFonts.poppins(color: Colors.white),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
