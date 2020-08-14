import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:menta/src/classes/user.dart';
import 'package:menta/src/data/user_type_data.dart';
import 'package:menta/src/pages/login.dart';
import 'package:menta/src/utils/auth.dart';
import 'package:menta/src/utils/colors.dart';
import 'package:menta/src/utils/user_type.dart';
import 'package:menta/src/utils/validators.dart';
import 'package:menta/src/widgets/auth_bottom_text.dart';
import 'package:menta/src/widgets/auth_submit_button.dart';
import 'package:menta/src/widgets/auth_text.dart';
import 'package:menta/src/widgets/auth_text_field.dart';
import 'package:menta/src/widgets/auth_title.dart';
import 'package:menta/src/widgets/auth_user_type_button.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  UserType user_type;
  final TextEditingController _name_text_controller = TextEditingController();
  final TextEditingController _email_text_controller = TextEditingController();
  final TextEditingController _password_text_controller = TextEditingController();
  final TextEditingController _alamat_text_controller = TextEditingController();
  final TextEditingController _nik_text_controller = TextEditingController();
  DateTime _tanggal_lahir;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String user_type_name;
  List<FocusNode> focus_nodes = [];
  File _image;
  final picker = ImagePicker();
  FToast fToast;

  @override
  void initState() {
    super.initState();
    user_type = UserType.patient;
    user_type_name = map_user_type_data[UserType.patient].name;
    _tanggal_lahir = DateTime(1990, 1, 1);

    for (var i = 0; i < 7; i++) {
      focus_nodes.add(new FocusNode());
      focus_nodes[i].addListener(() {
        setState(() {});
      });
    }

    fToast = FToast(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.symmetric(horizontal: 25.0),
        child: ListView(
          children: <Widget>[
            AuthTitle("Choose Account Type And Register"),
            appendUserTypeRow(),
            appendAuthText(user_type,
                "Hello $user_type_name!\nPlease fill out the form to register"),
            appendInputColumn(),
            appendSubmitRow(context),
          ],
        ),
      )),
    );
  }

  Padding appendSubmitRow(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          authBottomText(
              context: context,
              unlinked_text: "Have an account ? ",
              linked_text: "Login",
              destination: Login()),
          submitButton(
              isButtonEnabled: isRegisterButtonEnabled(),
              text: "Register",
              callback: () => register(context))
        ],
      ),
    );
  }

  Padding appendUserTypeRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 40.0,
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        AuthUserTypeButton(
            user_type,
            map_user_type_data[UserType.psychiatrist],
            () => changeUserType(
                map_user_type_data[UserType.psychiatrist].user_type)),
        AuthUserTypeButton(
            user_type,
            map_user_type_data[UserType.patient],
            () =>
                changeUserType(map_user_type_data[UserType.patient].user_type)),
      ]),
    );
  }

  changeUserType(UserType button_user_type) {
    this.setState(() {
      user_type = button_user_type;
      user_type_name = map_user_type_data[user_type].name;
    });
  }

  Padding appendInputColumn() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        children: [
          buildTextField(
              isObscure: false,
              textEditingController: _email_text_controller,
              hintText: "Email",
              focus_num: 0,
              focus_nodes: focus_nodes,
              prefix_icon: Icon(
                Icons.email,
                color: Colors.grey[200],
              )),
          buildTextField(
              isObscure: false,
              textEditingController: _name_text_controller,
              hintText: "Name",
              focus_num: 1,
              focus_nodes: focus_nodes,
              prefix_icon: Icon(
                Icons.person,
                color: Colors.grey[200],
              )),
          buildTextField(
              isObscure: true,
              textEditingController: _password_text_controller,
              hintText: "Password",
              focus_num: 2,
              focus_nodes: focus_nodes,
              prefix_icon: Icon(
                Icons.lock,
                color: Colors.grey[200],
              )),
          user_type != UserType.psychiatrist ? SizedBox() : imageUploader()
        ],
      ),
    );
  }

  Column imageUploader() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: Text(
            "Physchiatrist Certificate",
            style: TextStyle(
              color: AppColors.grey_font,
              fontSize: 20.0,
            ),
          ),
        ),
        Center(
          child:
              _image == null ? Text('No image selected.') : Image.file(_image),
        ),
        FloatingActionButton(
          onPressed: getImage,
          tooltip: 'Pick Image',
          child: Icon(Icons.add_a_photo),
        ),
      ],
    );
  }

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      _image = File(pickedFile.path);
    });
  }

  register(BuildContext context) {
    String email = _email_text_controller.text;
    if (AppAuth.emailExist(email)) {
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text("Email sudah terpakai"),
      ));

      return;
    }

    User user = User(
        _name_text_controller.text,
        "0",
        DateTime.parse("1990-01-01"),
        "-",
        0,
        email,
        _password_text_controller.text,
        user_type);

    AppAuth.register(user);

    //_scaffoldKey.currentState.showSnackBar(SnackBar(
    //  content: Text("Berhasil Mendaftar"),
    //));
    Widget toast = Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: AppColors.primary,
        ),
        child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
            Icon(Icons.check, color: Colors.white,),
            SizedBox(
            width: 12.0,
            ),
            Text(
              "Register Success",
              style: TextStyle(
                color: Colors.white
              ),
            ),
        ],
        ),
    );
    
    fToast.showToast(
        child: toast,
        gravity: ToastGravity.BOTTOM,
        toastDuration: Duration(seconds: 2),
    );

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
      return Login();
    }));
  }

  bool get isPopulated =>
      _email_text_controller.text.isNotEmpty &&
      _password_text_controller.text.isNotEmpty &&
      _name_text_controller.text.isNotEmpty &&
      ((user_type == UserType.psychiatrist && _image != null ||
          user_type == UserType.patient));

  bool isRegisterButtonEnabled() =>
      isPopulated && Validators.isValidEmail(_email_text_controller.text);
}
