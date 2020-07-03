import 'package:dio/dio.dart';
import 'package:xml/xml.dart' as xml;

import 'package:travel_agency_front/app/config/env.dart';

class ApiSoapService {
  final Dio _client;

  ApiSoapService(this._client);

  Future<Dio> getClient() async {
    // Base Url
    _client.options.baseUrl = Env.baseUrl;

    // Headers
    final headers = <String, String>{};

    headers['Content-Type'] = "text/xml";
    headers['Access-Control-Allow-Origin'] = "*";
    headers['Access-Control-Request-Method'] = "*";

    _client.options.headers = headers;
    print(_client.options.headers);
    return _client;
  }

  Future<Response<T>> post<T>(
    String path, {
    String envelope,
    Map<String, dynamic> queryParameters,
    Options options,
    CancelToken cancelToken,
    ProgressCallback onSendProgress,
    ProgressCallback onReceiveProgress,
  }) async {
    final client = await getClient();
    final response = await client.post(path,
        data: envelope,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress);

    //var rawXmlResponse = response.body;

// Use the xml package's 'parse' method to parse the response.
    //xml.XmlDocument parsedXml = xml.XmlDocument.parse(rawXmlResponse);

    //print("DATAResult=" + response.body);
    //print("DATAResult=" + parsedXml.toString());
    return response;
  }
}
