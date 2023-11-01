import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:unicalm_v2/core/controllers/auth_controller.dart';
import 'package:unicalm_v2/core/views/home_page_view/home_page_view.dart';
import 'package:unicalm_v2/core/views/register/register_page.dart';
import 'package:unicalm_v2/core/ui/styles/button_style.dart';
import 'package:unicalm_v2/core/ui/styles/constants.dart';
import 'package:unicalm_v2/core/ui/styles/text_style.dart';
import 'package:validatorless/validatorless.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isVisible = true;
  final _formKey = GlobalKey<FormState>();

  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();

  final loading = ValueNotifier<bool>(false);

  bool _toggleLoading() => loading.value = !loading.value;

  void _clearFields() {
    _emailEC.clear();
    _passwordEC.clear();
  }

  @override
  void dispose() {
    _emailEC.dispose();
    _passwordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 90, left: 55, right: 55),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(ImageConstants.logoCortada),
              const SizedBox(
                height: 60,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      onTapOutside: (event) => FocusScope.of(context).unfocus(),
                      controller: _emailEC,
                      validator: Validatorless.required('CAMPO OBRIGATÓRIO'),
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.alternate_email,
                          size: 24,
                          color: ColorsConstants.secondaryColor,
                        ),
                        label: Text(
                          'E-mail',
                          style: TxtStyle.instance.textRegular16.copyWith(
                            color: ColorsConstants.secondaryColor,
                          ),
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      onTapOutside: (event) => FocusScope.of(context).unfocus(),
                      controller: _passwordEC,
                      validator: Validatorless.required('CAMPO OBRIGATÓRIO'),
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.lock,
                          size: 24,
                          color: ColorsConstants.secondaryColor,
                        ),
                        suffixIcon: InkWell(
                          onTap: () {
                            setState(() {
                              isVisible = !isVisible;
                            });
                          },
                          child: isVisible
                              ? const Icon(
                                  Icons.visibility,
                                  size: 24,
                                  color: ColorsConstants.secondaryColor,
                                )
                              : const Icon(
                                  Icons.visibility_off,
                                  size: 24,
                                  color: ColorsConstants.secondaryColor,
                                ),
                        ),
                        label: Text(
                          'Senha',
                          style: TxtStyle.instance.textRegular16.copyWith(
                            color: ColorsConstants.secondaryColor,
                          ),
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                      ),
                      obscureText: isVisible,
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    ElevatedButton(
                      style: BtnStyle.instance.elevatedButtonStyle,
                      onPressed: () async {
                        bool isValid =
                            _formKey.currentState?.validate() ?? false;

                        if (isValid) {
                          _toggleLoading();

                          final authController = AuthController();

                          final result = await authController.loginUser(
                            email: _emailEC.text,
                            senha: _passwordEC.text,
                          );

                          if (!result['success']) {
                            showTopSnackBar(
                              Overlay.of(context),
                              CustomSnackBar.error(
                                message: result['message'],
                              ),
                            );
                            setState(() {
                              _toggleLoading();
                            });
                            _clearFields();
                            return;
                          }

                          Future.delayed(const Duration(seconds: 2), () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomePageView(),
                              ),
                            );
                          });
                        }
                      },
                      child: AnimatedBuilder(
                          animation: loading,
                          builder: (context, _) {
                            return loading.value
                                ? LoadingAnimationWidget.staggeredDotsWave(
                                    color: ColorsConstants.secondaryColor,
                                    size: 32)
                                : Text(
                                    'LOGIN',
                                    style: TxtStyle.instance.buttonTextStyle,
                                  );
                          }),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RegisterPage(),
                    ),
                  );
                },
                child: Text(
                  'Cadastre-se',
                  style: TxtStyle.instance.textRegular16.copyWith(
                    color: ColorsConstants.secondaryColor,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
