import 'package:foodinformation/src/utils/xml_utils.dart';
import 'package:xml/xml.dart';

class TodaysFoodModle {
  String? MLSV_YMD;
  String? DDISH_NM;
  String? CAL_INFO;

  TodaysFoodModle({
    this.MLSV_YMD,
    this.CAL_INFO,
    this.DDISH_NM,
  });

  factory TodaysFoodModle.fromXml(XmlElement xml) {
    return TodaysFoodModle(
      MLSV_YMD: XmlUtils.serchResult(xml, "MLSV_YMD"),
      CAL_INFO: XmlUtils.serchResult(xml, "CAL_INFO"),
      DDISH_NM: XmlUtils.serchResult(xml, "DDISH_NM"),
    );
  }
}
