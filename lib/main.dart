import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List messages = ['one', 'two'];

  @override
  void initState() {
    listenToMessages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firestore Demo'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                  itemCount: messages.length,
                  itemBuilder: (context, index){
                    return Text(messages[index]);
                  }
                ),
              ),
              RaisedButton(
                onPressed: getMessages,
                child: Text('Load Data'),
              ),
              TextField(
                onSubmitted: (text) => addMessage(text),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  void getMessages(){
    Firestore.instance.collection('messages').getDocuments().then((QuerySnapshot querySnapshot){
      setState(() {
        messages = querySnapshot.documents.map((message) => message['text']).toList();
      });
    });
  }

  void listenToMessages(){
    Firestore.instance.collection('messages').snapshots().listen((QuerySnapshot querySnapshot){
      setState(() {
        messages = querySnapshot.documents.map((message) => message['text']).toList();
      });
    });
  }

  void addMessage(String message){
    Firestore.instance.collection('messages').add({'text': message});
  }
}
