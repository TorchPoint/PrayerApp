class AppUser {
  int id;
  String firstName;
  String lastName;
  String contactNo;
  String email;
  String emailVerifiedAt;
  String otp;
  String profileImage;
  int completeProfile;
  int accountVerified;
  int isSocial;
  String userSocialToken;
  String userSocialType;
  String userDeviceType;
  String userDeviceToken;
  String createdAt;
  String updatedAt;

  AppUser(
      {this.id,
      this.firstName,
      this.lastName,
      this.contactNo,
      this.email,
      this.emailVerifiedAt,
      this.otp,
      this.profileImage,
      this.completeProfile,
      this.accountVerified,
      this.isSocial,
      this.userSocialToken,
      this.userSocialType,
      this.userDeviceType,
      this.userDeviceToken,
      this.createdAt,
      this.updatedAt});

  AppUser.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    firstName = json['first_name'] ?? "";
    lastName = json['last_name'] ?? "";
    contactNo = json['contact_no'] ?? "";
    email = json['email'] ?? "";
    emailVerifiedAt = json['email_verified_at'] ?? "";
    otp = json['otp'] ?? "";
    profileImage = json['profile_image'];
    completeProfile = json['complete_profile'];
    accountVerified = json['account_verified'];
    isSocial = json['is_social'];
    userSocialToken = json['user_social_token'];
    userSocialType = json['user_social_type'];
    userDeviceType = json['user_device_type'];
    userDeviceToken = json['user_device_token'] ?? "";
    createdAt = json['created_at'] ?? "";
    updatedAt = json['updated_at'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['contact_no'] = this.contactNo;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['otp'] = this.otp;
    data['profile_image'] = this.profileImage;
    data['complete_profile'] = this.completeProfile;
    data['account_verified'] = this.accountVerified;
    data['is_social'] = this.isSocial;
    data['user_social_token'] = this.userSocialToken;
    data['user_social_type'] = this.userSocialType;
    data['user_device_type'] = this.userDeviceType;
    data['user_device_token'] = this.userDeviceToken;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
