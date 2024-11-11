class LoginViewState {
  final bool isLoading; // 是否是正在登录状态
  final bool isVerSent; // 是否已经发送验证码
  final int countdown; // 验证码倒计时
  final bool hasFocus; // 是否获取焦点
  final bool showPassword; // 是否显示密码
  final bool showemailQuickChoose; // 是否展示邮箱快速选择
  final bool accountInputIsRight; // 账号是否输入正确
  final bool passwordInputIsRight; // 密码是否输入正确
  final bool showInviteCode; // 是否展示邀请码输入框
  final String areaCode; // 区号
  final String orderId; // 验证码order_id
  final bool showPasswordRequest; // 是否展示密码要求
  final bool isPasswordRequest1; // 是否满足密码要求1
  final bool isPasswordRequest2; // 是否满足密码要求2
  final bool isPasswordRequest3; // 是否满足密码要求3
  final bool shouldNavigate; // 是否需要跳转更改更改页面
  final bool loginSuccess; // 登录成功
  final bool signSuccess; // 注册成功
  final ChangePasswordStatus changePasswordSuccess; // 更改密码成功
  final bool need2FA;// 二次验证
  final LoginFaType loginFaType;// 二次验证
  final String requestId;// 二次验证requestId
  final bool need2FASuccess;// 二次验证是否成功
  final bool addSuccess;// 
  final String emailOrderId; // 验证码order_id
  final String phoneOrderId; // 验证码order_id
  final bool isEmailVerSent; // 是否已经发送验证码
  final bool isPhoneVerSent; // 是否已经发送验证码
  final int emailCountdown; // 邮箱验证码倒计时
  final int phoneCountdown; // 手机验证码倒计时
  
  LoginViewState({
    this.isLoading = false,
    this.isVerSent = false,
    this.countdown = 60,
    this.hasFocus = false,
    this.showPassword = false,
    this.accountInputIsRight = true,
    this.passwordInputIsRight = true,
    this.showemailQuickChoose = false,
    this.showInviteCode = false,
    this.areaCode = "+86",
    this.orderId = "",
    this.showPasswordRequest = false,
    this.isPasswordRequest1 = false,
    this.isPasswordRequest2 = false,
    this.isPasswordRequest3 = false,
    this.shouldNavigate = false,
    this.loginSuccess = false,
    this.signSuccess = false,
    this.changePasswordSuccess = ChangePasswordStatus.none,
    this.need2FA = false,
    this.loginFaType = LoginFaType.none,
    this.requestId = "",
    this.need2FASuccess = false,
    this.addSuccess = false,
    this.emailOrderId = "",
    this.phoneOrderId = "",
    this.isEmailVerSent = false,
    this.isPhoneVerSent = false,
    this.emailCountdown = 60,
    this.phoneCountdown = 60,
  });

  // 初始化
  factory LoginViewState.initial() {
    return LoginViewState(
        isLoading: false,
        isVerSent: false,
        countdown: 60,
        hasFocus: false,
        showPassword: false,
        accountInputIsRight: true,
        passwordInputIsRight: true,
        showemailQuickChoose: false,
        showInviteCode: false,
        areaCode: "+86",
        orderId: "",
        showPasswordRequest: false,
        isPasswordRequest1: false,
        isPasswordRequest2: false,
        isPasswordRequest3: false,
        shouldNavigate: false,
        loginSuccess: false,
        signSuccess: false,
        changePasswordSuccess: ChangePasswordStatus.none,
        need2FA: false,
        loginFaType: LoginFaType.none,
        requestId: "",
        need2FASuccess: false,
        addSuccess: false,
        emailOrderId: "",
        phoneOrderId: "",
        isEmailVerSent: false,
        isPhoneVerSent: false,
        emailCountdown: 60,
        phoneCountdown: 60,
        );
  }
  // 赋值
  LoginViewState copyWith({
    bool? isLoading, // 是否是正在登录状态
    bool? isVerSent, // 是否已经发送验证码
    int? countdown, // 验证码倒计时
    bool? hasFocus, // 是否获取焦点
    bool? showPassword, // 是否显示密码
    bool? accountInputIsRight, // 账号是否输入正确
    bool? passwordInputIsRight, // 密码是否输入正确
    bool? showemailQuickChoose, // 是否展示邮箱快速选择
    bool? showInviteCode, // 是否展示邀请码输入框
    String? areaCode, // 区号
    String? orderId, // 验证码order_id
    bool? showPasswordRequest, // 是否展示密码要求
    bool? isPasswordRequest1, // 是否满足密码要求1
    bool? isPasswordRequest2, // 是否满足密码要求2
    bool? isPasswordRequest3, // 是否满足密码要求3
    bool? shouldNavigate, // 是否需要跳转页面
    bool? loginSuccess, // 登录成功
    bool? signSuccess, // 注册成功
    ChangePasswordStatus? changePasswordSuccess, // 更改密码成功
    bool? need2FA,
    LoginFaType? loginFaType,
    String? requestId,
    bool? need2FASuccess,
    bool? addSuccess,
    String? emailOrderId,
    String? phoneOrderId,
    bool? isEmailVerSent, // 是否已经发送验证码
    bool? isPhoneVerSent, // 是否已经发送验证码
    int? emailCountdown, // 邮箱验证码倒计时
    int? phoneCountdown, // 手机验证码倒计时
  }) {
    return LoginViewState(
      isLoading: isLoading ?? this.isLoading,
      isVerSent: isVerSent ?? this.isVerSent,
      countdown: countdown ?? this.countdown,
      hasFocus: hasFocus ?? this.hasFocus,
      showPassword: showPassword ?? this.showPassword,
      accountInputIsRight: accountInputIsRight ?? this.accountInputIsRight,
      passwordInputIsRight: passwordInputIsRight ?? this.passwordInputIsRight,
      showemailQuickChoose: showemailQuickChoose ?? this.showemailQuickChoose,
      showInviteCode: showInviteCode ?? this.showInviteCode,
      areaCode: areaCode ?? this.areaCode,
      orderId: orderId ?? this.orderId,
      showPasswordRequest: showPasswordRequest ?? this.showPasswordRequest,
      isPasswordRequest1: isPasswordRequest1 ?? this.isPasswordRequest1,
      isPasswordRequest2: isPasswordRequest2 ?? this.isPasswordRequest2,
      isPasswordRequest3: isPasswordRequest3 ?? this.isPasswordRequest3,
      shouldNavigate: shouldNavigate ?? this.shouldNavigate,
      loginSuccess: loginSuccess ?? this.loginSuccess,
      signSuccess: signSuccess ?? this.signSuccess,
      changePasswordSuccess:
          changePasswordSuccess ?? this.changePasswordSuccess,
      need2FA: need2FA ?? this.need2FA,
      loginFaType: loginFaType ?? this.loginFaType,
      requestId: requestId ?? this.requestId,
      need2FASuccess: need2FASuccess ?? this.need2FASuccess,
      addSuccess: addSuccess ?? this.addSuccess,
      emailOrderId: emailOrderId ?? this.emailOrderId,
      phoneOrderId: phoneOrderId ?? this.phoneOrderId,
      isEmailVerSent: isEmailVerSent ?? this.isEmailVerSent,
      isPhoneVerSent: isPhoneVerSent ?? this.isPhoneVerSent,
      emailCountdown: emailCountdown ?? this.emailCountdown,
      phoneCountdown: phoneCountdown ?? this.phoneCountdown,
    );
  }
}

/// 输入框类型
enum LoginInputType {
  none,
  email,
  phone,
  password,
  ver,
}

/// 登录类型
enum LoginType {
  none,

  /// 邮箱登录
  loginEmail,

  /// 手机号登录
  loginPhone,

  /// 邮箱注册
  signEmail,

  /// 手机号注册
  signPhone,

  /// 邮箱忘记密码
  forgetPasswordEmail,

  /// 手机号忘记密码
  forgetPasswordPhone,

  /// 重置密码
  resetPassword,

  // 二次验证
  verFa,
}

enum LoginFaType{
  email,
  phone,
  google,
  addAddressEmail,
  addAddressPhone,
  none,
}

enum ChangePasswordStatus { success, fail, none }
