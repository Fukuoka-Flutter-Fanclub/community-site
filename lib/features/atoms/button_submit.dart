import 'package:flutter/material.dart';

enum ButtonKBN {
  primary,
  secondary,
  caution,
  warning,
}

class ButtonSubmit extends StatefulWidget {
  final String text;
  final FocusNode? submitFocusNode;
  final Function()? onPressed;
  final ButtonKBN buttonKBN;

  const ButtonSubmit(
    this.text, {
    Key? key,
    this.submitFocusNode,
    this.onPressed,
    this.buttonKBN = ButtonKBN.primary,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ButtonSubmitState();
}

class _ButtonSubmitState extends State<ButtonSubmit> {
  bool isProcessing = false;

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    Color textColor;
    Color borderColor;

    if (widget.onPressed == null) {
      backgroundColor = Colors.black45;
      textColor = Colors.white;
      borderColor = Colors.black45;
    } else {
      switch (widget.buttonKBN) {
        case ButtonKBN.primary:
          backgroundColor = Theme.of(context).primaryColor;
          textColor = Colors.white;
          borderColor = Theme.of(context).primaryColor;
          break;
        case ButtonKBN.secondary:
          backgroundColor = Colors.white;
          textColor = Theme.of(context).primaryColor;
          borderColor = Theme.of(context).primaryColor;
          break;
        case ButtonKBN.caution:
          backgroundColor = const Color(0xFFEC3A2F);
          textColor = Colors.white;
          borderColor = const Color(0xFFEC3A2F);
          break;
        case ButtonKBN.warning:
          backgroundColor = Colors.white;
          textColor = const Color(0xFFEC3A2F);
          borderColor = const Color(0xFFEC3A2F);
          break;
      }
    }

    return Container(
      // width: double.infinity,
      height: 42,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: borderColor,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(4)),
      ),
      child: ElevatedButton(
        onPressed: isProcessing
            ? null
            : () async {
                setState(() {
                  isProcessing = true;
                });

                try {
                  if (widget.onPressed != null) {
                    await widget.onPressed!();
                  }
                } catch (e) {
                } finally {
                  if (mounted) {
                    setState(() {
                      isProcessing = false;
                    });
                  }
                }
              },
        focusNode: widget.submitFocusNode,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(backgroundColor),
        ),
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Stack(
            alignment: Alignment.center,
            children: [
              IgnorePointer(
                child: Text(
                  widget.text,
                  style: TextStyle(
                    color:
                        isProcessing ? textColor.withOpacity(0.5) : textColor,
                  ),
                ),
              ),
              Visibility(
                visible: isProcessing,
                child: const SizedBox(
                  child: SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}