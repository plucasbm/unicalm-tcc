import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:unicalm_v2/core/controllers/auth_controller.dart';
import 'package:unicalm_v2/core/models/user_model.dart';
import 'package:unicalm_v2/core/views/login/login_page.dart';
import 'package:unicalm_v2/core/ui/styles/constants.dart';
import 'package:unicalm_v2/core/ui/styles/text_style.dart';
import 'package:unicalm_v2/core/ui/widgets/custom_form_field.dart';
import 'package:validatorless/validatorless.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isObscure = true;
  String buttonText = 'CADASTRAR';
  final loading = ValueNotifier<bool>(false);

  final _nameEC = TextEditingController();
  final _emailEC = TextEditingController();
  final _universityEC = TextEditingController();
  final _passwordEC = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void _clearFields() {
    _nameEC.clear();
    _emailEC.clear();
    _universityEC.clear();
    _passwordEC.clear();
  }

  @override
  void dispose() {
    _nameEC.dispose();
    _emailEC.dispose();
    _universityEC.dispose();
    _passwordEC.dispose();
    super.dispose();
  }

  // void _toggleIsObscure() {
  //   setState(() {
  //     isObscure = !isObscure;
  //   });
  // }

  void _toggleLoading() {
    setState(() {
      loading.value = !loading.value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'UniCalm',
          style: TxtStyle.instance.titleTextStyle.copyWith(
            color: ColorsConstants.secondaryColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
        child: Column(
          children: [
            Image.asset(ImageConstants.logoCortada),
            const SizedBox(
              height: 45,
            ),
            Form(
              key: _formKey,
              child: Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(10),
                  children: [
                    CustomFormField(
                      controller: _nameEC,
                      validator: Validatorless.required('CAMPO OBRIGATÓRIO'),
                      label: 'Nome Completo',
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomFormField(
                      controller: _emailEC,
                      validator: Validatorless.multiple([
                        Validatorless.required('CAMPO OBRIGATÓRIO'),
                        Validatorless.email('E-MAIL INVÁLIDO'),
                      ]),
                      label: 'E-mail',
                      type: TextInputType.emailAddress,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomFormField(
                      controller: _universityEC,
                      validator: Validatorless.required('CAMPO OBRIGATÓRIO'),
                      label: 'Universidade',
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomFormField(
                      controller: _passwordEC,
                      validator: Validatorless.multiple([
                        Validatorless.required('CAMPO OBRIGATÓRIO'),
                        Validatorless.min(
                            6, 'SENHA MUITO CURTA! MIN.: 6 CARACTERES'),
                      ]),
                      label: 'Senha',
                      isObscure: isObscure,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const SizedBox(
                      height: 56,
                    ),
                    OutlinedButton(
                      onPressed: () async {
                        var isValid =
                            _formKey.currentState?.validate() ?? false;

                        if (isValid) {
                          _toggleLoading();
                          Future.delayed(
                            const Duration(seconds: 3),
                            () {
                              setState(() {
                                _toggleLoading();
                              });
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginPage(),
                                ),
                              );
                            },
                          );

                          final authController = AuthController();

                          final userData = UserModel(
                            name: _nameEC.text,
                            email: _emailEC.text,
                            university: _universityEC.text,
                            userImg: '',
                          ).toMap();

                          final result = await authController.registerUser(
                              email: _emailEC.text.trim().toLowerCase(),
                              senha: _passwordEC.text,
                              userData: userData);

                          if (!result['success']) {
                            showTopSnackBar(
                              Overlay.of(context),
                              CustomSnackBar.error(
                                message: result['message'],
                              ),
                            );
                            _clearFields();
                            return;
                          }

                          showTopSnackBar(
                            Overlay.of(context),
                            const CustomSnackBar.success(
                              message: 'Cadastro realizado com sucesso',
                            ),
                            displayDuration: const Duration(
                              seconds: 2,
                            ),
                          );

                          // Future.delayed(const Duration(seconds: 3), () {

                          // });
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
                                    buttonText,
                                    style: TxtStyle.instance.buttonTextStyle,
                                  );
                          }),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
