import 'dart:io';
import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/core/functions/dialogs.dart';
import 'package:bookia/core/routes/navigations.dart';
import 'package:bookia/core/functions/validators.dart';
import 'package:bookia/core/styles/colors.dart';
import 'package:bookia/core/widgets/custom_svg_picture.dart';
import 'package:bookia/core/widgets/custom_text_form_field.dart';
import 'package:bookia/core/widgets/main_button.dart';
import 'package:bookia/features/profile/presentation/pages/edit_profile/cubit/edit_profile_cubit.dart';
import 'package:bookia/features/profile/presentation/pages/edit_profile/cubit/edit_profile_state.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  String path = '';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditProfileCubit, EditProfileState>(
      listener: (context, state) {
        if (state is EditProfileSuccess) {
          pop(context);
          pop(context);
        } else if (state is EditProfileError) {
          pop(context);
          showMyDialog(context, 'failedUpdateProfile'.tr());
        } else if (state is EditProfileLoading) {
          showLoadingDialog(context);
        }
      },
      builder: (context, state) {
        var cubit = context.read<EditProfileCubit>();
        return Scaffold(
          appBar: AppBar(title: Text('editProfile'.tr())),
          body: Padding(
            padding: EdgeInsets.all(22),
            child: Column(
              children: [
                Stack(
                  children: [
                    if (path.isNotEmpty)
                      ClipOval(
                        child: Image.file(
                          File(path),
                          width: 120,
                          height: 120,
                          fit: BoxFit.cover,
                        ),
                      ),
                    if (path.isEmpty && cubit.imageUrl.isNotEmpty)
                      ClipOval(
                        child: CachedNetworkImage(
                          imageUrl: cubit.imageUrl,
                          width: 120,
                          height: 120,
                          fit: BoxFit.cover,
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) =>
                                  const CircularProgressIndicator(),
                          errorWidget: (context, url, error) => const Icon(
                            Icons.person,
                            size: 100,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                    if (path.isEmpty && cubit.imageUrl.isEmpty)
                      CircleAvatar(
                        radius: 60,
                        backgroundColor: AppColors.accentColor,
                        child: CustomSvgPicture(
                          path: AppImages.profile,
                          color: AppColors.primaryColor,
                          width: 100,
                          height: 100,
                        ),
                      ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: () async {
                          pickProfileImage();
                        },
                        child: CircleAvatar(
                          radius: 16,
                          backgroundColor: AppColors.backgroundColor,
                          child: CustomSvgPicture(path: AppImages.camera),
                        ),
                      ),
                    ),
                  ],
                ),
                const Gap(50),
                CustomTextFormField(
                  controller: cubit.nameController,
                  hintText: 'name'.tr(),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'validName'.tr();
                    }
                    return null;
                  },
                ),
                const Gap(12),
                CustomTextFormField(
                  controller: cubit.phoneController,
                  hintText: 'phone'.tr(),
                  validator: (value) {
                    if (value != null &&
                        value.isNotEmpty == true &&
                        !isEgyptianNumber(value)) {
                      return 'validPhoneFormat'.tr();
                    }
                    return null;
                  },
                ),
                const Gap(12),
                CustomTextFormField(
                  controller: cubit.addressController,
                  hintText: 'address'.tr(),
                ),
              ],
            ),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(22),
            child: MainButton(
              text: 'updateProfile'.tr(),
              onPressed: () {
                cubit.updateProfile(path.isNotEmpty ? File(path) : null);
              },
            ),
          ),
        );
      },
    );
  }

  void pickProfileImage() async {
    var picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        path = image.path;
      });
    }
  }
}
