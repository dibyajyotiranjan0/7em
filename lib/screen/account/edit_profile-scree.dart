import 'package:em/static/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import '../../model/login_model.dart';
import '../../static/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfilescreen extends StatefulWidget {
  // UserDetail userDetails;
  // EditProfilescreen({required this.userDetails, super.key});

  @override
  State<EditProfilescreen> createState() => _EditProfilescreenState();
}

class _EditProfilescreenState extends State<EditProfilescreen> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUser();
  }

  getUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var namee = await preferences.getString('name');
    var emaile = await preferences.getString('email');
    var phonee = await preferences.getString('phone');
    name = TextEditingController(text: namee ?? "");
    email = TextEditingController(text: emaile ?? "");
    phone = TextEditingController(text: phonee ?? "");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.8,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Text('Update Your Account',
              //       style: Theme.of(context).textTheme.bodyLarge),
              // ),
              // SizedBox(height: 20),
              // // // Profile Icon
              // Stack(
              //   children: [
              //     Icon(
              //       Icons.account_circle_outlined,
              //       size: 150,
              //       color: Colors.black,
              //     ),
              //     Positioned(
              //         bottom: 10,
              //         right: 10,
              //         child: Card(
              //           color: Colors.white,
              //           child: Icon(
              //             Icons.cloud_upload,
              //             size: 40,
              //             color: Colors.black,
              //           ),
              //         ))
              //   ],
              // ),
              SizedBox(height: 100),
              // Name Input
              TextFormField(
                controller: name,
                decoration: InputDecoration(
                  labelText: 'Name',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colo.greycolorCode, width: 1),
                    //  BorderSide(
                    //   color: Colo.buttonPrimary,
                    //   width: 2.0,
                    // ),
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              // Email Input
              TextFormField(
                controller: email,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: 'Email',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colo.greycolorCode, width: 1),
                    //  BorderSide(
                    //   color: Colo.buttonPrimary,
                    //   width: 2.0,
                    // ),
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              // Phone Input
              TextFormField(
                controller: phone,
                decoration: InputDecoration(
                  hintText: "Emirates",
                  labelText: 'Phone',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colo.greycolorCode, width: 1),
                    //  BorderSide(
                    //   color: Colo.buttonPrimary,
                    //   width: 2.0,
                    // ),
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 30),
              // Dropdown for City
              // DropdownButtonFormField2<String>(
              //   decoration: InputDecoration(
              //     labelText: 'City',
              //     floatingLabelBehavior: FloatingLabelBehavior.always,
              //     enabledBorder: OutlineInputBorder(
              //       borderSide: BorderSide(color: Colo.greycolorCode, width: 1),
              //       //  BorderSide(
              //       //   color: Colo.buttonPrimary,
              //       //   width: 2.0,
              //       // ),
              //     ),
              //     border: OutlineInputBorder(),
              //   ),
              //   items: [
              //     DropdownMenuItem(child: Text('Emirates'), value: 'Emirates'),
              //     // Add more items as needed
              //   ],
              //   onChanged: (value) {},
              // ),
              // SizedBox(height: 20),
              // // Proceed Button
              SizedBox(
                height: 48,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(color: Colors.transparent)),
                    backgroundColor: Colo.buttonPrimary,
                    // padding: EdgeInsets.symmetric(vertical: 16),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Update',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
