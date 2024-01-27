class UsersModel {
  String? usersId;
  String? usersType;
  String? usersName;
  String? usersPhone;
  String? usersEmail;
  String? usersVerfiycode;
  String? usersApprove;
  String? usersPassword;
  String? usersImage;
  String? bannedUsers;

  UsersModel(
      {this.usersId,
      this.usersType,
      this.usersName,
      this.usersPhone,
      this.usersEmail,
      this.usersVerfiycode,
      this.usersApprove,
      this.usersPassword,
      this.usersImage,
      this.bannedUsers});

  UsersModel.fromJson(Map<String, dynamic> json) {
    usersId = json['users_id'];
    usersType = json['users_type'];
    usersName = json['users_name'];
    usersPhone = json['users_phone'];
    usersEmail = json['users_email'];
    usersVerfiycode = json['users_verfiycode'];
    usersApprove = json['users_approve'];
    usersPassword = json['users_password'];
    usersImage = json['users_image'];
    bannedUsers = json['banned_users'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['users_id'] = this.usersId;
    data['users_type'] = this.usersType;
    data['users_name'] = this.usersName;
    data['users_phone'] = this.usersPhone;
    data['users_email'] = this.usersEmail;
    data['users_verfiycode'] = this.usersVerfiycode;
    data['users_approve'] = this.usersApprove;
    data['users_password'] = this.usersPassword;
    data['users_image'] = this.usersImage;
    data['banned_users'] = this.bannedUsers;
    return data;
  }
}