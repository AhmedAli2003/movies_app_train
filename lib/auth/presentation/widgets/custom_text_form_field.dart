import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final bool obscureText;
  final TextInputType? keyboardType;
  final IconData icon;
  final String hintText;
  final void Function(String value) onChanged;
  const CustomTextFormField({
    super.key,
    required this.icon,
    required this.hintText,
    this.obscureText = false,
    required this.onChanged,
    this.keyboardType,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.width / 8,
      width: size.width / 1.22,
      alignment: Alignment.center,
      padding: EdgeInsets.only(right: size.width / 30),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(.05),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        style: TextStyle(color: Colors.black.withOpacity(.8)),
        obscureText: !widget.obscureText ? false : !isVisible,
        keyboardType: widget.keyboardType,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          prefixIcon: Icon(
            widget.icon,
            color: Colors.black.withOpacity(.7),
          ),
          border: InputBorder.none,
          hintMaxLines: 1,
          hintText: widget.hintText,
          hintStyle: TextStyle(fontSize: 14, color: Colors.black.withOpacity(.5)),
          suffixIcon: widget.obscureText
              ? IconButton(
                  onPressed: () => setState(() => isVisible = !isVisible),
                  icon: isVisible ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off),
                )
              : null,
        ),
      ),
    );
  }
}
