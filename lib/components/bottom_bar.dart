import 'package:flutter/material.dart';
import 'package:flutter_app/helper/widget_helper.dart';

class BottomBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onSelectedChange;

  const BottomBar(
      {super.key, required this.selectedIndex, required this.onSelectedChange});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(80)),
            border: Border.all(color: Colors.lightBlue, width: 2.0)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () => {if (selectedIndex != 0) onSelectedChange(0)},
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                    color:
                        selectedIndex == 0 ? Colors.green : Colors.transparent,
                    borderRadius: BorderRadius.all(Radius.circular(80))),
                child: Center(
                    child: Icon(
                  Icons.home,
                  size: 25,
                  color: selectedIndex == 0 ? Colors.white : Colors.black,
                )),
              ),
            ),
            spacerHorizontal(25),
            GestureDetector(
              onTap: () => {if (selectedIndex != 1) onSelectedChange(1)},
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                    color:
                        selectedIndex == 1 ? Colors.green : Colors.transparent,
                    borderRadius: BorderRadius.all(Radius.circular(80))),
                child: Center(
                    child: Icon(
                  Icons.camera,
                  size: 25,
                  color: selectedIndex == 1 ? Colors.white : Colors.black,
                )),
              ),
            ),
            spacerHorizontal(25),
            GestureDetector(
              onTap: () => {if (selectedIndex != 2) onSelectedChange(2)},
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                    color:
                        selectedIndex == 2 ? Colors.green : Colors.transparent,
                    borderRadius: BorderRadius.all(Radius.circular(80))),
                child: Center(
                    child: Icon(
                  Icons.settings,
                  size: 25,
                  color: selectedIndex == 2 ? Colors.white : Colors.black,
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
