import 'package:bookia/core/di/service_locator.dart';
import 'package:bookia/core/functions/dialogs.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/core/widgets/custom_back_button.dart';
import 'package:bookia/core/widgets/custom_text_form_field.dart';
import 'package:bookia/core/widgets/main_button.dart';
import 'package:bookia/features/contact_us/presentation/cubit/contact_us_cubit.dart';
import 'package:bookia/features/contact_us/presentation/cubit/contact_us_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _subjectController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ContactUsCubit>(),
      child: BlocListener<ContactUsCubit, ContactUsState>(
        listener: (context, state) {
          if (state is ContactUsSuccessState) {
            showMyDialog(context, 'messageSent'.tr(), type: DialogType.success);
            Navigator.pop(context);
          }
          if (state is ContactUsErrorState) {
            showMyDialog(context, state.message);
          }
        },
        child: Scaffold(
          appBar: AppBar(
            centerTitle: false,
            title: const CustomBackButton(),
            automaticallyImplyLeading: false,
          ),
          body: Padding(
            padding: EdgeInsets.all(22),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('contactUs'.tr(), style: TextStyles.headline),
                    const Gap(24),
                    CustomTextFormField(
                      controller: _nameController,
                      hintText: 'name'.tr(),
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'validName'.tr();
                        }
                        return null;
                      },
                    ),
                    const Gap(16),
                    CustomTextFormField(
                      controller: _emailController,
                      hintText: 'Email'.tr(),
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'validEmail'.tr();
                        }
                        if (!value.contains('@')) {
                          return 'validEmailFormat'.tr();
                        }
                        return null;
                      },
                    ),
                    const Gap(16),
                    CustomTextFormField(
                      controller: _subjectController,
                      hintText: 'subject'.tr(),
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'validSubject'.tr();
                        }
                        return null;
                      },
                    ),
                    const Gap(16),
                    TextFormField(
                      controller: _messageController,
                      maxLines: 5,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(hintText: 'message'.tr()),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'validMessage'.tr();
                        }
                        return null;
                      },
                    ),
                    const Gap(32),
                    BlocBuilder<ContactUsCubit, ContactUsState>(
                      builder: (context, state) {
                        return MainButton(
                          onPressed: state is ContactUsLoadingState
                              ? () {}
                              : () {
                                  if (_formKey.currentState!.validate()) {
                                    context.read<ContactUsCubit>().sendMessage(
                                      name: _nameController.text,
                                      email: _emailController.text,
                                      subject: _subjectController.text,
                                      message: _messageController.text,
                                    );
                                  }
                                },
                          text: state is ContactUsLoadingState
                              ? 'loading'.tr()
                              : 'sendMessage'.tr(),
                        );
                      },
                    ),
                    const Gap(20),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
