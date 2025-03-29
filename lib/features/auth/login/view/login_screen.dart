import 'package:air_bnb_clone/config/routes/app_route_names.dart';
import 'package:air_bnb_clone/core/constants/app_colors.dart';
import 'package:air_bnb_clone/core/constants/app_resource_path.dart';
import 'package:air_bnb_clone/core/constants/app_texts.dart';
import 'package:air_bnb_clone/core/utils/utility.dart';
import 'package:air_bnb_clone/features/auth/login/service/firebase_auth_services.dart';
import 'package:air_bnb_clone/features/auth/login/view/components/divider_widget.dart';
import 'package:air_bnb_clone/features/auth/login/view/components/social_login_widget.dart';
import 'package:air_bnb_clone/global_components/submit_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _mobileNumController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login or Signup',
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(fontWeight: FontWeight.w700),
        ),
        shape: Border(bottom: BorderSide(color: TAppColors.appBarDividerColor)),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                20.verticalSpace,
                Text(
                  'Welcome To AirBnb',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                20.verticalSpace,
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(color: TAppColors.dividerColor),
                      left: BorderSide(color: TAppColors.dividerColor),
                      right: BorderSide(color: TAppColors.dividerColor),
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.r),
                      topRight: Radius.circular(10.r),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Country/Region',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(color: TAppColors.grey),
                          ),
                          Text(
                            'India (+91)',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                      Icon(
                        Icons.keyboard_arrow_down_rounded,
                        size: 30.sp,
                      )
                    ],
                  ),
                ),
                TextFormField(
                  controller: _mobileNumController,
                  cursorColor: TAppColors.primaryColor,
                  keyboardType: TextInputType.number,
                  style: Theme.of(context).textTheme.bodyMedium,
                  decoration: InputDecoration(
                    hintText: 'Phone Number',
                    hintStyle: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: TAppColors.grey),
                    border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: TAppColors.black, width: 1.5),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: TAppColors.black, width: 1.5),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: TAppColors.black, width: 1.5),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    errorMaxLines: 1,
                    errorStyle: TextStyle(
                      fontSize: 12.sp,
                      height: 2,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  inputFormatters: [LengthLimitingTextInputFormatter(10)],
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a valid phone number';
                    } else if (value.length < 10) {
                      return 'Phone number must be 10 digits';
                    }
                    return null;
                  },
                ),

                12.verticalSpace,

                // Sms Provider text
                Text(TAppTexts.smsProvidermessage,
                    style: Theme.of(context).textTheme.bodySmall!),

                12.verticalSpace,

                SubmitButtonWidget(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pushNamed(
                          context, AppRouteNames.otpVerificationScreen,
                          arguments: _mobileNumController.text);
                    }
                  },
                  buttonText: 'Continue',
                ),
                20.verticalSpace,

                // Divider section
                Row(
                  spacing: 10.0,
                  children: [
                    CustomDividerWidget(),
                    Text(
                      'or',
                      style: TextStyle(fontWeight: FontWeight.w400),
                    ),
                    CustomDividerWidget()
                  ],
                ),
                12.verticalSpace,

                // Signup option section
                SocialLoginWidget(
                  socialIconPath: AppResourcePath.emailIcon,
                  text: 'Continue with email',
                  onTap: () {
                    Utility.infoCherryToast(
                        TAppTexts.unAvailableMessage, context);
                  },
                ),
                12.verticalSpace,
                SocialLoginWidget(
                  text: 'Continue with Apple',
                  socialIconPath: AppResourcePath.appleIcon,
                  onTap: () {
                    Utility.infoCherryToast(
                        TAppTexts.unAvailableMessage, context);
                  },
                ),
                12.verticalSpace,
                SocialLoginWidget(
                  text: 'Continue with Google',
                  socialIconPath: AppResourcePath.googleIcon,
                  onTap: () async {
                    FirebaseAuthServices().signIlnWithGoogleAccount(context);
                  },
                ),
                12.verticalSpace,
                SocialLoginWidget(
                  text: 'Continue with Facebook',
                  socialIconPath: AppResourcePath.facebookIcon,
                  onTap: () {
                    Utility.infoCherryToast(
                        TAppTexts.unAvailableMessage, context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
