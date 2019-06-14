import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class StoriesService {

  /*
  * GET stories, Fake data
  * */
  Future<List> getStories() async {
    String url = 'http://www.json-generator.com/api/json/get/crbxxefHTm?indent=2';
    final response = await http.get(Uri.encodeFull(url), headers: {"Accept": "application/json"});
    return json.decode(response.body);
  }
  /*
  * GET Story , Fake data
  * */
  Future<List> getStory() async {
    String url = 'http://www.json-generator.com/api/json/get/cebQmoItHC?indent=2';
    final response = await http.get(Uri.encodeFull(url), headers: {"Accept": "application/json"});
    return json.decode(response.body);
  }

}
