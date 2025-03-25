import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:assignment_task/cart_provider.dart';

class CartSummary extends ConsumerWidget {
  const CartSummary({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartProvider);

    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Cart Summary',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ...cart.map((item) => Text(
              '${item.product.name} x${item.quantity} - \$${item.totalPrice}')),
          const Divider(),
          Text('Total: \$${cart.fold(0.0, (sum, item) => sum + item.totalPrice)}',
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
