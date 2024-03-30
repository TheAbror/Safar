part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final SignInResponse data;
  final bool isPasswordHidden;
  final bool isAgreedToTerms;
  final BlocProgress blocProgress;
  final AccountType accountType;
  final String failureMessage;

  const AuthState({
    required this.isPasswordHidden,
    required this.isAgreedToTerms,
    required this.data,
    required this.blocProgress,
    required this.accountType,
    required this.failureMessage,
  });

  factory AuthState.initial() {
    return AuthState(
      isPasswordHidden: true,
      isAgreedToTerms: false,
      data: SignInResponse(
        token: '',
        userInfo: UserInfoResponse(
          id: 0,
          firstname: '',
          lastname: '',
          isActive: false,
          isStaff: false,
          isSuperUser: false,
          dateJoined: '',
          lastLogin: '',
          username: '',
          password: '',
          email: '',
        ),
      ),
      accountType: AccountType.unknown,
      blocProgress: BlocProgress.NOT_STARTED,
      failureMessage: '',
    );
  }

  AuthState copyWith({
    SignInResponse? data,
    bool? isPasswordHidden,
    bool? isAgreedToTerms,
    BlocProgress? blocProgress,
    AccountType? accountType,
    String? failureMessage,
  }) {
    return AuthState(
      data: data ?? this.data,
      isPasswordHidden: isPasswordHidden ?? this.isPasswordHidden,
      isAgreedToTerms: isAgreedToTerms ?? this.isAgreedToTerms,
      blocProgress: blocProgress ?? this.blocProgress,
      accountType: accountType ?? this.accountType,
      failureMessage: failureMessage ?? this.failureMessage,
    );
  }

  @override
  List<Object?> get props => [
        isPasswordHidden,
        isAgreedToTerms,
        data,
        blocProgress,
        failureMessage,
        accountType,
      ];
}
