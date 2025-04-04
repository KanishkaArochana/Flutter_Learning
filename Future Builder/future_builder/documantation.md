
# FutureBuilder Documentation in Flutter

### Introduction
The `FutureBuilder` widget is used to build widgets based on the latest snapshot of interaction with a `Future`. It’s useful when you need to perform an asynchronous task like fetching data from an API and display the result once the task is complete.

In this code, we use `FutureBuilder` to fetch user data from the API and display it.

### Step-by-Step Explanation

#### 1. Install `http` Package
Before using the `http` package, make sure it's installed. You need it to make HTTP requests to fetch the data.

Open the `pubspec.yaml` file and add the following dependencies:

```yaml
dependencies:
  flutter:
    sdk: flutter
  http: ^0.14.0  # Add this line
```

Then run:

```bash
flutter pub get
```

#### 2. Import Required Packages
We need the `http` package for network requests, and `dart:convert` for parsing the JSON response.

```dart
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:future_builder/models/Users.dart';
import 'package:future_builder/screens/details.dart';
import 'package:http/http.dart' as http; // Import the http package for making HTTP requests
```

#### 3. `FutureBuilder` Usage in Code

```dart
body: FutureBuilder(
    future: getUsers(),  // The future to be resolved
    builder: (BuildContext context, AsyncSnapshot snapshot) {
        // snapshot holds the data from the future
```

`FutureBuilder` requires two main arguments:
- `future`: This is the future that provides data. It’s the asynchronous task you're waiting on. Here, we call the `getUsers()` function that fetches data from the API.
- `builder`: A function that returns a widget depending on the current state of the `Future`.

#### 4. Handling Connection States
Inside the builder, we handle different states of the `Future`:

```dart
if (snapshot.connectionState == ConnectionState.waiting) {
    return Center(
        child: Text('Waiting'),
    );
}
```

`ConnectionState.waiting`: This state means the `Future` is still loading. We show a Waiting message while waiting for the response from the API.

#### 5. Error Handling

```dart
else {
    if (snapshot.hasError) {
        return Text(snapshot.error.toString());
    } else {
        // Data loaded successfully
        return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
                return ListTile(
                    leading: CircleAvatar(
                        backgroundImage: NetworkImage(snapshot.data[index].avatar),
                    ),
                    title: Text(snapshot.data[index].name),
                    subtitle: Text(snapshot.data[index].email),
                    onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UserDetail(snapshot.data[index]),
                            ),
                        );
                    },
                );
            });
    }
}
```

- `snapshot.hasError`: If an error occurs while fetching data (like network issues), we check for it and display the error message.
- Data Loaded: When the `Future` resolves without an error, we access the `snapshot.data` (the result of the `getUsers()` function), and build the widget list using `ListView.builder()`.

#### 6. `ListView.builder`

```dart
return ListView.builder(
    itemCount: snapshot.data.length,
    itemBuilder: (BuildContext context, int index) {
        return ListTile(
            leading: CircleAvatar(
                backgroundImage: NetworkImage(snapshot.data[index].avatar),
            ),
            title: Text(snapshot.data[index].name),
            subtitle: Text(snapshot.data[index].email),
            onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => UserDetail(snapshot.data[index]),
                    ),
                );
            },
        );
    });
```

- `ListView.builder`: This is used to display the list of users.
- `itemCount`: Specifies the number of items in the list, which is the length of `snapshot.data`.
- `itemBuilder`: Defines how each item in the list should be built. Here, it uses the `ListTile` widget to display each user's information.

#### 7. Handling Navigation
When a user taps on a list item, it navigates to the `UserDetail` screen:

```dart
onTap: () {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => UserDetail(snapshot.data[index]),
        ),
    );
},
```

`Navigator.push`: Navigates to the `UserDetail` screen and passes the selected User data to the next screen.

### Example Code
Here’s the full example of how `FutureBuilder` works in this case:

```dart
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<List<User>> getUsers() async {
    var url = Uri.parse('https://randomuser.me/api/?results=20');
    late http.Response response;
    List<User> users = [];

    try {
      response = await http.get(url);
      if (response.statusCode == 200) {
        Map peopleData = jsonDecode(response.body);
        List<dynamic> people = peopleData["results"];

        for (var item in people) {
          var email = item['email'];
          var name = item['name']['first'] + " " + item['name']['last'];
          var id = item['login']['uuid'];
          var avatar = item['picture']['large'];
          User user = User(id, name, email, avatar);
          users.add(user);
        }
      } else {
        return Future.error("Something went wrong: ${response.statusCode}");
      }
    } catch (e) {
      return Future.error(e.toString());
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
        body: FutureBuilder(
            future: getUsers(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: Text('Waiting...'));
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(snapshot.data[index].avatar),
                        ),
                        title: Text(snapshot.data[index].name),
                        subtitle: Text(snapshot.data[index].email),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => UserDetail(snapshot.data[index]),
                            ),
                          );
                        },
                      );
                    });
              }
            }),
      ),
    );
  }
}
```

### Summary
- `FutureBuilder` is a widget that allows us to asynchronously fetch data and update the UI when the data is ready.
- The builder function handles different states of the future: waiting, error, and completed.
- In this example, we’re using `FutureBuilder` to fetch user data and display it in a list.

I hope this helps! If you have any questions or need further clarification, feel free to ask.