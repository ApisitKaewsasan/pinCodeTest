import 'package:flutter/material.dart';

class PinCode extends StatelessWidget {
  final int pinLengthy;
  final Function(String) onPin;

   PinCode({Key? key, this.pinLengthy = 4, required this.onPin}) : super(key: key);

  List<TextEditingController> textControl = <TextEditingController>[];

  init(){
    for(int i = 0;i<pinLengthy;i++){
      textControl.add(TextEditingController());
    }
  }

  @override
  Widget build(BuildContext context) {
    init();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: List.generate(
          pinLengthy,
          (index) => Expanded(child: textPin(context,index)),
        ),
      ),
    );
  }

  Container textPin(BuildContext context,int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child:  TextField(
        controller: textControl[index],
        onTap: () {
          textControl[index].clear();
        },
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          hintText: "",
          counterText: "",
        ),
        onChanged: (text){
          validateTextField(context,text,index);
        },

        textInputAction: TextInputAction.next,
        maxLength: 1,
      ),
    );
  }

   validateTextField(BuildContext context,String text,int index){
    if(index+1 != pinLengthy){
      if(textControl[index+1].text.isNotEmpty){
        textControl[index+1].clear();
      }
      FocusScope.of(context).nextFocus();
    }else{
      FocusScope.of(context).unfocus();
      String result = '';
      for(int i = 0;i<textControl.length;i++){
        result+=textControl[i].text;
      }
      onPin.call(result);
    }
  }
}


