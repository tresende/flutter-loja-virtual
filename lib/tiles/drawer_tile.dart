import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  final int page;
  final IconData icon;
  final String text;
  final PageController controller;

  DrawerTile(this.icon, this.text, this.controller, this.page);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.of(context).pop();
          this.controller.jumpToPage(this.page);
        },
        child: Container(
          height: 60,
          child: Row(
            children: <Widget>[
              Icon(
                icon,
                size: 32,
                color: this.controller.page.round() == this.page
                    ? Theme.of(context).primaryColor
                    : Colors.grey[700],
              ),
              SizedBox(width: 32),
              Text(
                text,
                style: TextStyle(
                  fontSize: 16,
                  color: this.controller.page.round() == this.page
                      ? Theme.of(context).primaryColor
                      : Colors.grey[700],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
