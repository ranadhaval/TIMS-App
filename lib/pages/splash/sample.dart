import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:tims/theme/app_theme.dart';
import 'package:tims/util/hex_code.dart';
import 'package:tims/widgets/input_textfield.dart';

class Sample extends StatefulWidget {
  const Sample({super.key});

  @override
  State<Sample> createState() => _SampleState();
}

class _SampleState extends State<Sample> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, dtype) {
      bool landsacp = orientation == Orientation.landscape;
      double mediaheight = MediaQuery.of(context).size.height;
      double mediawidth = MediaQuery.of(context).size.width;

      return Scaffold(
        appBar: AppBar(
          title: Text(
            'Sample',
            style: TextStyle(color: AppTheme.colorBlack),
          ),
          backgroundColor: AppTheme.AppbarColor,
        ),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            height: landsacp ? mediawidth * 2 : mediaheight,
            width: landsacp ? mediawidth : mediaheight,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    dropwidget(),
                    dropwidget(),
                    view2(
                      name: 'Client First Name',
                      name2: 'Client Last name',
                      id: 01,
                      id2: 02,
                      landscap: landsacp,
                    ),
                    viewAdditional(landsacp),
                    button(),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

  dropdownButton() {
    if (ontap) {
      setState(() {
        ontap = !ontap;
      });
    } else {
      setState(() {
        ontap = !ontap;
      });
    }
  }

  final key = GlobalKey<FormState>();
  bool tap = false;

  Widget view2(
      {required String name,
      name2,
      required int id,
      id2,
      required bool landscap,
      Widget? icon}) {
    return landscap
        ? Row(
            children: [
              nameAndTextfield(name: name, id: id, icon: icon),
              nameAndTextfield(name: name2, id: id2, icon: icon)
            ],
          )
        : Column(
            children: [
              Row(
                children: [
                  nameAndTextfield(name: name, id: id, icon: icon),
                ],
              ),
              Row(
                children: [
                  nameAndTextfield(name: name2, id: id2, icon: icon),
                ],
              )
            ],
          );
  }

  dropwidget() {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 10),
      child: Container(
        color: HexColor('#b9b9b9'),
        child: DropdownButtonFormField<String>(
            decoration: const InputDecoration(
                border: OutlineInputBorder(borderSide: BorderSide.none)),
            onTap: () => dropdownMenuItem,
            icon: Icon(
              ontap
                  ? Icons.keyboard_arrow_up
                  : Icons.keyboard_arrow_down_rounded,
              color: Colors.black,
              size: 20,
            ),
            value: itemval,
            items: i.map((contactItem)).toList(),
            onChanged: (value) {
              setState(() {
                i = value as List<String>;
              });
            }),
      ),
    );
  }

  Widget viewAdditional(bool landscap) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Form(
        key: key,
        child: Card(
          elevation: 8,
          shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.transparent)),
          child: Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              onExpansionChanged: (ex) {
                if (ex) {
                  setState(() {
                    tap = !tap;
                  });
                } else {
                  setState(() {
                    tap = !tap;
                  });
                }
              },
              trailing: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.black)),
                  child: Padding(
                    padding: const EdgeInsets.all(1),
                    child: Icon(
                      tap
                          ? Icons.keyboard_arrow_down_rounded
                          : Icons.keyboard_arrow_up,
                      color: HexColor('#ff5050'),
                      size: 20,
                    ),
                  )),
              title: Row(
                children: [
                  const Text(
                    'Fill Additional',
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'information',
                    style: TextStyle(color: HexColor('#ff5050'), fontSize: 20),
                  )
                ],
              ),
              children: [
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height / 2,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            landscap
                                ? Column(
                                    children: [
                                      textfieldViewTab(
                                          name: "Client Email ID",
                                          name2: 'Address',
                                          id1: 1,
                                          id2: 2),
                                      textfieldViewTab(
                                          name: "Postal Code",
                                          name2: 'Area',
                                          id1: 3,
                                          id2: 4),
                                      textfieldViewTab(
                                          name: "City",
                                          name2: 'State / Province',
                                          id1: 5,
                                          id2: 6),
                                      expansionTiles(
                                          name: 'Country',
                                          name2: 'Priority Level',
                                          landscap: landscap),
                                    ],
                                  )
                                : Column(
                                    children: [
                                      textfieldViewAndroid(
                                          name: "Client Email ID", id: 1),
                                      textfieldViewAndroid(
                                          name: "Address", id: 2),
                                      textfieldViewAndroid(
                                          name: "Postal Code", id: 3),
                                      textfieldViewAndroid(name: "Area", id: 4),
                                      textfieldViewAndroid(name: "City", id: 5),
                                      textfieldViewAndroid(
                                          name: "State / Province", id: 6),
                                      expansionTiles(
                                          name: 'Country', landscap: landscap),
                                      expansionTiles(
                                          name: 'Priority Level',
                                          landscap: landscap),
                                    ],
                                  ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget button() {
    return InkWell(
      onTap: () {
        if (key.currentState!.validate()) {
          print('validate first');
        }
      },
      child: Container(
        padding: EdgeInsets.only(right: 20, left: 20, top: 5),
        decoration: BoxDecoration(
            color: HexColor('#ed2224'),
            borderRadius: BorderRadius.circular(15)),
        child: Column(
          children: const [
            Icon(
              Icons.edit_document,
              color: Colors.white,
              size: 18,
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Save & Continue',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }

  final item = ["Select Country", "India", "china", "America"];
  String? value = "Select Country";
  bool val = false;

  DropdownMenuItem<String> dropdownMenuItem(String ttt) {
    return DropdownMenuItem(
      value: ttt,
      child: Text(ttt),
    );
  }

  List<String> i = ['+91', '+234', '+31', '+432', '+512'];
  String itemval = '+234';
  DropdownMenuItem<String> contactItem(String ttt) {
    return DropdownMenuItem(
      value: ttt,
      child: Text(ttt.toString()),
    );
  }

  bool ontap = false;

  Widget expansion({required String name}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          nameoffield(name),
          MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
            child: Container(
              decoration: BoxDecoration(
                  color: HexColor('#f1f1f1'),
                  borderRadius: BorderRadius.circular(8)),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: DropdownButton<String>(
                      onTap: () {
                        if (ontap) {
                          setState(() {
                            ontap = !ontap;
                          });
                        } else {
                          setState(() {
                            ontap = !ontap;
                          });
                        }
                      },
                      icon: Icon(
                        ontap
                            ? Icons.keyboard_arrow_down_rounded
                            : Icons.keyboard_arrow_up,
                        color: Colors.black,
                        size: 20,
                      ),
                      isExpanded: true,
                      underline: Container(color: Colors.transparent),
                      value: value,
                      items: item.map((dropdownMenuItem)).toList(),
                      onChanged: (Value) {
                        setState(() {
                          this.value = Value;
                        });
                      }),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget expansionTiles({required String name, name2, required bool landscap}) {
    return landscap
        ? Row(
            children: [
              Expanded(child: expansion(name: name)),
              Expanded(child: expansion(name: name2))
            ],
          )
        : Column(
            children: [
              expansion(name: name),
            ],
          );
  }

  Widget textfieldViewTab(
      {required String name, name2, required int id1, id2}) {
    return Row(
      children: [
        nameAndTextfield(name: name, id: id1),
        nameAndTextfield(name: name2, id: id2)
      ],
    );
  }

  Widget textfieldViewAndroid({required String name, required int id}) {
    return Row(
      children: [nameAndTextfield(name: name, id: id)],
    );
  }

  Widget nameAndTextfield(
      {required String name, required int id, Widget? icon}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            nameoffield(
              name,
            ),
            textfield(id: id, icon: icon),
          ],
        ),
      ),
    );
  }

  Widget nameoffield(String fieldname) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            fieldname,
            style: TextStyle(color: HexColor('#b9b9b9')),
          ),
        ],
      ),
    );
  }

  Widget textfield(
      {required int id, Widget? icon, TextEditingController? controller}) {
    return CoustomTextField(
        textEditingController: controller,
        keyboardType: TextInputType.emailAddress,
        prefixIcon: icon,
        borderEnableColors: AppTheme.textfeildColor,
        fillColor: AppTheme.textfeildColor,
        borderFocusColors: AppTheme.textfeildColor,
        textInputAction: TextInputAction.done,
        cursorColor: AppTheme.colorBlack,
        onTextValidator: (value) {
          switch (id) {
            case 01:
              if (value!.isEmpty) {
                return 'invalid Client First Name';
              } else {
                return null;
              }
            case 02:
              if (value!.isEmpty) {
                return 'invalid Client Last Name';
              } else {
                return null;
              }
            case 03:
              if (value!.isEmpty) {
                return 'invalid State / province';
              } else {
                return null;
              }
            case 04:
              if (value!.isEmpty) {
                return 'invalid State / province';
              } else {
                return null;
              }
            case 05:
              if (value!.isEmpty) {
                return 'invalid State / province';
              } else {
                return null;
              }
            case 06:
              if (value!.isEmpty) {
                return 'invalid State / province';
              } else {
                return null;
              }
            case 1:
              if (value!.isEmpty) {
                return 'invalid Email ID';
              } else {
                return null;
              }

            case 2:
              if (value!.isEmpty) {
                return 'invalid Address';
              } else {
                return null;
              }

            case 3:
              if (value!.isEmpty) {
                return 'invalid Postal Code';
              } else {
                return null;
              }
            case 4:
              if (value!.isEmpty) {
                return 'invalid Area';
              } else {
                return null;
              }
            case 5:
              if (value!.isEmpty) {
                return 'invalid City ';
              } else {
                return null;
              }
            case 6:
              if (value!.isEmpty) {
                return 'invalid State / province';
              } else {
                return null;
              }
          }
        },
        borderCorner: 10,
        contentPadding: EdgeInsets.symmetric(
          vertical: 4.w,
          horizontal: 3.0.w,
        ),
        readOnly: false);
  }
}
