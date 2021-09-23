import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class RequestsCalls {
  // final ApiClient apiClient;
  // final baseUrl = "http://relsify-backend.herokuapp.com/api";
  // final baseUrl = "http://localhost:3000/api/";
  final baseUrl = "http://10.0.2.2:3000/api";

  final FlutterSecureStorage storage = new FlutterSecureStorage();

  Future<http.Response> get(String url) async {
    // final data = await apiClient.dioRequest.get(url);
    print("$baseUrl/$url");
    final String token = await storage.read(key: "token") ?? "";
    final response = await http.get(
      Uri.parse("$baseUrl/$url"),
      headers: {
        // "content-type": "application/json",
        HttpHeaders.authorizationHeader: token
      },
    );
    return response;
  }

  Future<http.Response> post(String url, Map<String, dynamic> data) async {
    // final response = await apiClient.dioRequest.post(url, data: data);
    String token = await storage.read(key: "token") ?? "";
    print("$baseUrl/$url");
    final response = await http.post(
      Uri.parse("$baseUrl/$url"),
      body: json.encode(data),
      headers: {
        "content-type": "application/json",
        HttpHeaders.authorizationHeader: token
      },
    );
    // return response;
    return response;
  }

  Future<http.Response> loginPost(String url, Map<String, dynamic> data) async {
    // // final response = await apiClient.dioRequest.post(url, data: data);
    // String token = await storage.read(key: "token") ?? "";
    print(data);
    print("$baseUrl/$url");
    final response = await http.post(
      Uri.parse("$baseUrl/$url"),
      body: json.encode(data),
      headers: {
        "content-type": "application/json",
        // HttpHeaders.authorizationHeader: token
      },
    );
    print(response.body);
    storage.write(key: "token", value: json.decode(response.body)["token"]);
    // return response;
    return response;
  }
}
