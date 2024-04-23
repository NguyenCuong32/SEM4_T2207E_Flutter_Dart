class OrderService {
  Future<String> fetchUserOrder() => Future.delayed(
        const Duration(seconds: 3),
        () => 'Iphone 15',
      );
  Future<String> createNewOrder() async {
    var order = await fetchUserOrder();
    return 'Your order is: $order';
  }
}
