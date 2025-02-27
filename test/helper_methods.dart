import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

import 'chart/data_pool.dart';

void main() {
  test('test equalsPaths', () {
    expect(HelperMethods.equalsPaths(MockData.path1, MockData.path1Duplicate),
        true);
    expect(HelperMethods.equalsPaths(MockData.path1, MockData.path2), false);
  });
}

class HelperMethods {
  static bool equalsPaths(Path path1, Path path2) {
    final metrics1 = path1.computeMetrics().toList();
    final metrics2 = path2.computeMetrics().toList();
    if (metrics1.length != metrics2.length) {
      return false;
    }
    for (int i = 0; i < metrics1.length; i++) {
      if (metrics1[i].length != metrics2[i].length) {
        return false;
      }
      if (metrics1[i].isClosed != metrics2[i].isClosed) {
        return false;
      }
      if (metrics1[i].contourIndex != metrics2[i].contourIndex) {
        return false;
      }
      final half = metrics1[i].length / 2;
      final tangent1 = metrics1[i].getTangentForOffset(half);
      final tangent2 = metrics2[i].getTangentForOffset(half);
      if (tangent1!.position != tangent2!.position) {
        return false;
      }
      if (tangent1.angle != tangent2.angle) {
        return false;
      }
      if (tangent1.vector != tangent2.vector) {
        return false;
      }
    }
    return true;
  }
}
