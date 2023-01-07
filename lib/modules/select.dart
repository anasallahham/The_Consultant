import 'package:flutter/material.dart';
import 'package:the_consultant/language/language_constants.dart';
import 'package:the_consultant/modules/login_expert.dart';
import 'package:the_consultant/modules/login_user.dart';
import 'package:the_consultant/shared/components/coustmebuttonsauth.dart';

class Select extends StatefulWidget {
  @override
  State<Select> createState() => _SelectState();
}

class _SelectState extends State<Select> {
  var people = "User";

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formstate = GlobalKey<FormState>();

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          toolbarHeight: 70,
          centerTitle: true,
          title:  Text(
            translation(context).who,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 20,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: formstate,
            child: ListView(
              children: [
                Container(
                  height: 300,
                  width: 500,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage("assets/images/select.png"),
                    fit: BoxFit.fill,
                  )),
                ),
                Expanded(
                  child: Container(
                    width: 275,
                    height: 230,
                    decoration: BoxDecoration(

                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50)),
                    child: Padding(
                      padding: EdgeInsets.all(18),
                      child: Column(
                        children: [
                          Text(translation(context).enter,
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                               Text(style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                                translation(context).user,
                              ),
                              Radio(
                                  value: "User",
                                  groupValue: people,
                                  onChanged: (val) {
                                    setState(() {
                                      people = "User";
                                    });
                                  }),
                               Text(translation(context).expert,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                              Radio(
                                  value: "Expert",
                                  groupValue: people,
                                  onChanged: (val) {
                                    setState(() {
                                      people = "Expert";
                                    });
                                  })
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                CoustemButtonAuth(
                    text: translation(context).signIn,
                    onPressed: () {
                      if (people == "User") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginUser()),
                        );
                      } else if (people == "Expert") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginExpert()),
                        );
                      }
                      ;
                    }),
              ],
            ),
          ),
        ));
  }
}
