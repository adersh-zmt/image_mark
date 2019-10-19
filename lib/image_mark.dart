import 'package:flutter/material.dart';
import 'package:image_marker/provider/mark.dart';
import 'package:image_marker/provider/marker_provider.dart';
import 'package:image_marker/zoomable.dart';
import 'package:provider/provider.dart';

class ImageMark extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ZoomableWidget(
            child: GestureDetector(
              onTapUp: (tapUpDetails) {
                Provider.of<MarkerProvider>(context, listen: false).add(Mark(
                  x: tapUpDetails.localPosition.dx,
                  y: tapUpDetails.localPosition.dy,
                ));
              },
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/images/train.jpg'))),
                child: Consumer<MarkerProvider>(builder: (context, marker, _) {
                  return Stack(
                    fit: StackFit.passthrough,
                    children: marker.marks.map((mark) {
                      return Positioned(
                        left: mark.x - 15,
                        top: mark.y - 30,
                        child: GestureDetector(
                          child: Icon(Icons.room, size: 30,color: const Color.fromARGB(255, 255, 0, 0)),
                          onTap: () => {_showDialog(context)},
                        ),
                      );
                    }).toList(),
                  );
                }),
              ),
            ),
          );
  }

  _showDialog(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("<TestSutra Inspection Item>"),
          content: Center(child: new Text("<Form>")),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}