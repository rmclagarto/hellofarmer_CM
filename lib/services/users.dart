class User {
  final String name;
  final String email;
  
  User({
    required this.name,
    required this.email,
    //UUID
    // telefone (op)
    // 
  });
  
  // Convert user to map for storage
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
    };
  }
  
  // Create user from map
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
    );
  }
  
  @override
  String toString() => 'User(name: $name, email: $email)';
}