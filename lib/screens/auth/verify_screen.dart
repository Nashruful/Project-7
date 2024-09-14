import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';
import 'package:project_judge/screens/auth/cubit/auth_cubit.dart';
import 'package:project_judge/screens/home_screen.dart';

class VerifyScreen extends StatelessWidget {
  const VerifyScreen({super.key, required this.email});
  final String email;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Builder(builder: (context) {
        final cubit = context.read<AuthCubit>();
        return BlocListener<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is LoadingState) {
              showDialog(
                  context: context,
                  builder: (context) => const AlertDialog(
                        content: CircularProgressIndicator(),
                      ));
            }
            if (state is SuccessState) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()));
            }
            if (state is ErrorState) {
              Navigator.pop(context);
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.msg)));
            }
          },
          child: Scaffold(
            body: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    "assets/images/loginImage.png",
                    fit: BoxFit.cover,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        constraints: BoxConstraints(
                            maxHeight:
                                MediaQuery.of(context).size.height - 136),
                        decoration: const BoxDecoration(
                            color: Color(0x65000000),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(40),
                                topLeft: Radius.circular(40))),
                      ),
                      Positioned(
                          top: -50,
                          left: MediaQuery.of(context).size.width / 2 - 50,
                          child: Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(100)),
                            child: Center(
                              child: Image.asset("assets/images/logo-h 2.png"),
                            ),
                          )),
                      const Positioned(
                        top: 90,
                        left: 80,
                        child: Text(
                          "Verification code",
                          style: TextStyle(color: Colors.white, fontSize: 32),
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 318,
                        height: 48,
                        child: RichText(
                          text: TextSpan(children: [
                            const TextSpan(
                              text:
                                  "Please enter the code that has been sent to the email ",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            TextSpan(
                              text: email,
                              style: const TextStyle(
                                color: Color(0xff57E3D8),
                              ),
                            )
                          ]),
                        ),
                      ),
                      const SizedBox(
                        height: 130,
                      ),
                      Pinput(
                          controller: cubit.otpController,
                          length: 6,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          onCompleted: (pin) {
                            cubit.checkAuth(email: email);
                          }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
