class Expert
{
   String name;
   String email;
   String password;
   String description;
   String time;
   String phone;
   String address;
   double money;
   String profession;
   String imageUrl;

   Expert({
      required this.name,
      required this.email,
      required this.password,
      required this.description,
      required this.time,
      required this.phone,
      required this.address,
      required this.money,
      required this.profession,
      required this.imageUrl,
   });

   factory Expert.fromJson(Map<String,dynamic> jsonData)
   {
      return Expert(
         email: jsonData['email'],
         password: jsonData['password'],
         name: jsonData['name'],
         description: jsonData['description'],
         time: jsonData['time'],
         phone: jsonData['phone'],
         address: jsonData['address'],
         money: jsonData['money'],
         profession: jsonData['profession'],
         imageUrl: jsonData['imageUrl'],
      );
   }
}