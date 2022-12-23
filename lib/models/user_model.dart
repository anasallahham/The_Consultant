class User
{
   String name;
   String email;
   String password;
   double money;

   User({
      required this.name,
      required this.email,
      required this.password,
      required this.money
   });

   factory User.fromJson(Map<String,dynamic> jsonData)
   {
      return User(
         name: jsonData['name'],
         email: jsonData['email'],
         password: jsonData['password'],
         money: jsonData['money'],
      );
   }
}