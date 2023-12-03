import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class FormFieldInput extends StatefulWidget {
  final FocusNode? focusNode;
  final TextEditingController controller;
  final Function(String) validator;
  final Function(String)? onFieldSubmitted;
  final Function? removeFocusAction;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final String? labelText;
  final bool? autofocus;

  final bool? isEnabled;
  final Function(String)? onChanged;

  const FormFieldInput({
    super.key,
    this.focusNode,
    required this.controller,
    required this.validator,
    this.textInputType = TextInputType.text,
    this.onFieldSubmitted,
    this.removeFocusAction,
    this.textInputAction,
    this.labelText,
    this.autofocus = false,
    this.isEnabled = true,
    this.onChanged,
  });

  @override
  State<FormFieldInput> createState() => _FormFieldInputState();
}

class _FormFieldInputState extends State<FormFieldInput> {
  var obscureText = false;
  var isFocus = false;

  @override
  void initState() {
    super.initState();

    obscureText = widget.textInputType == TextInputType.visiblePassword;

    // widget.focusNode.addListener(() => focusChange());
  }

  void focusChange() {
    if (mounted) {
      setState(() {
        // isFocus = widget.focusNode.hasFocus;
      });

      if (widget.removeFocusAction != null && isFocus == false) {
        widget.removeFocusAction!();
      }
    }
  }

  _datePicker(BuildContext context) async {
    final DateTime? datePicked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (datePicked != null) {
      DateFormat outputFormat = DateFormat('yyyy年MM月dd日');
      String date = outputFormat.format(datePicked);
      setState(() {
        widget.controller.text = date;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    List<String> autofillHints = [];
    Widget? suffix;
    List<TextInputFormatter> formatters = [];
    // TextTextInputType? textTextInputType;

    Widget passwordSuffix() {
      return IconButton(
        icon: Icon(
          obscureText ? Icons.visibility_off : Icons.visibility,
          color: obscureText ? Colors.black54 : Theme.of(context).primaryColor,
        ),
        onPressed: () {
          setState(() => obscureText = !obscureText);
        },
      );
    }

    Widget dateSuffix() {
      return IconButton(
        icon: const Icon(Icons.calendar_today_outlined),
        color: Colors.black54,
        onPressed: () => _datePicker(context),
      );
    }

    // textInputTypeによるValidatorチェック
    if (widget.textInputType == TextInputType.emailAddress) {
      // formatters
      //     .add(FilteringTextInputFormatter.deny(RegExp(r'[\uFF01-\uFF5E]')));

      autofillHints.add(AutofillHints.email);
    } else if (widget.textInputType == TextInputType.phone) {
      formatters.add(FilteringTextInputFormatter.digitsOnly);
    } else if (widget.textInputType == TextInputType.visiblePassword) {
      autofillHints.add(AutofillHints.password);
      suffix = passwordSuffix();
    } else if (widget.textInputType == TextInputType.datetime) {
      suffix = dateSuffix();
      // formatters.add(FilteringTextInputFormatter.);
    } else if (widget.textInputType == TextInputType.number) {
      formatters.add(FilteringTextInputFormatter.digitsOnly);
    }

    return TextFormField(
      onChanged: (value) =>
          widget.onChanged != null ? widget.onChanged!(value) : null,
      inputFormatters: formatters,
      textAlign: widget.textInputType == TextInputType.number
          ? TextAlign.right
          : TextAlign.left,
      enabled: widget.isEnabled,
      controller: widget.controller,
      maxLines: widget.textInputType == TextInputType.multiline ? 3 : 1,
      autofillHints: autofillHints,
      textInputAction: widget.textInputAction,
      keyboardType: widget.textInputType,
      focusNode: widget.focusNode,
      obscureText: obscureText,
      autofocus: widget.autofocus!,
      cursorColor: Theme.of(context).primaryColor,
      decoration: formFieldDecoration(
        labelText: widget.labelText,
        hasFocus: isFocus,
        suffix: suffix,
      ),
      validator: (value) => widget.validator(value!),
      onFieldSubmitted: widget.onFieldSubmitted,
    );
  }

  InputDecoration formSelectDecoration({
    String? labelText,
  }) {
    return InputDecoration(
      labelText: labelText,
      labelStyle: const TextStyle(
        color: Colors.black54,
      ),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide.none,
      ),
      border: const OutlineInputBorder(borderSide: BorderSide.none),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide.none,
      ),
    );
  }

  InputDecoration formFieldDecoration({
    String? labelText,
    bool hasFocus = false,
    Widget? suffix,
  }) {
    return InputDecoration(
      labelText: labelText,
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black26),
      ),
      border: const OutlineInputBorder(),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Color(0xFFF067A6),
          width: 2,
        ),
      ),
      suffixIcon: suffix,
    );
  }
}
