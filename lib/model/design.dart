
import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';


class Design {
  BuildContext context;
  ThemeData theme;


  static final GlobalKey<FormState> _profileUpdateFormKey =
      GlobalKey<FormState>();
  Design(this.context) {
    theme = Theme.of(context);
  }

  double getwidth({val}) {
    if (val == null) return MediaQuery.of(context).size.width;
    return ((val / 100) * MediaQuery.of(context).size.width);
  }

  double getheigth({val}) {
    if (val == null) return MediaQuery.of(context).size.height;
    return ((val / 100) * MediaQuery.of(context).size.height);
  }

 



  dynamic getValue(val, {isNull: '', isNotNul}) {
    if (val == null) return isNull;
    if (isNotNul == null)
      return val;
    else
      return isNotNul;
  }

//#region textStyle
  TextStyle mTitleStyle({color: null}) {
    if (color == null) color = theme.primaryColor;
    return TextStyle(
      color: color,
      fontSize: 30,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle mSubTitleStyle({color: null}) {
    if (color == null) color = theme.primaryColor;
    return TextStyle(
      color: color,
      fontSize: 20,
      fontWeight: FontWeight.normal,
    );
  }

  TextStyle mSemiNormalStyle({color: null}) {
    if (color == null) color = theme.primaryColor;
    return TextStyle(
      color: color,
      fontSize: 10,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle mNormalStyle({color: null}) {
    if (color == null) color = theme.primaryColor;
    return TextStyle(
      color: color,
      fontSize: 30,
      fontWeight: FontWeight.bold,
    );
  }

  //#endregion

//#region textBox

  TextFormField mTextFormField(context,
      {@required onSaved,
      @required validator,
      @required hintText,
      @required labelText,
      textCapitalization: TextCapitalization.words,
      autovalidate: false,
      autocorrect: true,
      textInputAction: TextInputAction.done,
      obscureText: false,
      key,
      maxLines: 1,
      prefix,
      errorColor: Colors.red,
      keyboardType: TextInputType.text,
      errorText: 'Can\'t be left empty',
      suffix,
      helperText: "",
      prefixIcon,
      controller}) {
    return TextFormField(
      controller: controller,
      autofocus: false,
      style: TextStyle(color: Theme.of(context).primaryColor),
      decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText,
          prefix: prefix,
          suffix: suffix,
          helperText: helperText,
          prefixIcon: prefixIcon,
          errorText: errorText,
          hintStyle: TextStyle(color: Theme.of(context).primaryColor),
          suffixStyle: TextStyle(color: Theme.of(context).primaryColor),
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
          ),
          helperStyle: TextStyle(color: Theme.of(context).primaryColor),
          labelStyle: TextStyle(color: Theme.of(context).primaryColor),
          prefixStyle: TextStyle(color: Theme.of(context).primaryColor),
          fillColor: Theme.of(context).primaryColor,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
          ),
          counterStyle: TextStyle(color: Theme.of(context).primaryColor),
          errorStyle: TextStyle(color: errorColor),
          hasFloatingPlaceholder: true),
      textCapitalization: textCapitalization,
      autovalidate: autovalidate,
      validator: validator,
      onSaved: onSaved,
      autocorrect: true,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      obscureText: obscureText,
      key: key,
      maxLines: maxLines,
    );
  }


  
}