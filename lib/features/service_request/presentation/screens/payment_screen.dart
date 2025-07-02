import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_services_app/core/theme/app_colors.dart';
import 'package:home_services_app/core/theme/styles_manager.dart';
import 'package:home_services_app/core/values/app_values.dart';
import 'package:home_services_app/features/payment/data/datasource/payment_remote_datasource.dart';
import 'package:home_services_app/features/payment/data/repository/payment_repository.dart';
import 'package:home_services_app/features/payment/domain/usecases/make_payment_intent_usecase.dart';
import 'package:home_services_app/features/payment/domain/usecases/show_stripe_sheet_usecase.dart';
import 'package:home_services_app/features/payment/presentation/controller/cubit/stripe_cubit.dart';
import 'package:home_services_app/features/payment/presentation/controller/states/stripe_states.dart';
import 'package:home_services_app/features/service_request/presentation/controller/cubit/service_request_cubit.dart';
import 'package:home_services_app/features/service_request/presentation/controller/cubit/settings_cubit.dart';
import 'package:home_services_app/features/service_request/presentation/controller/states/service_request_state.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    context.locale;

    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: BlocProvider.of<SettingsCubit>(context)),
        BlocProvider.value(value: BlocProvider.of<ServiceRequestCubit>(context)),
        BlocProvider(
          create: (_) => StripeCubit(
            MakePaymentUseCase(
              PaymentRepositoryImpl(PaymentRemoteDataSourceImpl()),
            ),
            ShowStripeSheetUseCase(),
          ),
        ),
      ],
      child: BlocConsumer<ServiceRequestCubit, ServiceRequestState>(
        listener: (context, state) {},
        builder: (context, state) {
          final serviceCubit = ServiceRequestCubit.get(context);
          final stripeCubit = BlocProvider.of<StripeCubit>(context);
          final settingsCubit = BlocProvider.of<SettingsCubit>(context);
          final price = ((double.tryParse(serviceCubit.servicePrice ?? '${AppSize.s0}') ?? AppSize.s0) * AppSize.s100).toInt();

          return Padding(
            padding: EdgeInsets.symmetric(vertical: AppSize.s0_05.sh),
            child: Material(
              elevation: AppSize.s10,
              shadowColor: settingsCubit.isDark ? AppColors.lightGrey : AppColors.black,
              borderRadius: BorderRadius.circular(AppSize.s16.r),
              color: AppColors.lightGrey,
              child: Container(
                decoration: BoxDecoration(
                  color: settingsCubit.isDark ? AppColors.darkShade : AppColors.lightGrey,
                  borderRadius: BorderRadius.circular(AppSize.s16.r),
                  border: Border.all(
                    color: AppColors.white,
                    width: AppSize.s4.w,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(AppSize.s8.w),
                  child: Center(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Material(
                            elevation: AppSize.s10,
                            shadowColor: settingsCubit.isDark ? AppColors.lightGrey : AppColors.black,
                            borderRadius: BorderRadius.circular(AppSize.s16.r),
                            child: Container(
                              height: AppSize.s0_2.sh,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(AppSize.s16.r),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(AppSize.s18.w),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text("theService".tr(), style: getBoldStyle(color: AppColors.primary, fontSize: AppSize.s18.sp)),
                                        Text(serviceCubit.translatedServiceName, style: getMediumStyle(color: AppColors.black, fontSize: AppSize.s18.sp)),
                                      ],
                                    ),
                                    SizedBox(height: AppSize.s0_03.sh),
                                    Row(
                                      children: [
                                        Text("totalPrice".tr(), style: getBoldStyle(color: AppColors.primary, fontSize: AppSize.s18.sp)),
                                        Text(serviceCubit.translatedServicePrice, style: getMediumStyle(color: AppColors.black, fontSize: AppSize.s18.sp)),
                                        Text("egp".tr(), style: getMediumStyle(color: AppColors.black, fontSize: AppSize.s18.sp)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: AppSize.s0_09.sh),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: stripeCubit.state is StripeLoading
                                    ? null
                                    : () async {
                                  if (serviceCubit.selectedMethod == null) {
                                    await stripeCubit.makePaymentAndShowSheet(
                                      amount: price,
                                      currency: "currency".tr(),
                                      context: context,
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text("methodSelected".tr(), style: TextStyle(color: AppColors.white)),
                                        backgroundColor: AppColors.error,
                                      ),
                                    );
                                  }
                                },
                                child: Material(
                                  elevation: AppSize.s10,
                                  shadowColor: settingsCubit.isDark ? AppColors.lightGrey : AppColors.black,
                                  shape: const CircleBorder(),
                                  child: CircleAvatar(
                                    backgroundColor: AppColors.primary,
                                    radius: AppSize.s0_16.sw,
                                    child: serviceCubit.selectedMethod == "card".tr()
                                        ? Center(child: Image.asset("assets/images/check_mark_image.png", color: AppColors.white, height: AppSize.s0_28.sw))
                                        : Text("payByCard".tr(), textAlign: TextAlign.center, style: getBoldStyle(color: AppColors.white, fontSize: AppSize.s15.sp)),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (state is StripeSuccess) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text("paymentCompleted".tr(), style: TextStyle(color: AppColors.white)),
                                        backgroundColor: AppColors.error,
                                      ),
                                    );
                                  } else if (serviceCubit.selectedMethod == null) {
                                    serviceCubit.selectMethod("cash".tr());
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text("methodSelected".tr(), style: TextStyle(color: AppColors.white)),
                                        backgroundColor: AppColors.error,
                                      ),
                                    );
                                  }
                                },
                                child: Material(
                                  elevation: AppSize.s10,
                                  shadowColor: settingsCubit.isDark ? AppColors.lightGrey : AppColors.black,
                                  shape: const CircleBorder(),
                                  child: CircleAvatar(
                                    backgroundColor: AppColors.white,
                                    radius: AppSize.s0_16.sw,
                                    child: serviceCubit.selectedMethod == "cash".tr()
                                        ? Center(child: Image.asset("assets/images/check_mark_image.png", height: AppSize.s0_28.sw))
                                        : Text("cashOnDelivery".tr(), textAlign: TextAlign.center, style: getBoldStyle(color: AppColors.primary, fontSize: AppSize.s15.sp)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
