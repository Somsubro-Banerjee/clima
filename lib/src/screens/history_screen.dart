
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:clima/main.dart';

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {

  Future getPost() async{
    var firestore = FirebaseFirestore.instance;
    QuerySnapshot qn = await firestore.collection("users").get();
    return qn.docs;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStateContainer.of(context).theme.primaryColor,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add,
        color: AppStateContainer.of(context).theme.primaryColor),
        onPressed: () => print("Lemon water"),
        backgroundColor: AppStateContainer.of(context).theme.accentColor,
      ),
      appBar: AppBar(
        backgroundColor: AppStateContainer.of(context).theme.primaryColor,
        title: Text("HISTORY",
        style: TextStyle(
          fontSize: 30
        ),
        ),
      ),
      body: Container(
        child: FutureBuilder(
          future: getPost(),
          builder: (_, snapshot){
          if(snapshot.connectionState == ConnectionState.waiting ){
            return Center(child: Text("Lemon"),);
          }else{
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(snapshot.data[index].data()['City Name'].toString(),
                  style: TextStyle(
                    color: AppStateContainer.of(context).theme.accentColor
                  )
                  )
                );
               },
            );
          }
        },),
      ),
    );
  }
}