
import 'package:baap_communication_app/app/verfiy_token/logic/verify_token_cubit.dart';
import 'package:baap_communication_app/utils/routes/routes.dart';
import 'package:baap_communication_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

// ignore: must_be_immutable
class SingleSignOnScreen extends StatefulWidget {
  const SingleSignOnScreen({super.key, this.groupId, this.token});
  final int? groupId;

  final String? token;
  @override
  State<SingleSignOnScreen> createState() => _SingleSignOnScreenState();
}

class _SingleSignOnScreenState extends State<SingleSignOnScreen> {
  @override
  void initState() {
    context.read<VerfiyTokenCubit>().fetchToken(widget.token, widget.groupId);
    super.initState();
  }

  @override
  Widget build(BuildContext context1) {
    return Scaffold(
      body: BlocListener<VerfiyTokenCubit, VerifyTokenState>(
        listener: (context, state) {
          if (state is VerifyTokenLoaded) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              context.push(Routes.messageListScreen);
            });
          }
        },
        child: BlocBuilder<VerfiyTokenCubit, VerifyTokenState>(
          builder: (context, state) {
            if (state is VerifyTokenLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is VerifyTokenFailure) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Center(child: TextWidget(text: state.errorMesage ?? '')),
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
