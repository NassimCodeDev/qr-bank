import 'package:qr_bank/data/model/help_properties.dart';

class HelpBank {
  List<HelpProperties> helpList = [
    HelpProperties(title: 'title', description: 'description'),
    HelpProperties(title: 'title', description: 'description'),
    HelpProperties(title: 'title', description: 'description'),
    HelpProperties(title: 'title', description: 'description'),
    HelpProperties(title: 'title', description: 'description'),
    HelpProperties(title: 'title', description: 'description'),
    HelpProperties(title: 'title', description: 'description'),
    HelpProperties(title: 'title', description: 'description'),
    HelpProperties(title: 'title', description: 'description'),
    HelpProperties(title: 'title', description: 'description'),
    HelpProperties(title: 'title', description: 'description'),
    HelpProperties(title: 'title', description: 'description'),
    HelpProperties(title: 'title', description: 'description'),
    HelpProperties(title: 'title', description: 'description'),
    HelpProperties(title: 'title', description: 'description'),
  ];

  String getTitle(int index) {
    return helpList[index].title;
  }

  String getDescription(int index) {
    return helpList[index].description;
  }

  int getLength() {
    return helpList.length;
  }
}
