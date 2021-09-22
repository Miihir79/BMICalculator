import 'package:untitled/constants/app_constants.dart';
import 'package:untitled/widgets/left_bar.dart';
import 'package:untitled/widgets/right_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget{
  @override
  _HomeScreen createState() => _HomeScreen();
}
class _HomeScreen extends State<HomeScreen>{

  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  double _bmiResult =0;
  String _textResult="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator",style: TextStyle(color: accentHexColor,fontWeight: FontWeight.w300),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: mainHexColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            RightBar(barWidth: 40, opacity: 0.8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 150,
                  child: TextField(
                    controller: _heightController,
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w300,
                      color:accentHexColor
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Height (m)",
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 30,
                        color: Colors.white.withOpacity(.8)
                      )
                    ),
                  ),

                ),
                Container(
                  width: 150,
                  child: TextField(
                    controller: _weightController,
                    style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color:accentHexColor
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Weight(kg)",
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 30,
                            color: Colors.white.withOpacity(.8)
                        )
                    ),
                  ),

                )
              ],
            ),
            SizedBox(height: 30),
            GestureDetector(
              onTap: (){
                  double _h = double.parse(_heightController.text);
                  double _w = double.parse(_weightController.text);
                  setState(() {
                    _bmiResult = _w/(_h *_h);
                    if(_bmiResult>25){
                      _textResult = "You\'re over Weight";
                    }
                    else if(_bmiResult>=18.5){
                      _textResult = "You have normal Weight";
                    }else{
                      _textResult = "You\'re under Weight";
                    }
                  });
              },
              child: Text("Calculate",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: accentHexColor),),
            ),
            SizedBox(height: 50),
            Visibility(
              visible: _textResult.isNotEmpty,
              child:Container(
                child: Text(_bmiResult.toStringAsFixed(2),
                    style: TextStyle(fontSize: 90,color: accentHexColor)
                ),
              )
            ),

            SizedBox(height: 30),
            Visibility(
                visible: _textResult.isNotEmpty,
                child:Container(
                  child: Text(_textResult,style: TextStyle(fontSize: 32,fontWeight: FontWeight.w400,color: accentHexColor)),
                ),
            ),

            SizedBox(height: 10),
            LeftBar(barWidth: 40,opacity:1.0),
            SizedBox(height: 10),
            LeftBar(barWidth: 70,opacity:1.0),
            SizedBox(height: 10),
            LeftBar(barWidth: 40,opacity:1.0),
            SizedBox(height: 10),
            RightBar(barWidth: 40,opacity:1.0),
            SizedBox(height: 30),
            RightBar(barWidth: 40,opacity:1.0)
          ],
        )
      ),
    );
  }
}