/* dartpad.dev */

main() async {
  first();
  await second();
  await third('main');
}

void first() {
  print('first');
}

Future second() async {
  print('second start');

  await third('B (second)');

  print('second end');
}

Future third(String from) async {
  print('third start from $from');

  /* that 'await' change the way */ await Future(() {
    print('Future start from $from');
  }).then((_) {
    print('Future end from $from');
  });

  print('third end from $from');
}
