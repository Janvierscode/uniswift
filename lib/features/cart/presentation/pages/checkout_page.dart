import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/primary_button.dart';
import '../bloc/cart_bloc.dart';
import '../bloc/cart_event.dart';
import '../bloc/cart_state.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final _addressController = TextEditingController(text: 'Dorm Block A, Room 102');
  String _selectedPaymentMethod = 'EcoCash';

  final List<String> _paymentMethods = [
    'EcoCash',
    'OneMoney',
    'InnBucks',
    'Omari',
    'Visa / Mastercard'
  ];

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartBloc, CartState>(
      listener: (context, state) {
        if (state is CheckoutProcessing) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => const Center(child: CircularProgressIndicator()),
          );
        } else if (state is CheckoutSuccess) {
          // Close loading dialog
          if (Navigator.of(context).canPop()) {
             Navigator.of(context).pop(); 
          }
          context.go('/confirmation');
        } else if (state is CartError) {
          if (Navigator.of(context).canPop()) {
             Navigator.of(context).pop(); 
          }
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Checkout'),
          elevation: 0,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Delivery Address', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              TextField(
                controller: _addressController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                ),
              ),
              const SizedBox(height: 32),
              const Text('Payment Method', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              ..._paymentMethods.map((method) => RadioListTile<String>(
                    title: Text(method),
                    value: method,
                    groupValue: _selectedPaymentMethod,
                    activeColor: AppColors.primary,
                    contentPadding: EdgeInsets.zero,
                    onChanged: (value) {
                      setState(() {
                        if (value != null) _selectedPaymentMethod = value;
                      });
                    },
                  )),
              const SizedBox(height: 48),
              PrimaryButton(
                text: 'Place Order',
                onPressed: () {
                  if (_addressController.text.trim().isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Please enter an address')),
                    );
                    return;
                  }
                  context.read<CartBloc>().add(
                        CheckoutCartEvent(
                          address: _addressController.text.trim(),
                          paymentMethod: _selectedPaymentMethod,
                        ),
                      );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
