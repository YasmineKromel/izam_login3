import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:izam_login/domain/login/entity/login-entity.dart';
import 'package:izam_login/presentation/bloc/login_bloc.dart';
import 'package:izam_login/utils/app_colors.dart';
import 'package:izam_login/utils/app_styles.dart';
import 'package:izam_login/utils/strings.dart';

import '../../../data/common/database/database_helper.dart';
import '../../../main.dart';


class LoginMobileScreen extends StatefulWidget {
  const LoginMobileScreen({Key? key}) : super(key: key);

  @override
  State<LoginMobileScreen> createState() => _LoginMobileScreenState();
}

class _LoginMobileScreenState extends State<LoginMobileScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.appBackgroundColor,
        body:
        // BlocConsumer<LoginBloc, LoginState>(
        //   listener:  (context, state){
        //
        //   },
        //
        //   builder: (context, state){
        //     return
        //       Center(
        //       child: Padding(
        //         padding: const EdgeInsets.only(top: 70),
        //         child: Column(
        //           children: [
        //             Flexible(
        //               child: Center(
        //                 child: Image.asset(
        //                   'assets/images/daftra.png',
        //                   width: 142,
        //                   height: 40,
        //                 ),
        //               ),
        //             ),
        //             Flexible(
        //               flex: 3,
        //               child: Padding(
        //                 padding:
        //                 const EdgeInsets.only(left: 18, right: 18, top: 20),
        //                 child: Container(
        //                   decoration: const BoxDecoration(
        //                     borderRadius:
        //                     BorderRadius.all(Radius.elliptical(20, 20)),
        //                     color: AppColors.appWhiteColor,
        //                     boxShadow: [
        //                       BoxShadow(
        //                         color: Colors.grey,
        //                         blurRadius: 4,
        //                         offset: Offset(4, 8),
        //                       )
        //                     ],
        //                   ),
        //                   child: SingleChildScrollView(
        //                     child: Padding(
        //                       padding: const EdgeInsets.only(left: 10, right: 10),
        //                       child: Form(
        //                         key: formKey,
        //                         autovalidateMode:
        //                         AutovalidateMode.onUserInteraction,
        //                         child: Column(
        //                           //mainAxisAlignment: MainAxisAlignment.start,
        //                           crossAxisAlignment: CrossAxisAlignment.start,
        //                           children: [
        //                             const Padding(
        //                               padding: EdgeInsets.only(
        //                                   top: 25, left: 10, bottom: 15),
        //                               child: FittedBox(
        //                                 child: Text(
        //                                   Strings.loginWelcome,
        //                                   style:
        //                                   AppStyles.txtGilroyRegularDarkBlue28,
        //                                   overflow: TextOverflow.ellipsis,
        //                                 ),
        //                               ),
        //                             ),
        //                             Padding(
        //                               padding: const EdgeInsets.only(
        //                                   top: 10, left: 15, right: 15),
        //                               child: Column(
        //                                 children: [
        //                                   TextFormField(
        //                                     controller: userNameController,
        //                                     decoration: const InputDecoration(
        //                                         fillColor: AppColors.appLightGray,
        //                                         border: InputBorder.none,
        //                                         filled: true,
        //                                         hintText:
        //                                         Strings.loginUserFieldHint),
        //                                     validator: (value) {
        //                                       if (value != null) {
        //                                         return validateEmail(value);
        //                                       }
        //                                       // return null;
        //                                     },
        //                                   ),
        //                                   const SizedBox(
        //                                     height: 15,
        //                                   ),
        //                                   TextFormField(
        //                                     controller: passwordController,
        //                                     decoration: const InputDecoration(
        //                                         fillColor: AppColors.appLightGray,
        //                                         border: InputBorder.none,
        //                                         filled: true,
        //                                         hintText:
        //                                         Strings.loginPasswordFiledHint),
        //                                     validator: (value) {
        //                                       if (value != null) {
        //                                         return validatePassword(value);
        //                                       }
        //                                       //return null;
        //                                     },
        //                                   ),
        //                                   const SizedBox(
        //                                     height: 10,
        //                                   ),
        //                                   Align(
        //                                     alignment: Alignment.centerRight,
        //                                     child: FittedBox(
        //                                         child: InkWell(
        //                                           onTap: () {},
        //                                           child: const Text(
        //                                             Strings.loginForgotPassword,
        //                                             style:
        //                                             AppStyles.txtGilroyDarkBlue14,
        //                                           ),
        //                                         )),
        //                                   ),
        //                                   const SizedBox(
        //                                     height: 25,
        //                                   ),
        //                                   Container(
        //                                     color: AppColors.appBlueColor,
        //                                     height: 50,
        //                                     child: Row(
        //                                       mainAxisAlignment:
        //                                       MainAxisAlignment.spaceBetween,
        //                                       children: [
        //                                         Padding(
        //                                           padding: const EdgeInsets.only(
        //                                               left: 10),
        //                                           child: InkWell(
        //                                               onTap: () {
        //                                                 if (formKey.currentState!
        //                                                     .validate()) {
        //                                                   String mail = userNameController
        //                                                       .text.replaceAll(' ', '');
        //                                                   context.read<LoginBloc>().add(QueryAllUsersEvent());
        //                                                   _query(mail)
        //                                                       .then((value) {
        //                                                     if (value.isNotEmpty) {
        //                                                       int times = value['times'];
        //                                                       _update(value['_id'], value['times']+1 , value['mail'], value['password']).then((value) {
        //                                                         Fluttertoast.showToast(msg: "Logged in successfully :  Updated Times = ${times+1}",
        //                                                             toastLength: Toast.LENGTH_LONG,
        //                                                             gravity: ToastGravity.SNACKBAR,
        //                                                             backgroundColor: Colors.black54,
        //                                                             textColor: Colors.white,
        //                                                             fontSize: 14.0
        //                                                         );
        //                                                       });
        //
        //                                                     }
        //
        //                                                     else {
        //                                                       _insert()
        //                                                           .then((value) {
        //                                                         Fluttertoast.showToast(msg: "Logged in successfully : Times = 1",
        //                                                             toastLength: Toast.LENGTH_LONG,
        //                                                             gravity: ToastGravity.SNACKBAR,
        //                                                             backgroundColor: Colors.black54,
        //                                                             textColor: Colors.white,
        //                                                             fontSize: 14.0
        //                                                         );
        //                                                       });
        //
        //                                                       // String mail = userNameController.text.replaceAll(' ', '');
        //                                                       // LoginEntity model = LoginEntity(id: 0, email: mail, password: passwordController.text, times: 1);
        //                                                       // context.read<LoginBloc>().add(AddUserEvent(model: model));
        //
        //                                                     }
        //                                                   });
        //                                                 }
        //                                               },
        //                                               child: const Text(
        //                                                 Strings.login,
        //                                                 style: AppStyles
        //                                                     .txtGilroyWhite16,
        //                                               )),
        //                                         ),
        //                                         Padding(
        //                                           padding: const EdgeInsets.only(
        //                                               right: 10),
        //                                           child: InkWell(
        //                                               onTap: () {},
        //                                               child: const Text(
        //                                                 Strings.signup,
        //                                                 style: AppStyles
        //                                                     .txtGilroyWhite16,
        //                                               )),
        //                                         ),
        //                                       ],
        //                                     ),
        //                                   ),
        //                                   const SizedBox(
        //                                     height: 15,
        //                                   ),
        //                                 ],
        //                               ),
        //                             )
        //                           ],
        //                         ),
        //                       ),
        //                     ),
        //                   ),
        //                 ),
        //               ),
        //             ),
        //             Flexible(
        //               child: Container(),
        //             ),
        //           ],
        //         ),
        //       ),
        //     ) ;
        //   }
        //
        // ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 70),
            child: Column(
              children: [
                Flexible(
                  child: Center(
                    child: Image.asset(
                      'assets/images/daftra.png',
                      width: 142,
                      height: 40,
                    ),
                  ),
                ),
                Flexible(
                  flex: 3,
                  child: Padding(
                    padding:
                    const EdgeInsets.only(left: 18, right: 18, top: 20),
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius:
                        BorderRadius.all(Radius.elliptical(20, 20)),
                        color: AppColors.appWhiteColor,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 4,
                            offset: Offset(4, 8),
                          )
                        ],
                      ),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Form(
                            key: formKey,
                            autovalidateMode:
                            AutovalidateMode.onUserInteraction,
                            child: Column(
                              //mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(
                                      top: 25, left: 10, bottom: 15),
                                  child: FittedBox(
                                    child: Text(
                                      Strings.loginWelcome,
                                      style:
                                      AppStyles.txtGilroyRegularDarkBlue28,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, left: 15, right: 15),
                                  child: Column(
                                    children: [
                                      TextFormField(
                                        controller: userNameController,
                                        decoration: const InputDecoration(
                                            fillColor: AppColors.appLightGray,
                                            border: InputBorder.none,
                                            filled: true,
                                            hintText:
                                            Strings.loginUserFieldHint),
                                        validator: (value) {
                                          if (value != null) {
                                            return validateEmail(value);
                                          }
                                          // return null;
                                        },
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      TextFormField(
                                        controller: passwordController,
                                        decoration: const InputDecoration(
                                            fillColor: AppColors.appLightGray,
                                            border: InputBorder.none,
                                            filled: true,
                                            hintText:
                                            Strings.loginPasswordFiledHint),
                                        validator: (value) {
                                          if (value != null) {
                                            return validatePassword(value);
                                          }
                                          //return null;
                                        },
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: FittedBox(
                                            child: InkWell(
                                              onTap: () {},
                                              child: const Text(
                                                Strings.loginForgotPassword,
                                                style:
                                                AppStyles.txtGilroyDarkBlue14,
                                              ),
                                            )),
                                      ),
                                      const SizedBox(
                                        height: 25,
                                      ),
                                      Container(
                                        color: AppColors.appBlueColor,
                                        height: 50,
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              child: InkWell(
                                                  onTap: () {
                                                    if (formKey.currentState!
                                                        .validate()) {
                                                       String mail = userNameController
                                                           .text.replaceAll(' ', '');
                                                      // context.read<LoginBloc>().add(QueryAllUsersEvent());
                                                      _query(mail)
                                                          .then((value) {
                                                        if (value.isNotEmpty) {
                                                          int times = value['times'];
                                                          _update(value['_id'], value['times']+1 , value['mail'], value['password']).then((value) {
                                                            Fluttertoast.showToast(msg: "Logged in successfully :  Updated Times = ${times+1}",
                                                                toastLength: Toast.LENGTH_LONG,
                                                                gravity: ToastGravity.SNACKBAR,
                                                                backgroundColor: Colors.black54,
                                                                textColor: Colors.white,
                                                                fontSize: 14.0
                                                            );
                                                          });

                                                        }

                                                        else {
                                                          _insert()
                                                              .then((value) {
                                                            Fluttertoast.showToast(msg: "Logged in successfully : Times = 1",
                                                                toastLength: Toast.LENGTH_LONG,
                                                                gravity: ToastGravity.SNACKBAR,
                                                                backgroundColor: Colors.black54,
                                                                textColor: Colors.white,
                                                                fontSize: 14.0
                                                            );
                                                          });

                                                          // String mail = userNameController.text.replaceAll(' ', '');
                                                          // LoginEntity model = LoginEntity(id: 0, email: mail, password: passwordController.text, times: 1);
                                                          // context.read<LoginBloc>().add(AddUserEvent(model: model));

                                                        }
                                                      });
                                                    }
                                                  },
                                                  child: const Text(
                                                    Strings.login,
                                                    style: AppStyles
                                                        .txtGilroyWhite16,
                                                  )),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 10),
                                              child: InkWell(
                                                  onTap: () {},
                                                  child: const Text(
                                                    Strings.signup,
                                                    style: AppStyles
                                                        .txtGilroyWhite16,
                                                  )),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: Container(),
                ),
              ],
            ),
          ),
        ) ,


    );
  }

  String? validateEmail(String email) {
    var value = email.replaceAll(' ', '');
    RegExp regex1 = RegExp(r'[A-Za-z]');
    RegExp regex2 = RegExp(r'[0-9]');
    RegExp regex3 = RegExp(r'@izam.co');
    var parts = value.split("@");
    var firstPart = parts[0].split(".");
    if (value.isEmpty) {
      return Strings.enterEmail;
    } else if (value.length != 16) {
      return Strings.enterValidPassword;
    } else if (!regex3.hasMatch(value)) {
      return Strings.enterValidPassword;
    } else if (!parts[0].contains(".")) {
      return Strings.enterValidPassword;
    } else if (firstPart[0].length != 3) {
      return Strings.enterValidEmail;
    } else if (!regex1.hasMatch(firstPart[0])) {
      return Strings.enterValidEmail;
    } else if (firstPart[1].length != 4) {
      return Strings.enterValidEmail;
    } else if (!regex2.hasMatch(firstPart[1])) {
      return Strings.enterValidEmail;
    } else {
      return null;
    }
  }

  String? validatePassword(String password) {
    RegExp regex = RegExp(r'^(?=.*?[0-9])(?=.*?[!$#^*]).{8,}$');
    if (password.isEmpty) {
      return Strings.enterPassword;
    } else {
      if (!regex.hasMatch(password)) {
        return Strings.enterValidPassword;
      } else {
        return null;
      }
    }
  }

  Future<int> _insert() async {
    // row to insert
    String mail = userNameController
        .text.replaceAll(' ', '');
    Map<String, dynamic> row = {
      DatabaseHelper.columnMail: mail,
      DatabaseHelper.columnPassword: passwordController.text,
      DatabaseHelper.columnTimesOfLogin: 1,
    };
    final id = await dbHelper.insert(row);
    debugPrint('inserted row id: $id');
    return id;
  }

  Future<Map<String, dynamic>> _query(String mail) async {
    Map<String, dynamic> object = {};
    final allRows = await dbHelper.queryAllRows();
    debugPrint('query all rows:');
    for (final row in allRows) {
      if (row['mail'] == mail) {
        object = row;
        print(object);
      }
    }
    return object;
  }

  Future<int> _update(int id, int times, String mail,String pass ) async {
    // row to update
    Map<String, dynamic> row = {
      DatabaseHelper.columnId: id,
      DatabaseHelper.columnMail: mail,
      DatabaseHelper.columnPassword: pass,
      DatabaseHelper.columnTimesOfLogin: times
    };
    final rowsAffected = await dbHelper.update(row);
    debugPrint('updated $rowsAffected row(s)');
    return rowsAffected;
  }
}
