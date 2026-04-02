import 'package:bookia/core/routes/navigations.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/features/place_order/data/models/governrate.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

void showGovernorateBottomSheet(
  BuildContext context,
  List<Governorate> governorates,
  Function(Governorate) onSelected,
) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Gap(16),
          Text('governrate'.tr(), style: TextStyles.title),
          const Gap(16),
          Expanded(
            child: ListView.separated(
              itemCount: governorates.length,
              separatorBuilder: (context, index) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final governorate = governorates[index];
                return ListTile(
                  title: Text(
                    governorate.governorateNameEn ?? '',
                    style: TextStyles.body,
                  ),
                  onTap: () {
                    onSelected(governorate);
                    pop(context);
                  },
                );
              },
            ),
          ),
        ],
      );
    },
  );
}
