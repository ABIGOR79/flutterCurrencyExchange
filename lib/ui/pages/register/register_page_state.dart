class UserState {
  final bool isSubmitting;
  final bool isSuccess;
  final bool isError;

  UserState({
    this.isSubmitting = false,
    this.isSuccess = false,
    this.isError = false,
  });

  UserState copyWith({
    bool? isSubmitting,
    bool? isSuccess,
    bool? isError,
  }) {
    return UserState(
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      isError: isError ?? this.isError,
    );
  }
}
