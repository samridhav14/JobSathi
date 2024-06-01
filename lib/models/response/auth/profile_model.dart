import 'dart:convert';

ProfileRes profileResFromJson(String str) => ProfileRes.fromJson(json.decode(str));

String profileResToJson(ProfileRes data) => json.encode(data.toJson());

class ProfileRes {
    ProfileRes({
        required this.id,
        required this.username,
        required this.email,
        required this.isAdmin,
        required this.isAgent,
        required this.skills,
        required this.updatedAt,
        required this.location,
        required this.profile,
        required this.phone,
    });

    final String id;
    final String username;
    final String email;
    final bool isAdmin;
    final bool isAgent;
    final List<String> skills;
    final DateTime updatedAt;
    final String location;
    final String profile;
    final String phone;

    factory ProfileRes.fromJson(Map<String, dynamic> json){ 
      return ProfileRes(
        id: json["_id"],
        username: json["username"],
        email: json["email"],
        isAdmin: json["isAdmin"],
        isAgent: json["isAgent"],
        skills: List<String>.from(json["skills"].map((x) => x)),
        updatedAt: DateTime.parse(json["updatedAt"]),
        location: json["location"],
        profile: json["profile"],
        phone: json["phone"],
    );
    }
    Map<String, dynamic> toJson() => {
        "_id": id,
        "username": username,
        "email": email,
        "isAdmin": isAdmin,
        "isAgent": isAgent,
        "skills": List<dynamic>.from(skills.map((x) => x)),
        "updatedAt": updatedAt.toIso8601String(),
        "location": location,
        "profile": profile,
        "phone": phone,
    };
}
