// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.7

// Regression test for Issue #33890.
//
// This fails if type literal constants are not deferred, but their RTI
// representation is. This test however will not detect if we accidentally start
// building the RTI representation in the main deferred unit (which is what was
// happening before the bug was introduced).

import 'typedef_lib.dart' deferred as a;
import 'package:expect/expect.dart';

main() async {
  await a.loadLibrary();
  print(a.A); // unclear why without this the definition of A and B gets pulled
  print(a.B); // into the main output unit.
  Expect.isFalse(confuse(a.C) == confuse(a.D));
}

@pragma('dart2js:noInline')
confuse(x) => x;
