import 'package:xml/xml.dart';

class XmlUtils {
  static String serchResult(XmlElement xml, String key) {
    return xml.findAllElements(key).map((e) => e.innerText).isEmpty
        ? ""
        : xml.findAllElements(key).map((e) => e.innerText).first;
  }
}
