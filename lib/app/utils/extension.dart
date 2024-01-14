import 'package:flutter/material.dart';

extension Spacing on int {
  SizedBox get h {
    return SizedBox(
      height: toDouble(),
    );
  }

  SizedBox get w {
    return SizedBox(
      width: toDouble(),
    );
  }
}
