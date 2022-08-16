import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:moltaqa_task/modules/login/cubit/login_cubit.dart';
import 'package:moltaqa_task/modules/welcome/welcome.dart';
import 'package:moltaqa_task/shared/components/buttons.dart';
import 'package:moltaqa_task/shared/components/form_feild.dart';
import 'package:moltaqa_task/shared/styles/sizes.dart';
import '../../shared/language/app_localization.dart';
import '../../shared/components/components.dart';
import '../../shared/styles/colors.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isPassword = true;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            navigateAndFinish(context, const Welcome());
            // snackBar Widget


            // if (state.loginModel.status != null) {
            //
            //   print(state.loginModel.message);
            //   print(state.loginModel.data?.token);
            //   CacheHelper.saveData(
            //           key: 'token', value: state.loginModel.data?.token)
            //       .then((value) {
            //
            //   });
            // } else {
            //   print(state.loginModel.message);
            //   snackBar(
            //     context: context,
            //     message: state.loginModel.message,
            //     state: SnackBarStates.ERROR,
            //   );
            // }
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     Lottie.asset('assets/22.json'),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text(
                        AppLocalization.of(context)!.translate('welcome_back')!,
                        style: const TextStyle(
                          fontFamily: 'Almarai',
                          color: primaryColor,
                          fontSize: 32.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(AppLocalization.of(context)!.translate('sign_in')!,
                        style: const TextStyle(
                          fontFamily: 'Almarai',
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        )),
                    sizedBoxh2,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35),
                      child: Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: formFeild(
                                  controller: emailController,
                                  type: TextInputType.emailAddress,
                                  validate: (value) {
                                    if (value.isEmpty) {
                                      return 'please_enter_your_email_address_or_phone_number';
                                    }
                                    return null;
                                  },
                                  txt: AppLocalization.of(context)!
                                      .translate('mobile_number_or_email')!,
                                  focusedBorder: InputBorder.none,
                                  isClikable: true,
                                  disabledBorder: InputBorder.none),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: formFeild(
                                controller: passwordController,
                                focusedBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                type: TextInputType.visiblePassword,
                                validate: (value) {
                                  if (value.isEmpty) {
                                    return 'please_enter_your_password';
                                  }
                                  return null;
                                },
                                onSubmit: (value) {
                                  ///todo مهم
                                  // if (formKey.currentState!.validate()) {
                                  //   LoginCubit.get(context).userLogin(
                                  //       email: emailController.text,
                                  //       password: passwordController.text);
                                  // }
                                },
                                txt: AppLocalization.of(context)!
                                    .translate('secret_code')!,
                                isClikable: true,
                                suffixPressed: () {
                                  LoginCubit.get(context)
                                      .changePasswordVisibility();
                                },
                                isPassword: LoginCubit.get(context).isPassword,
                                suffix: LoginCubit.get(context).suffix,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                    AppLocalization.of(context)!
                                        .translate('forget_the_passcode')!,
                                    style: const TextStyle(
                                      fontFamily: 'Almarai',
                                      color: primaryColor,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ],
                            ),
                            sizedBoxh2,
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: BlocConsumer<LoginCubit, LoginState>(
                                listener: (context, state) {
                                  if(state is   LoginSuccessState){
                                    navigateAndFinish(
                                      context, const Welcome());
                                  }
                                  if(state is   LoginErrorState){
                                    print("stateeeeee${state.error}");
                                    // ScaffoldMessenger.of(context).showSnackBar(
                                    //   const SnackBar(
                                    //     content: Text("errrrrrrrrrrrror"),
                                    //     duration: Duration(seconds: 2),
                                    //   ),
                                    // );
                                  }

                                  },

                                builder: (context, state) {
                                  return ConditionalBuilder(
                                    condition: state is! LoginLoadingState,
                                    builder: (context) => DefaultButton(
                                      onTap: () {
                                        if (formKey.currentState!.validate()) {
                                          LoginCubit.get(context).userLogin(
                                              email: emailController.text,
                                              password:
                                                  passwordController.text);
                                        }
                                      },
                                      text: AppLocalization.of(context)!
                                          .translate('sign_in')!,
                                    ),
                                    fallback: (context) => const Center(
                                        child: CircularProgressIndicator()),
                                  );
                                },
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                    AppLocalization.of(context)!
                                        .translate('dont_have_an_account')!,
                                    style: const TextStyle(
                                      fontFamily: 'Almarai',
                                      color: blackLColor,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                    )),
                                Text(
                                    AppLocalization.of(context)!
                                        .translate('create_a_new_account')!,
                                    style: const TextStyle(
                                        fontFamily: 'Almarai',
                                        color: primaryColor,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.underline)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
