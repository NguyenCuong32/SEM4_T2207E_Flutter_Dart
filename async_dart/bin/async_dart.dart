import 'package:async_dart/async_dart.dart' as async_dart;
import 'package:test/test.dart';

import '../services/OrderASAWService.dart';
import '../services/OrderService.dart';
// Main is synchonus
// void main(List<String> arguments) {
//   OrderService orderService = new OrderService();
//   print(orderService.createNewOrder());
// }

// main is asynchronous
// Future<void> main(List<String> arguments) async {
//   OrderService orderService = new OrderService();
//   print(await orderService.createNewOrder());
// }

//
// main is using asyn await
Future<void> main(List<String> arguments) async {
  print('Start demo');
  countSeconds(5);
  viewOrtherItem();
  OrderASAWService asawService = new OrderASAWService();
  await asawService.showUserOrder();
  print('End demo');
}

void countSeconds(int s) {
  for (var i = 1; i <= s; i++) {
    Future.delayed(Duration(seconds: i), () => print(i));
  }
}

void viewOrtherItem() {
  print('User view some other items');
}
