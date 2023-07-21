import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ui_practice/config/app_config/app_config.dart';
import 'package:ui_practice/config/app_config/user_preference.dart';
import 'package:ui_practice/constant/app_color.dart';
import 'package:ui_practice/constant/app_font_size.dart';
import 'package:ui_practice/constant/app_space.dart';
import 'package:ui_practice/model/user_model.dart';
import 'package:ui_practice/util/helper.dart';
import 'package:ui_practice/util/ui_helper.dart';

class SourceAccountBottomSheet extends StatelessWidget {
  final StateProvider<int> selectedProvider;
  final void Function(UserDefaultAccount? bankData)? onTap;
  final ScrollController scrollController;
  const SourceAccountBottomSheet({
    super.key,
    required this.onTap,
    required this.scrollController, required this.selectedProvider,
  });

  @override
  Widget build(BuildContext context) {
    return UIHelper.cardHelper(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(12),
        ),
      ),
      childWidget: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
        controller: scrollController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                  borderRadius: AppBorderRadius.circularBorderRadius,
                  color: AppColor.backgroundPrimary),
              width: 40,
              height: 8,
            ),
          ),
          VerticalSpace.hugeSpace,
          UIHelper.textHelper(
              text: "Select source account:",
              fontWeight: FontWeight.bold,
              textSize: FontSize.fontSizeBigRegular),
          VerticalSpace.smallSpace,
          // SelectedOption(widget.scrollController, widget.onTap)
          _buildSelectedOption(scrollController, onTap: onTap)
        ],
      ),
    );
  }

  Widget _buildSelectedOption(ScrollController? controller,
      {required void Function(UserDefaultAccount? bankData)? onTap}) {
    return Consumer(
      builder: (context, ref, child) {
        final currentSelected = ref.watch(selectedProvider);
        return ListView.separated(
          separatorBuilder: (context, index) => VerticalSpace.mediumSpace,
          controller: controller,
          shrinkWrap: true,
          itemCount: userValue?.userBankInfoList?.length ?? 0,
          itemBuilder: (context, index) {
            final itemValue = userValue?.userBankInfoList?.elementAt(index);
            final bankData = itemValue?.userDefaultAccount;
            return UIHelper.cardHelper(
              color: AppColor.backgroundPrimary.withOpacity(0.2),
              childWidget: InkWell(
                onTap: () {
                  onTap!(bankData);
                  ref.read(selectedProvider.notifier).state = index;
                },
                borderRadius: AppBorderRadius.circularBorderRadius,
                child: Row(
                  children: [
                    Container(
                      width: 10,
                      height: MediaQuery.of(context).size.height * 0.08,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(12),
                              bottomLeft: Radius.circular(12)),
                          color: AppHelper.randomColor()),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          UIHelper.textHelper(text: "${bankData?.accountType}"),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              UIHelper.textHelper(
                                  text: "${bankData?.userBankAccountNumber}"),
                              HorizontalSpace.smallSpace,
                              UIHelper.verticalDivider(
                                  height: 10,
                                  color: AppColor.lightPrimaryColor),
                              HorizontalSpace.smallSpace,
                              UIHelper.textHelper(
                                  text: "${bankData?.currencySymbol}",
                                  textSize: FontSize.fontSizeMedium,
                                  textColor: AppColor.lightPrimaryColor,
                                  fontWeight: FontWeight.bold),
                            ],
                          )
                        ],
                      ),
                    ),
                    const Spacer(),
                    currentSelected == index
                        ? const Icon(Icons.radio_button_checked_rounded)
                        : const Icon(Icons.radio_button_off_outlined),
                    HorizontalSpace.regularSpace,
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
