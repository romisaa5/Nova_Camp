class User {
	int? id;
	String? email;
	String? password;
	String? name;
	String? role;
	String? avatar;
	DateTime? creationAt;
	DateTime? updatedAt;

	User({
		this.id, 
		this.email, 
		this.password, 
		this.name, 
		this.role, 
		this.avatar, 
		this.creationAt, 
		this.updatedAt, 
	});

	factory User.fromJson(Map<String, dynamic> json) => User(
				id: json['id'] as int?,
				email: json['email'] as String?,
				password: json['password'] as String?,
				name: json['name'] as String?,
				role: json['role'] as String?,
				avatar: json['avatar'] as String?,
				creationAt: json['creationAt'] == null
						? null
						: DateTime.parse(json['creationAt'] as String),
				updatedAt: json['updatedAt'] == null
						? null
						: DateTime.parse(json['updatedAt'] as String),
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'email': email,
				'password': password,
				'name': name,
				'role': role,
				'avatar': avatar,
				'creationAt': creationAt?.toIso8601String(),
				'updatedAt': updatedAt?.toIso8601String(),
			};
}
