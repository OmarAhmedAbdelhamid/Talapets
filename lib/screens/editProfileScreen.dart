import 'package:flutter/material.dart';
import 'package:talapets/screens/profile.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final textNameID = TextEditingController();
  final textPohneID = TextEditingController();
  final textEmailID = TextEditingController();
  final textDateOfBirthID = TextEditingController();
  final textGenderID = TextEditingController();
  final textAddressID = TextEditingController();
  final textCreditCardID = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/back75.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: const Color(0xffE3B68D),
            title: Image.asset(
              "assets/images/logo.png",
              height: 60,
              width: 180,
            ),
            centerTitle: true,
            leading: IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (
                  context,
                ) {
                  return const ProfileScreen();
                }));
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25),
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.white,
                        backgroundImage:
                            AssetImage('assets/images/profile.png'),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: () {
                            // Implement the functionality to edit profile picture
                          },
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey.withOpacity(0.7),
                            ),
                            child: Icon(
                              Icons.edit,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                lineMaker(),
                dataEntered(
                  controller: textNameID,
                  hintText: "Name",
                  icon: Icons.account_circle_outlined,
                ),
                lineMaker(),
                dataEntered(
                  controller: textPohneID,
                  hintText: "Phone Number",
                  icon: Icons.phone_iphone,
                ),
                lineMaker(),
                dataEntered(
                  controller: textEmailID,
                  hintText: "Email",
                  icon: Icons.mail_outlined,
                ),
                lineMaker(),
                dataEntered(
                  controller: textDateOfBirthID,
                  hintText: "Date of Birth",
                  icon: Icons.cake_outlined,
                ),
                lineMaker(),
                dataEntered(
                  controller: textGenderID,
                  hintText: "Gender",
                  icon: Icons.male,
                ),
                lineMaker(),
                dataEntered(
                  controller: textAddressID,
                  hintText: "Address",
                  icon: Icons.location_on_outlined,
                ),
                lineMaker(),
                dataEntered(
                  controller: textCreditCardID,
                  hintText: "Credit Card",
                  icon: Icons.credit_card,
                ),
                lineMaker(),
                Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Row(children: [
                    Spacer(),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Save',
                          style: TextStyle(fontSize: 25, fontFamily: 'Caveat')),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff95654E),
                          foregroundColor: Colors.white,
                          fixedSize: Size(170, 60)),
                    ),
                    Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (
                          context,
                        ) {
                          return const ProfileScreen();
                        }));
                      },
                      child: const Text('Done',
                          style: TextStyle(fontSize: 25, fontFamily: 'Caveat')),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff95654E),
                          foregroundColor: Colors.white,
                          fixedSize: Size(170, 60)),
                    ),
                    Spacer(),
                  ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget lineMaker() {
    return Divider(
      color: const Color(0xff95654E),
      thickness: 3,
      height: 7,
    );
  }

  Widget dataEntered({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
    double iconSize = 24.0,
    double paddingSize = 30.0,
    double textFieldWidth = 330.0,
  }) {
    return Row(
      children: [
        Icon(icon, size: iconSize),
        Padding(padding: EdgeInsets.only(right: paddingSize)),
        SizedBox(
          width: textFieldWidth,
          child: TextField(
            controller: controller,
            decoration: InputDecoration(hintText: hintText),
          ),
        ),
      ],
    );
  }
}
