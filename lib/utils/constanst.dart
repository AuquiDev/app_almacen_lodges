

import 'package:flutter/material.dart';


const String pathAlmacenAPi = '523c7b95f14e02d2a03b951150610edc/appAlmacen';

enum InputTypeEnum{
  text,
  dni,
  telefono,
}

Map<InputTypeEnum, TextInputType> inputTypeMapa = {
  InputTypeEnum.text : TextInputType.text,
  InputTypeEnum.dni : TextInputType.number,
  InputTypeEnum.telefono : TextInputType.number,
};



