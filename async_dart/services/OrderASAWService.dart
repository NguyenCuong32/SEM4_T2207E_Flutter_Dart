// Example using async, await
class OrderASAWService {
  Future<String> fetchUserOrder() => Future.delayed(
        const Duration(seconds: 3),
        () => 'Iphone 15',
      );

  Future<void> showUserOrder() async {
    print('Start an order');
    var order = await fetchUserOrder();
    print('Your order $order');
    print('End order');
  }
}
