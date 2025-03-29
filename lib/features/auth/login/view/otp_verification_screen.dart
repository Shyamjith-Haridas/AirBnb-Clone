// ignore_for_file: deprecated_member_use

import 'package:air_bnb_clone/config/routes/app_route_names.dart';
import 'package:air_bnb_clone/core/constants/app_colors.dart';
import 'package:air_bnb_clone/core/settings/shared_pref.dart';
import 'package:air_bnb_clone/core/utils/app_functions.dart';
import 'package:air_bnb_clone/features/auth/login/service/firebase_login_otp_service.dart';
import 'package:air_bnb_clone/global_components/custom_back_button.dart';
import 'package:air_bnb_clone/global_components/submit_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({
    super.key,
    required this.mobileNumber,
  });

  final String mobileNumber;

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final TextEditingController _pinController = TextEditingController();
  bool _otpinvalid = false;
  String? errorMessage;
  final FocusNode _focusNode = FocusNode();

  final FirebaseLoginOtpService _firebaseLoginService =
      FirebaseLoginOtpService();

  final userSessionManager = SessionManager();

  @override
  void initState() {
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _focusNode.requestFocus());

    _pinController.addListener(
      () {
        setState(() {
          errorMessage = null;
        });
      },
    );

    super.initState();
  }

  @override
  void dispose() {
    _pinController.dispose();
    if (mounted) _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        dividerTheme: DividerThemeData(
          color: Colors.transparent,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          leading: CustomBackButton(),
          title: Text(
            'Confirm your number',
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontWeight: FontWeight.w700),
          ),
          shape:
              Border(bottom: BorderSide(color: TAppColors.appBarDividerColor)),
          automaticallyImplyLeading: false,
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                20.verticalSpace,
                Text(
                  'Enter the code we\'ve sent by SMS to',
                ),
                Text('+91-${widget.mobileNumber}:'),
                20.verticalSpace,

                // pinput
                Pinput(
                  length: 6,
                  focusNode: _focusNode,
                  controller: _pinController,
                  defaultPinTheme: _getPinTheme(isError: _otpinvalid),
                  onChanged: (value) {
                    if (_otpinvalid) {
                      setState(() {
                        _otpinvalid = false;
                      });
                    }
                  },
                ),
                if (errorMessage != null) ...[
                  10.verticalSpace,
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: TAppColors.red.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      errorMessage!,
                      style: TextStyle(color: TAppColors.red, fontSize: 14.sp),
                    ),
                  ),
                ],

                20.verticalSpace,
                Row(
                  spacing: 10.0,
                  children: [
                    Text('Haven\'t received an SMS?'),
                    Text(
                      'Send again',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
                20.verticalSpace,
                Text(
                  'More otpions',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.underline,
                  ),
                )
              ],
            ),
          ),
        ),
        persistentFooterButtons: [
          Padding(
            padding: EdgeInsets.only(
              top: 10.h,
              left: 10.w,
              right: 10.w,
              bottom: MediaQuery.of(context).viewInsets.bottom + 10.h,
            ),
            child: SubmitButtonWidget(
              onTap: () async {
                _validateOtpAndSaveData();
              },
              buttonText: 'Continue',
            ),
          ),
        ],
      ),
    );
  }

  // Pinput
  PinTheme _getPinTheme({required bool isError}) {
    return PinTheme(
      height: 56.0,
      width: 56.0,
      textStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: isError ? TAppColors.red : TAppColors.grey),
      ),
    );
  }

  // Validate otp function
  Future<void> _validateOtpAndSaveData() async {
    final generateOtp = AppFunctions.generateOtpFunction();
    final mobileNumber = widget.mobileNumber;

    final isValidOtp = _pinController.text == generateOtp;
    setState(() {
      _otpinvalid = !isValidOtp;
      errorMessage = isValidOtp ? null : 'Invalid OTP';
    });

    if (isValidOtp) {
      try {
        final numberExists =
            await _firebaseLoginService.checkIfNumberExists(mobileNumber);

        if (!mounted) return;
        if (!numberExists) {
          await _firebaseLoginService.saveMobileNumber(mobileNumber);
        } else {
          debugPrint('User already registered..');
        }

        final userSnapshot = await _firebaseLoginService.userRef
            .where('mobile', isEqualTo: widget.mobileNumber)
            .limit(1)
            .get();

        if (userSnapshot.docs.isNotEmpty) {
          final userData =
              userSnapshot.docs.first.data() as Map<String, dynamic>;

          String customId = userData['customId'];
          String? userName = userData['username'];
          String? userEmail = userData['email'];

          // Save To Session Manager

          SessionManager.saveUserSession(
              customUID: customId,
              loginType: 'OTP',
              username: userName,
              email: userEmail);
        }
        debugPrint('User session Initially Saved');

        if (!mounted) return;
        Navigator.pushNamedAndRemoveUntil(
          context,
          AppRouteNames.homeScreen,
          (route) => false,
        );
      } catch (error, stackTrace) {
        debugPrint('Error::: $error');
        debugPrint('StackTrace::: $stackTrace');
        // toast message
      }
    }
  }
}
