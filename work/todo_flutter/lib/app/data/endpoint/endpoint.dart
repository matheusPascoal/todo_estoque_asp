// import 'package:dio/dio.dart';
// import 'package:todo_flutter/app/data/adapters/todo_adapters.dart';
// import 'package:todo_flutter/app/interactor/models/todo_model.dart';

// class Endpoint {
//   final Dio dio = Dio();
//   final String baseUrl = 'https://jsonplaceholder.typicode.com';

//   Future<List<TodoModel>> getPosts() async {
//     List<TodoModel> posts = [];

//     try {
//       final response = await dio.get('$baseUrl/posts');
//       if (response.statusCode == 200) {
//         List<dynamic> data = response.data;
//         posts = data.map((json) => TodoAdapters.fromMap(json)).toList();
//       } else {
//         throw Exception('Failed to load posts');
//       }
//     } catch (e) {
//       throw Exception('Failed to load posts: $e');
//     }

//     return posts;
//   }
// }
