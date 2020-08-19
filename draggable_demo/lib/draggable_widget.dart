import 'package:flutter/material.dart';

class DraggableWidget extends StatefulWidget {
  final Offset offset;
  final Color color;
  DraggableWidget({Key key, this.offset, this.color}) : super(key: key);
  @override
  _DraggableWidgetState createState() => _DraggableWidgetState();
}

class _DraggableWidgetState extends State<DraggableWidget> {
  Offset _offset = Offset(0.0, 0.0);
  @override
  void initState() {
    _offset = widget.offset;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: _offset.dx,
      top: _offset.dy,
      child: Draggable(
        data: widget.color,
        child: Container(
          width: 100.0,
          height: 100.0,
          color: widget.color,
        ),
        feedback: Container(
          width: 100.0,
          height: 100.0,
          color: widget.color.withOpacity(0.5),
        ),
        onDraggableCanceled: (velocity, offset) {
          setState(() {
            _offset = offset;
          });
        },
      ),
    );
  }
}
