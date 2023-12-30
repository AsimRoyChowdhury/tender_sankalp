import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;
import 'package:tender_sankalp/models/tender.dart';

class ECLTenderData {
  List<Tender> ecltenderinfo = [];

  Future getData() async {
    final url = Uri.parse(
        'https://secureloginecl.co.in/tenders/tender_list_adv_search.php?pid=6');
    final response = await http.get(url);
    dom.Document html = dom.Document.html(response.body);

    final datas = html
        .getElementsByClassName('data')
        .map((element) => element.innerHtml.trim())
        .toList();

    for (int i = 0; i < datas.length ~/ 7; i++) {
      if (datas[(i * 7) + 4].split('<').length > 3) {
        Tender val = Tender(
          tendernumber: datas[(i * 7) + 1].split('<')[1].split('>')[1],
          title: datas[(i * 7) + 2].split('<')[0],
          lastdateofsub:
              "${datas[(i * 7) + 4].split('<')[1].split('>')[1]} ${datas[(i * 7) + 4].split('<')[3].split('>')[1]}",
          dateofopening:
              "${datas[(i * 7) + 5].split('<')[1].split('>')[1]} ${datas[(i * 7) + 5].split('<')[3].split('>')[1]}",
          link: "https://secureloginecl.co.in/tenders/tender_details.php?pid=6&id=${datas[(i * 7) + 6].split('=')[7].split("'")[0]}",
        );
        ecltenderinfo.add(val);
      } else {
        Tender val = Tender(
          tendernumber: datas[(i * 7) + 1].split('<')[1].split('>')[1],
          title: datas[(i * 7) + 2].split('<')[0],
          lastdateofsub:
              datas[(i * 7) + 4].split('<')[1].split('>')[1],
          dateofopening:
              "${datas[(i * 7) + 5].split('<')[1].split('>')[1]} ${datas[(i * 7) + 5].split('<')[3].split('>')[1]}",
          link: "https://secureloginecl.co.in/tenders/tender_details.php?pid=6&id=${datas[(i * 7) + 6].split('=')[7].split("'")[0]}",
        );
        ecltenderinfo.add(val);
      }
      // ecltenderinfo[i].tendernumber =
      //     datas[(i * 7) + 1].split('<')[1].split('>')[1];
      // ecltenderinfo[i].title = datas[(i * 7) + 2].split('<')[0];
      // if (datas[(i * 7) + 4].split('<').length > 3) {
      //   ecltenderinfo[i].lastdateofsub =
      //       "${datas[(i * 7) + 4].split('<')[1].split('>')[1]} ${datas[(i * 7) + 4].split('<')[3].split('>')[1]}";
      // } else {
      //   ecltenderinfo[i].lastdateofsub =
      //       datas[(i * 7) + 4].split('<')[1].split('>')[1];
      // }
      // ecltenderinfo[i].dateofopening =
      //     "${datas[(i * 7) + 5].split('<')[1].split('>')[1]} ${datas[(i * 7) + 5].split('<')[3].split('>')[1]}";
    }
    //   final titles = html
    //       .querySelectorAll(
    //           'body > table > tbody > tr:nth-child(3) > td > table:nth-child(5) > tbody > tr:nth-child(2) > td:nth-child(3)')
    //       .map((e) => e.innerHtml.trim())
    //       .toList();

    // final lastdateofsubs = html
    //     .querySelectorAll(
    //         'body > table > tbody > tr:nth-child(3) > td > table:nth-child(5) > tbody > tr:nth-child(2) > td:nth-child(5)')
    //     .map((e) => e.innerHtml.trim())
    //     .toList();

    // final dateofopenings = html
    //     .querySelectorAll(
    //         'body > table > tbody > tr:nth-child(3) > td > table:nth-child(5) > tbody > tr:nth-child(2) > td:nth-child(6)')
    //     .map((e) => e.innerHtml.trim())
    //     .toList();

    // ecltenderinfo = List.generate(
    //   numbers.length,
    //   (index) => Tender(
    //       tendernumber: numbers[index],
    //       title: titles[index],
    //       lastdateofsub: lastdateofsubs[index],
    //       dateofopening: dateofopenings[index]),
    // );
    print("https://secureloginecl.co.in/tenders/tender_details.php?pid=6&id=${datas[(0 * 7) + 6].split('=')[7].split("'")[0]}");
    // print(datas.length ~/ 7);
    // print(datas[(0 * 7) + 1].split('<')[1].split('>')[1]);
  }
}
