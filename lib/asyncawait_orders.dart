/* dartpad.dev */

main() async {
  m1();
  m2();
}

void m1() {
  var list = <String>['one', 'two', 'three'];
  print('start');
  list.forEach((value) async {
    await delayedPrint(value);
  });
  print('end');
}

void m2() async {
  var list = <String>['one', 'two', 'three'];
  print('start');
  for (var i = 0; i < list.length; i++) {
    await delayedPrint(list[i]);
  }
  print('end');
}

Future<void> delayedPrint(String val) async {
  await Future.delayed(Duration(seconds: 1), () => print(val));
}
