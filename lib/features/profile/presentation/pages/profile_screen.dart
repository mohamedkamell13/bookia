import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/services/local/shared_pref.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/core/widgets/custom_cached_image.dart';
import 'package:bookia/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:bookia/features/profile/presentation/cubit/profile_state.dart';
import 'package:bookia/features/profile/presentation/widgets/profile_menu_item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProfileCubit>().getProfile();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      buildWhen: (previous, current) =>
          current is GetProfileSuccessState ||
          current is GetProfileLoadingState ||
          current is GetProfileErrorState,
      builder: (context, state) {
        final cubit = context.read<ProfileCubit>();
        return Scaffold(
          appBar: AppBar(
            title: Text('profile'.tr(), style: TextStyles.headline),
            centerTitle: true,
            automaticallyImplyLeading: false,
            actions: [
              IconButton(
                icon: const Icon(Icons.logout),
                onPressed: () async {
                  cubit.clearProfile();
                  await SharedPref.clearData();
                  if (!context.mounted) return;
                  context.go(Routes.login);
                },
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(22),
            child: state is GetProfileLoadingState
                ? const Center(child: CircularProgressIndicator())
                : Column(
                    children: [
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadiusGeometry.circular(100),
                            child: CustomCachedImage(
                              cubit: cubit,
                              url: cubit.profile?.image ?? '',
                              width: 100,
                              height: 100,
                              errorWidget: const Icon(Icons.person, size: 100),
                              progressIndicator: CircularProgressIndicator(),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                cubit.profile?.name ?? '',
                                style: TextStyles.subtitle1,
                              ),
                              Text(
                                cubit.profile?.email ?? '',
                                style: TextStyles.body.copyWith(
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      ProfileMenuItem(
                        title: 'myOrders'.tr(),
                        onTap: () => context.push(Routes.myOrders),
                      ),
                      ProfileMenuItem(
                        title: 'editProfile'.tr(),
                        onTap: () {
                          final cubit = context.read<ProfileCubit>();
                          context.push(Routes.editProfile).then((value) {
                            cubit.getProfile(forceRefresh: true);
                          });
                        },
                      ),
                      ProfileMenuItem(
                        title: 'resetPassword'.tr(),
                        onTap: () => context.push(Routes.changePassword),
                      ),
                      ProfileMenuItem(
                        title: 'FAQ'.tr(),
                        onTap: () => context.push(Routes.faq),
                      ),
                      ProfileMenuItem(
                        title: 'contactUs'.tr(),
                        onTap: () => context.push(Routes.contactUs),
                      ),
                      ProfileMenuItem(title: 'privacyTerms'.tr(), onTap: () {}),
                    ],
                  ),
          ),
        );
      },
    );
  }
}
