import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/widgets/primary_button.dart';
import '../bloc/profile_bloc.dart';
import '../bloc/profile_event.dart';
import '../bloc/profile_state.dart';

class SuggestProductPage extends StatefulWidget {
  const SuggestProductPage({Key? key}) : super(key: key);

  @override
  State<SuggestProductPage> createState() => _SuggestProductPageState();
}

class _SuggestProductPageState extends State<SuggestProductPage> {
  final _nameController = TextEditingController();
  final _descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if (state is ProfileSubmissionSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
          context.pop();
        } else if (state is ProfileError) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Suggest a Product')),
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Missing something? Tell us what you want UniSwift to add!'),
              const SizedBox(height: 24),
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Product Name', border: OutlineInputBorder()),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _descController,
                maxLines: 4,
                decoration: const InputDecoration(labelText: 'Why do you need it?', border: OutlineInputBorder()),
              ),
              const SizedBox(height: 32),
              BlocBuilder<ProfileBloc, ProfileState>(
                builder: (context, state) {
                  return PrimaryButton(
                    text: 'Submit Suggestion',
                    isLoading: state is ProfileSubmitting,
                    onPressed: () {
                      if (_nameController.text.isNotEmpty) {
                        context.read<ProfileBloc>().add(
                              SuggestProductEvent(
                                productName: _nameController.text,
                                description: _descController.text,
                              ),
                            );
                      }
                    },
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
