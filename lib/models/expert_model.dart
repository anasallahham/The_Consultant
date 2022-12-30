class Expert
{
   String name_en;
   String name_ar;
   String email;
   String password;
   String description;
   String time;
   String phone;
   String address;
   double wallet;
   String profession;
   String imageUrl;

   Expert({
      required this.name_en,
      required this.name_ar,
      required this.email,
      required this.password,
      required this.description,
      required this.time,
      required this.phone,
      required this.address,
      required this.wallet,
      required this.profession,
      required this.imageUrl,
   });

   factory Expert.fromJson(Map<String,dynamic> jsonData)
   {
      return Expert(
         email: jsonData['email'],
         password: jsonData['password'],
         name_en: jsonData['name_en'],
         name_ar: jsonData['name_ar'],
         description: jsonData['description'],
         time: jsonData['time'],
         phone: jsonData['phone'],
         address: jsonData['address'],
         wallet: jsonData['wallet'],
         profession: jsonData['profession'],
         imageUrl: jsonData['imageUrl'],
      );
   }
}