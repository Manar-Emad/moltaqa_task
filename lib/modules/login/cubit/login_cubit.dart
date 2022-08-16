import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moltaqa_task/models/login_model.dart';
import 'package:moltaqa_task/shared/network/remote/dio_helper.dart';
import '../../../shared/network/end_points.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
   LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context)=> BlocProvider.of(context);

  late dynamic loginModel;
void userLogin({required String email,required String password}){
  emit(LoginLoadingState());
  print('beforepost data');
  DioHelper.postDataForm(
    url: ApiConstants.login,
    data:  {
      "email":email,
      "password":password
    },
  ).then((value) { print(value.data);
    debugPrint('--====value$value');
    loginModel = LoginModel.fromJson(value.data);
    print(loginModel.status);
    print(loginModel.message);
    print(loginModel.data!.token);


    emit(LoginSuccessState(loginModel));
  }

  ).catchError((error){
    emit(LoginErrorState(error.toString()));
  });

}

IconData suffix=Icons.visibility_outlined;
bool isPassword=true;
void changePasswordVisibility(){
  isPassword = !isPassword;
  suffix=isPassword ? Icons.visibility_outlined:Icons.visibility_off_outlined;
  emit(ChangePasswordVisibilityState());
}



}
