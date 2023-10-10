// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// import 'Post_model.dart';
//
// class ApiPage extends StatefulWidget {
//   const ApiPage({super.key,});
//
//   @override
//   State<ApiPage> createState() => _ApiPageState();
// }
//
// class _ApiPageState extends State<ApiPage> {
//   List<Post> postList = [];
//
//   Future<List<Post>> getPostApi() async {
//     final response = await http.get(Uri.parse
//       ('https://jsonplaceholder.typicode.com/posts'));
//
//     if (response.statusCode == 200) {
//       // Parse the JSON response into a list of Map<String, dynamic>
//       List<dynamic> data = jsonDecode(response.body);
//
//       // Clear the existing postList before adding new data
//       postList.clear();
//
//       // Iterate through the data list and create Post objects
//       for (Map<String, dynamic> item in data) {
//         Post post = Post.fromJson(item);
//         postList.add(post);
//       }
//       return postList;
//     } else {
//       throw Exception('Failed to load data');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text('API Learning'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: FutureBuilder(
//               future: getPostApi(),
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return Center(child: CircularProgressIndicator());
//                 } else if (snapshot.hasError) {
//                   return Center(child: Text('Error: ${snapshot.error}'));
//                 } else {
//                   return ListView.builder(
//                     itemCount: postList.length,
//                     itemBuilder: (context, index) {
//                       return ListTile(
//                         title: Text(postList[index].title),
//                         subtitle: Text(postList[index].body),
//                         leading: Text('S No:- '+postList[index].id.toString()),
//                         textColor: Colors.deepPurple,
//                         trailing: Text('ID:- '+postList[index].userId.toString()),
//                       );
//                     },
//                   );
//                 }
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }



class GetProducts {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  Rating? rating;

  GetProducts(
      {this.id,
        this.title,
        this.price,
        this.description,
        this.category,
        this.image,
        this.rating});

  GetProducts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    category = json['category'];
    image = json['image'];
    rating =
    json['rating'] != null ? new Rating.fromJson(json['rating']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['price'] = this.price;
    data['description'] = this.description;
    data['category'] = this.category;
    data['image'] = this.image;
    if (rating != null) {
      data['rating'] = rating!.toJson();
    }
    return data;
  }
}

class Rating {
  double? rate;
  int? count;

  Rating({this.rate, this.count});

  Rating.fromJson(Map<String, dynamic> json) {
    rate = json['rate'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rate'] = this.rate;
    data['count'] = this.count;
    return data;
  }
}

