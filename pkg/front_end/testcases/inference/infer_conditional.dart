// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/*@testedFeatures=inference*/
library test;

var a = 1 /*@target=num::==*/ == 2 ? 1 : 2.0;
var b = 1 /*@target=num::==*/ == 2 ? 1.0 : 2;

main() {
  a;
  b;
}
