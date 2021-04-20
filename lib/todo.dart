import 'package:flutter/material.dart';

class Todo extends StatefulWidget {
  @override
  _TodoState createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  double _height;
  double _width;

  final List<String> _listViewData = [
    "Call about Appointment",
    "Edit API Documentation",
    "Set up user focus group",
    "Coffee with Sam",
    "Meet with Sales",
    "Set up user focus group",
    "Coffee with Sam",
    "Meet with Sales",
  ];
  List<String> items = List<String>.generate(7, (index) {
    return "Item - $index";
  });

  final teController = TextEditingController(
    text: "",
  );

  @override
  void dispose() {
    teController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.transparent,
          body: myTodo(),
        ),
      ],
    );
  }

  Widget myTodo() {
    return Container(
        color: Colors.white,
        height: _height * 80,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            SizedBox(height: 80),
            Text("MY TODO APP",style: TextStyle(
                color: Colors.grey[800],
                fontWeight: FontWeight.bold,
                fontSize: 40)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.all(10),
                height: 70,
                alignment: Alignment(0, 0),
                color: Colors.orange,
                child: Text(
                  "To REMOVE THE TASK YOU CAN SWIP",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _listViewData.length,
                itemBuilder: (context, index) {
                  final item = _listViewData[index];
                  return Dismissible(
                    key: Key(item),
                    direction: DismissDirection.startToEnd,
                    child: ListTile(
                      title: Text(item),
                      trailing: IconButton(
                        icon: Icon(Icons.delete_forever),
                        onPressed: () {
                          setState(() {
                            _listViewData.removeAt(index);
                          });
                        },
                      ),
                    ),
                    onDismissed: (direction) {
                      setState(() {
                        _listViewData.removeAt(index);
                      });
                    },
                  );
                },
              ),
            ),
            Divider(
              color: Colors.grey,
              height: 5,
              indent: 10,
              endIndent: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                children: <Widget>[
                  Text("INSERT TASK:"),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        controller: teController,
                        onSubmitted: (text) {
                          setState(() {
                            if (teController.text != "") {
                              _listViewData.add(teController.text);
                            }
                          });
                          teController.clear();
                        },
                      ),
                    ),
                  ),
                  RaisedButton(
                    child: Text("ADD"),
                    onPressed: () {
                      setState(() {
                        if (teController.text != "") {
                          _listViewData.add(teController.text);
                        }
                      });
                      teController.clear();
                    },
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
