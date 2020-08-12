import 'package:flutter/material.dart';
import 'package:menta/src/classes/user.dart';
import 'package:menta/src/data/logged_user.dart';
import 'package:menta/src/data/user_type_data.dart';
import 'package:menta/src/utils/auth.dart';
import 'package:menta/src/utils/colors.dart';
import 'package:menta/src/utils/size.dart';
import 'package:menta/src/utils/user_type.dart';
import 'package:menta/src/utils/validators.dart';
import 'package:menta/src/widgets/auth_submit_button.dart';
import 'package:menta/src/widgets/auth_text_field.dart';
import 'package:menta/src/widgets/auth_title.dart';
import 'package:menta/src/widgets/auth_user_type_button.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  UserType user_type;
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  List<FocusNode> focus_nodes = [];

  @override
  void initState() {
    super.initState();

    user_type = UserType.patient;

    for (var i = 0; i < 2; i++) {
      focus_nodes.add(new FocusNode());
      focus_nodes[i].addListener(() {
        setState(() {});
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: Container(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            children: <Widget>[
              AuthTitle("Choose Account Type And Login"),
              appendUserTypeRow(),
              appendLoginText(),
              appendInputColumn(),
              appendSubmitRow(context),
            ],
          ),
        ),
      ),
    );
  }

  changeUserType(UserType button_user_type) {
    this.setState(() {
      user_type = button_user_type;
    });
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

  Text appendLoginText() {
    String user_name = map_user_type_data[user_type].name;
    return Text(
      "Hello $user_name!\nPlease fill out the form to get started",
      textAlign: TextAlign.center,
      style: TextStyle(
        color: AppColors.grey_font,
        fontSize: 20,
      ),
    );
  }

  Padding appendInputColumn() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        children: [
          buildTextField(
              isObscure: false,
              textEditingController: _emailTextController,
              hintText: "Email",
              focus_num: 0,
              focus_nodes: focus_nodes,
              prefix_icon: Icon(
                Icons.email,
                color: Colors.grey[200],
              )),
          buildTextField(
              isObscure: true,
              textEditingController: _passwordTextController,
              hintText: "Password",
              focus_num: 1,
              focus_nodes: focus_nodes,
              prefix_icon: Icon(
                Icons.lock,
                color: Colors.grey[200],
              )),
        ],
      ),
    );
  }

  Padding appendSubmitRow(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          signUpText(),
          submitButton(
              isButtonEnabled: isLoginButtonEnabled(),
              text: "Login",
              callback: () => login(context))
        ],
      ),
    );
  }

  Container signUpText() {
    return Container(
      height: 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "No Account ? ",
            style: TextStyle(
              color: AppColors.grey_font,
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
          GestureDetector(
            child: Text(
              "Sign Up",
              style: TextStyle(
                color: AppColors.big_blue_font,
                decoration: TextDecoration.underline,
                fontSize: 17,
                fontWeight: FontWeight.w800,
              ),
            ),
            //TODO implementasi menuju halaman register
            onTap: () => {},
          ),
        ],
      ),
    );
  }

  login(BuildContext context) {
    User user = AppAuth.accountExist(
      email: _emailTextController.text,
      password: _passwordTextController.text,
      user_type: user_type,
    );

    if (user != null) {
      LoggedUser.Login(user);
      print(LoggedUser().getUser().email);
      //TODO implementasi ke homepage
    } else {
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text("Akun Tidak Ditemukan"),
      ));
    }
  }

  bool get isPopulated =>
      _emailTextController.text.isNotEmpty &&
      _passwordTextController.text.isNotEmpty;

  bool isLoginButtonEnabled() =>
      isPopulated && Validators.isValidEmail(_emailTextController.text);
}
