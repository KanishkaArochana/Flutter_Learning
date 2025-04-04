import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:future_builder/models/Users.dart';
import 'package:future_builder/screens/details.dart';
import 'package:http/http.dart' as http; //Import http pakage

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
//Create Future function
  Future<List<User>> getUsers() async {
    //Create URL
    var url = Uri.parse('https://randomuser.me/api/?results=20');
    //Create respose type variable
    late http.Response response;

//Crete List in user type
    List<User> users = [];

    try {
      response = await http.get(url); //get response --->When await response
      //Identify the response state
      if (response.statusCode == 200) {
        Map peopleData =
            jsonDecode(response.body); //Using Map (Convert Joson decode)
        List<dynamic> people =
            peopleData["results"]; //Using List (data type dynamic)

        //Using for In loop
        for (var item in people) {
          var email = item['email'];
          var name = item['name']['first'] + " " + item['name']['last'];
          var id = item['login']['uuid'];
          var avatar = item['picture']['large'];
          User user =
              User(id, name, email, avatar); //Create new user using user model
          users.add(user); //Add user
        }
      } else {
        return Future.error(
            "Something gone wrong, ${response.statusCode}"); //return future error
      }
    } catch (e) {
      return Future.error(
          e.toString()); //Future error (Object convert string(toString))
    }
    return users;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Future Builder"),
        ),
        //Use FutureBuilder
        body: FutureBuilder(
            future: getUsers(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              //Look at connection state
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: Text('Waiting'),
                );
              } else {
                if (snapshot.hasError) {
                  //if has snapshor error
                  return Text(snapshot.error.toString());
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundImage:
                                NetworkImage(snapshot.data[index].avatar),
                          ),
                          title: Text(snapshot.data[index].name),
                          subtitle: Text(snapshot.data[index].email),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    UserDetail(snapshot.data[index]),
                              ),
                            );
                          },
                        );
                      });
                }
              }
            }),
      ),
    );
  }
}
