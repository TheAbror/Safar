part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final SignInResponse data;
  final bool isPasswordHidden;
  final bool isWaiting;
  final BlocProgress blocProgress;
  final AccountType accountType;
  final String failureMessage;

  const AuthState({
    required this.isPasswordHidden,
    required this.isWaiting,
    required this.data,
    required this.blocProgress,
    required this.accountType,
    required this.failureMessage,
  });

  factory AuthState.initial() {
    return AuthState(
      isPasswordHidden: true,
      isWaiting: false,
      data: SignInResponse(
        token: '',
        userInfo: UserInfoResponse(
          id: 0,
          firstname: '',
          lastname: '',
          accountType: '',
          status: '',
          username: 0,
          email: '',
          roles: [],
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
    bool? isWaiting,
    BlocProgress? blocProgress,
    AccountType? accountType,
    String? failureMessage,
  }) {
    return AuthState(
      data: data ?? this.data,
      isPasswordHidden: isPasswordHidden ?? this.isPasswordHidden,
      isWaiting: isWaiting ?? this.isWaiting,
      blocProgress: blocProgress ?? this.blocProgress,
      accountType: accountType ?? this.accountType,
      failureMessage: failureMessage ?? this.failureMessage,
    );
  }

  @override
  List<Object?> get props => [
        isPasswordHidden,
        isWaiting,
        data,
        blocProgress,
        failureMessage,
        accountType,
      ];
}
