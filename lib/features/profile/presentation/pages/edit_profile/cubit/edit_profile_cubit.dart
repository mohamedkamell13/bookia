import 'dart:io';
import 'package:bookia/core/services/local/shared_pref.dart';
import 'package:bookia/features/profile/data/models/update_profile_params.dart';
import 'package:bookia/features/profile/data/repo/profile_repo.dart';
import 'package:bookia/features/profile/presentation/pages/edit_profile/cubit/edit_profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit() : super(EditProfileInitial());

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  String imageUrl = '';

  void loadInitData() {
    var profileData = SharedPref.getUserInfo();
    nameController.text = profileData?.name ?? '';
    phoneController.text = profileData?.phone ?? '';
    addressController.text = profileData?.address ?? '';
    imageUrl = profileData?.image ?? '';
    emit(EditProfileSuccess());
  }

  Future<void> updateProfile(File? image) async {
    emit(EditProfileLoading());
    var params = UpdateProfileParams(
      name: nameController.text,
      phone: phoneController.text,
      address: addressController.text,
      image: image,
    );
    var response = await ProfileRepo.editProfile(params);
    response.fold(
      (l) => emit(EditProfileError()),
      (r) => emit(EditProfileSuccess()),
    );
  }
}
