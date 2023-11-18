//* Configuration Manager: Using the singleton pattern
class ConfigurationManager {
  // Private instance variable
  static ConfigurationManager? _instance;

  // Private constructor
  ConfigurationManager._();

  // Factory constructor for creating or accessing the singleton instance
  factory ConfigurationManager() {
    _instance ??= ConfigurationManager._();
    return _instance!;
  }

  // Configuration properties
  String databaseUrl = 'localhost:5432/mydb';
  int logLevel = 2;
}

//* JSON Parsing with fromJson factory constructor

class User {
  final int id;
  final String username;

  User({required this.id, required this.username});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      username: json['username'] as String,
    );
  }

  @override
  String toString() {
    return 'User(id: $id, username: $username)';
  }
}
