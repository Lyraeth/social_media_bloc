import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_bloc/features/profile/data/api_profile_repository.dart';
import 'package:social_media_bloc/features/profile/presentation/cubits/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ApiProfileRepository apiProfileRepository;

  ProfileCubit({required this.apiProfileRepository}) : super(ProfileInitial());

  // Fetch data profileUser
  Future<void> fetchUserProfile({required String nis}) async {
    try {
      emit(ProfileLoading());
      final profileUser = await apiProfileRepository.fetchUserProfile(nis);

      if (profileUser != null) {
        emit(ProfileLoaded(profileUser));
      } else {
        emit(ProfileError("User not found.."));
      }
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }
}
