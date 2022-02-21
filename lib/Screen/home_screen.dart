import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:j_note/Helper_class/sqlite_helper.dart';
import 'package:j_note/Screen/my_header_drawer.dart';

import 'my_list_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController desController = TextEditingController();
  List<Map<String, dynamic>> _getData = [];

  get id => null;
  getAllData() async {
    var list = await SqlHelper.getAllData();
    setState(() {
      _getData = list;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllData();
  }
  addNotes(int? id,String? title,String?des){
    if(title!=null && des!=null){
      titleController.text=title;
      desController.text=des;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "J_NOTE",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 25, color: Colors.red),
          ),
        ),
        body: Container(
          child: ListView.builder(
              itemCount: _getData.length,
              itemBuilder: (context, position) {
                return Container(
                  margin: EdgeInsets.all(10.0),
                  color: Colors.orange,
                  child: ListTile(
                    title: Text(
                      _getData[position]["title"].toString(),
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      _getData[position]["description"].toString(),
                      style: TextStyle(fontSize: 17, color: Colors.white),
                    ),
                    trailing: Wrap(
                      spacing: 15,
                      children: [
                        GestureDetector(
                          onTap: (){
                            addNotes(_getData[position]["id"], _getData[position]["title"], _getData[position]["description"]);

                          },
                          child: Icon(Icons.update),
                        ),
                        GestureDetector(
                          onTap: (){
                            SqlHelper.deleteData(_getData[position]["id"]);
                            getAllData();

                          },
                          child: Icon(Icons.delete),
                        )
                      ],
                    ),
                  ),
                );
              }),
        ),
        drawer: Drawer(
          child: Column(
            children: <Widget> [
              MyHeaderDrawer(),
              MyListItem()

            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            dialogShow();
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }



  void dialogShow() {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Container(
              height: 250,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                      child: TextFormField(
                        controller: titleController,
                        decoration: InputDecoration(
                            hintText: "Title", labelText: "Title"),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: desController,
                      decoration: InputDecoration(
                          hintText: "Description", labelText: "Description"),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 100,
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("Cancel")),
                        ),
                        Container(
                          width: 100,
                          child: ElevatedButton(
                              onPressed: () {
                                if(id==null){
                                  SqlHelper.insertData(titleController.text.toString(), desController.text.toString()).then((value) => {
                                    if(value!=-1){
                                      Text("Data Inserted")
                                    }else{
                                      Text("Faild")
                                    }
                                  });
                                }else{
                                  SqlHelper.updateData(id, titleController.text.toString(), desController.text.toString());
                                }
                                Navigator.of(context).pop(context);
                                getAllData();
                              },
                              child: Text(id==null ? "Save Data" : "Update Data")),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
