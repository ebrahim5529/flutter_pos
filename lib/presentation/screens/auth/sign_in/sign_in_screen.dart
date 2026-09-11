import 'package:app_image/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/di/app_providers.dart';
import '../../../../core/assets/assets.dart';
import '../../../../core/themes/app_sizes.dart';
import '../../../providers/auth/auth_notifier.dart';
import '../../../widgets/app_button.dart';
import '../../../widgets/app_dialog.dart';
import '../../../widgets/app_text_field.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(AppSizes.padding),
        child: Column(
          children: [
            _WelcomeMessage(),
            _SignInForm(),
          ],
        ),
      ),
    );
  }
}

class _WelcomeMessage extends StatelessWidget {
  const _WelcomeMessage();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 270),
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const AppImage(
              image: Assets.welcome,
              imgProvider: ImgProvider.assetImage,
            ),
            const SizedBox(height: AppSizes.padding),
            Text(
              'Welcome!',
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Welcome to Flutter POS app',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}

class _SignInForm extends ConsumerStatefulWidget {
  const _SignInForm();

  @override
  ConsumerState<_SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends ConsumerState<_SignInForm> {
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _onSignIn() async {
    final email = _emailController.text;
    final name = _nameController.text;

    if (email.trim().isEmpty && name.trim().isEmpty) {
      AppDialog.showError(error: 'Enter an email or name to continue');
      return;
    }

    final authNotifier = ref.read(authNotifierProvider.notifier);
    final routes = ref.read(appRoutesProvider);

    var res = await AppDialog.showProgress(() async {
      return authNotifier.signIn(email: email, name: name);
    });

    if (res.isSuccess) {
      routes.router.refresh();
    } else {
      AppDialog.showError(error: res.error?.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 400),
      child: Column(
        children: [
          AppTextField(
            controller: _emailController,
            labelText: 'Email',
            hintText: 'any@email.com',
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: AppSizes.padding),
          AppTextField(
            controller: _nameController,
            labelText: 'Name',
            hintText: 'Your name',
            textInputAction: TextInputAction.done,
            onEditingComplete: _onSignIn,
          ),
          const SizedBox(height: AppSizes.padding),
          AppButton(
            text: 'Sign In',
            onTap: _onSignIn,
          ),
        ],
      ),
    );
  }
}
