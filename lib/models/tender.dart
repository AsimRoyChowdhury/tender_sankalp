import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Tender {
  Tender({
    required this.title,
    required this.tendernumber,
    required this.lastdateofsub,
    required this.dateofopening,
    required this.link,
    this.category,
    this.area,
  }) : id = uuid.v4();

  final String id;
  String title;
  String tendernumber;
  String lastdateofsub;
  String dateofopening;
  String link;
  String? category;
  String? area;
}
