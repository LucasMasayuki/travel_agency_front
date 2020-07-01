import 'package:http/http.dart' as http;
import 'package:xml/xml.dart' as xml;

import 'package:travel_agency_front/app/config/env.dart';

class ApiSoapService {
  Future get<T>(String path, String envelope) async {
    var client = http.Client();

    http.Response response = await client.post(
      "${Env.baseUrl}/$path",
      headers: {
        "Content-Type": "text/xml",
      },
      body: envelope,
    );

    var rawXmlResponse = response.body;

// Use the xml package's 'parse' method to parse the response.
    xml.XmlDocument parsedXml = xml.XmlDocument.parse(rawXmlResponse);

    print("DATAResult=" + response.body);
    print("DATAResult=" + parsedXml.toString());
  }
}
