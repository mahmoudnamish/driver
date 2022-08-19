import 'package:dlx_task/view/resource/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DefultBottom extends StatelessWidget {
  final double width;
  final Color background;
  final Function onpresse;
  final String text;

  const DefultBottom(
      {super.key,
      required this.width,
      required this.background,
      required this.onpresse,
      required this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(12),
        color: background,
      ),
      child: MaterialButton(
        onPressed: () {
          onpresse();
        },
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}

class DefultTextButtom extends StatelessWidget {
  final Function function;
  final String text;
  final Color color;
  const DefultTextButtom(
      {super.key,
      required this.function,
      required this.text,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          function();
        },
        child: Text(
          text,
          style: TextStyle(color: color, fontSize: 15),
        ));
  }
}

class BoardingModele {
  final String image;
  final String title;
  final String body;
  BoardingModele(
      {required this.image, required this.title, required this.body});
}

Widget Bordinditem(BoardingModele modele) => Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Expanded(
          flex: 10,
          child: Image(
            image: AssetImage('${modele.image}'),
            width: 300,
            height: 300,
          )),
      Expanded(
        flex: 2,
        child: Text(
          '${modele.title}',
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      Expanded(
        flex: 2,
        child: Text(
          '${modele.body}',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, color: Colors.grey[700]),
        ),
      ),
    ]);

class DefultTextFormField extends StatelessWidget {
  final String text;
  final IconData prefux;
  final TextInputType type;
  final TextEditingController controle;
  final FormFieldValidator valaditor;
  Function(String?)? onchange;
  Function? suficepress;
  IconData? sufex;
  Function(String?)?onsubmitted;
  bool textScure = false;
  DefultTextFormField(
      {super.key,
      required this.text,
      required this.prefux,
      required this.type,
      required this.controle,
      required this.valaditor,
       this.onsubmitted,
      this.onchange,

      this.sufex,
      this.suficepress,
      required this.textScure});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // autofocus: true,
      cursorColor: ColorManager.primary,
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[200],
            labelStyle: const TextStyle(color: Colors.grey),
            labelText: text,
            prefixIcon: Icon(prefux, color: Colors.grey),
            suffixIcon: sufex != null
                ? IconButton(
                    onPressed: () {
                      suficepress!();
                    },
                    icon: Icon(sufex, color: Colors.grey))
                : null,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(
                  color: Colors.teal,
                  width: 2,
                )),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.teal,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(20)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey, width: 2),
                borderRadius: BorderRadius.circular(20))),
        keyboardType: type,
        controller: controle,
        onChanged: onchange,
        obscureText: textScure,
        validator: valaditor,
         onFieldSubmitted: onsubmitted,
    );
  }
}

void Showtoast({required String masage, required tostestate state}) =>
    Fluttertoast.showToast(
      msg: masage,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: colorstste(state),
      textColor: Colors.black54,
      fontSize: 16.0,
    );

///كلة دة علشان لما تتبعت قيمة يحدد لون الرسالة قصة
enum tostestate { success, error, warning }
Color? color;
Color? colorstste(tostestate state) {
  switch (state) {
    case tostestate.success:
      color = Colors.green;
      break;
    case tostestate.error:
      color = Colors.red;
      break;
    case tostestate.warning:
      color = Colors.amber;
      break;
  }
  return color;
}

String ? uId ='';
