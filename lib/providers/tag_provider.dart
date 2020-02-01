import 'package:flutter/foundation.dart';

const contentJson = '''
''';

class MomentTag {
  String _title;
  bool _checked = false;

  MomentTag({@required title, @required checked}) {
    this._title = title;
    this._checked = checked;
  }

  void toggleIsChecked() {
    this._checked = !this._checked;
  }

  String get title {
    return this._title;
  }

  bool get checked {
    return this._checked;
  }
}

class MomentTaglist extends ChangeNotifier{

  List<MomentTag> tags = [
    MomentTag(title: 'Encampment', checked: false),
    MomentTag(title: 'Health / Safety Risk', checked: false),
    MomentTag(title: 'Needles / Drug Paraphernalia ', checked: false),
  ];

  Future<void> fetchTags() async {
    // final contentURL =
    //     'https://www.levi.com/omni-cms-gw-exp-api/v1/levicom/online/homepage?country=US&language=en_US&type=homepage_v2&include[]=ref__marketing_layout_v1.ref__marketing_modules_v1';
    // final data = await http.get(contentURL);

    // final Map<String, dynamic> respBody = json.decode(data.body);
    // final respModules = respBody['entries'][0]['ref__marketing_layout_v1'][0]
    //     ['ref__marketing_modules_v1'];

    // final decodedJson = json.decode(contentJson) as Map<String, dynamic>;
    // final decodedJson = json.decode(respModules) as Map<String, dynamic>;
    // _modules = MarketingModules.fromJson({'ref__marketing_modules_v1': respModules}).refMarketingModulesV1;
    await Future<void>.value(null);
    
    notifyListeners();
  }

}
