import 'package:flutter/material.dart';
import 'package:tooltip_example/main.dart';
import 'package:tooltip_example/widget/button_widget.dart';

class TheoreticalTooltipPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(MyApp.title),
          actions: [
            IconButton(
              tooltip: 'Search',
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
            Tooltip(
              message: 'Menu',
              child: IconButton(
                icon: Icon(Icons.more_vert),
                onPressed: () {},
              ),
            ),
          ],
        ),
        body: Center(
          child: ListView(
            padding: EdgeInsets.all(32),
            children: [
              Tooltip(
                message: 'Tooltip TextStyle',
                textStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                child: buildButton('Tooltip TextStyle'),
              ),
              Tooltip(
                message: 'Tooltip Decoration',
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  gradient: LinearGradient(colors: [Colors.amber, Colors.red]),
                ),
                child: buildButton('Tooltip Decoration'),
              ),
              Tooltip(
                message: 'Tooltip Set Height',
                height: 50,
                child: buildButton('Tooltip Set Height'),
              ),
              Tooltip(
                message: 'Tooltip Above',
                preferBelow: false,
                child: buildButton('Tooltip Above'),
              ),
              Tooltip(
                message: 'Tooltip Longer Visible',
                showDuration: Duration(seconds: 3),
                child: buildButton('Tooltip Longer Visible'),
              ),
              Tooltip(
                message: 'Tooltip Wait (Web)',
                waitDuration: Duration(seconds: 1),
                child: buildButton('Tooltip Wait (Web)'),
              ),
              Tooltip(
                message: 'Tooltip Padding',
                padding: EdgeInsets.all(20),
                child: buildButton('Tooltip Padding'),
              ),
            ],
          ),
        ),
        floatingActionButton: Tooltip(
          message: 'Add User',
          preferBelow: false,
          verticalOffset: 40,
          child: FloatingActionButton(
            // tooltip: 'Add User',
            child: Icon(Icons.add),
            onPressed: () {},
          ),
        ),
      );

  Widget buildButton(String text) => Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        child: ButtonWidget(
          text: text,
          onClicked: () {},
        ),
      );
}
