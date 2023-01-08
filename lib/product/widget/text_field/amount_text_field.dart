import 'package:flutter/material.dart';
import 'package:recipe_finder/core/constant/design/color_constant.dart';
import 'package:recipe_finder/core/extension/context_extension.dart';
import 'package:recipe_finder/core/extension/string_extension.dart';

import '../../../core/init/language/locale_keys.g.dart';
import '../../model/ingradient_model.dart';

class AmountTextField extends StatefulWidget {
  final IngredientModel model;
  final TextEditingController controller;
  AmountTextField({Key? key, required this.model, required this.controller}) : super(key: key);

  @override
  State<AmountTextField> createState() => _AmountTextFieldState();
}

class _AmountTextFieldState extends State<AmountTextField> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.controller.text = '1';
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.screenWidth / 2,
      child: TextFormField(
        controller: widget.controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: LocaleKeys.amount.locale,
          border: buildOutlineInputBorder(context),
          focusedBorder: buildOutlineInputBorder(context),
          enabledBorder: buildOutlineInputBorder(context),
          disabledBorder: buildOutlineInputBorder(context),
          suffixIcon: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () {
                  if (widget.controller.text.isEmpty) {
                    widget.controller.text = '0';
                  } else if (double.parse(widget.controller.text) >= 1) {
                    widget.controller.text = (double.parse(widget.controller.text) - 1).toString();
                  }
                },
                icon: Icon(
                  Icons.remove_circle_outline,
                  color: Colors.black87,
                ),
              ),
              IconButton(
                onPressed: () {
                  if (widget.controller.text.isEmpty) {
                    widget.controller.text = 1.toString();
                  } else {
                    widget.controller.text = (double.parse(widget.controller.text) + 1).toString();
                  }
                },
                icon: Icon(
                  Icons.add_circle_outline,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
        validator: (tfInput) {
          if (tfInput!.isEmpty) {
            return LocaleKeys.dontEmptyThisField.locale;
          } else if (double.tryParse(tfInput)! < 0) {
            return LocaleKeys.dontEnterNegativeValue.locale;
          } else {
            return null;
          }
        },
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder(BuildContext context) {
    return OutlineInputBorder(
        borderRadius: context.radiusAllCircularMedium,
        borderSide: BorderSide(
          width: 1,
          color: ColorConstants.instance.oriolesOrange,
        ));
  }
}