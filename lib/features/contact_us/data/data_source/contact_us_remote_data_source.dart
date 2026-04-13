abstract class ContactUsRemoteDataSource {
  Future<bool> sendMessage({
    required String name,
    required String email,
    required String subject,
    required String message,
  });
}
