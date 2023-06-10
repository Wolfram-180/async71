/* dartpad.dev */

import 'dart:async';

main() async {
  var res = await AsyncWorker().start();
  print(res);
}

class AsyncWorker {
  final _completer = Completer<String>();

  Future<String> start() {
    _startSmth();
    return _completer.future;
  }

  Future<void> _startSmth() async {
    try {
      var res = await _doAsync();
      _finish(await _oneMoreAsync(res));
    } catch (e) {
      _error('Got error: $e');
    }
  }

  Future<String> _doAsync() async {
    return Future.delayed(Duration(seconds: 1), () {
      print('_doAsync complete');
      return 'One';
    });
  }

  Future<String> _oneMoreAsync(String info) async {
    return Future.delayed(Duration(seconds: 1), () {
      print('_oneMoreAsync complete');
      return '$info Two';
    });
  }

  void _finish(String res) {
    _completer.complete(res);
  }

  void _error(String error) {
    _completer.completeError(error);
  }
}
