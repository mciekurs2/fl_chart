import 'dart:ui';
import 'package:path_drawing/path_drawing.dart';

void drawDashedLine(Canvas canvas, Offset from, Offset to, Paint painter, List<int> dashArray) {
  Path path = Path();
  path.moveTo(from.dx, from.dy);
  path.lineTo(to.dx, to.dy);
  path = toDashedPath(path, dashArray);
  canvas.drawPath(path, painter);
}

/// get a dashed(or solid) path from a path
Path toDashedPath(Path path, List<int> dashArray) {
  if (path != null && dashArray != null) {
    final castedArray = dashArray.map((value) => value.toDouble()).toList();
    final dashedPath = dashPath(path, dashArray: CircularIntervalList<double>(castedArray));

    return dashedPath;
  } else {
    return path;
  }
}
