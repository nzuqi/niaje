import 'package:flutter/material.dart';

Widget socialButton({
  required String text,
  required String icon,
  VoidCallback? onPressed,
  bool processing = false,
  bool disabled = false,
}) {
  return OutlinedButton.icon(
    onPressed: !processing && !disabled ? onPressed : null,
    icon: Image.asset(
      icon,
      width: 15.0,
    ),
    label: Row(
      children: [
        Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Colors.grey,
          ),
        ),
        processing ? const SizedBox(width: 10) : const SizedBox(),
        processing
            ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2.0,
                  color: Colors.grey,
                ),
              )
            : const SizedBox()
      ],
    ),
  );
}

Widget plainButton({
  required String text,
  bool processing = false,
  bool disabled = false,
  VoidCallback? onPressed,
}) {
  return ElevatedButton(
    onPressed: (!processing && !disabled) ? onPressed : null,
    style: ButtonStyle(
      padding: WidgetStateProperty.all(
        const EdgeInsets.fromLTRB(20, 12, 20, 12),
      ),
      backgroundColor: WidgetStateProperty.all(
        (!processing && !disabled) ? Colors.cyan : Colors.cyan[200],
      ),
    ),
    child: IntrinsicWidth(
      child: Row(
        children: [
          Text(
            text,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          processing ? const SizedBox(width: 10) : const SizedBox(),
          processing
              ? const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.0,
                    color: Colors.white54,
                  ),
                )
              : const SizedBox()
        ],
      ),
    ),
  );
}

Widget outlineButton({
  required String text,
  bool processing = false,
  bool disabled = false,
  VoidCallback? onPressed,
}) {
  return OutlinedButton(
    onPressed: (!processing && !disabled) ? onPressed : null,
    // style: OutlinedButton.styleFrom(
    //   padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
    //   side: BorderSide(
    //     width: 2.0,
    //     color: (!processing && !disabled) ? Colors.cyan : Colors.cyan[200] as Color,
    //   ),
    // ),
    style: OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
        side: BorderSide(
          width: 2.0,
          color: (!processing && !disabled)
              ? Colors.red
              : Colors.red[200] as Color,
        ),
      ),
    ),
    child: IntrinsicWidth(
      child: Row(
        children: [
          Text(
            text,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              // color: (!processing && !disabled) ? Colors.cyan : Colors.cyan[200] as Color,
            ),
          ),
          processing ? const SizedBox(width: 10) : const SizedBox(),
          processing
              ? const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.0,
                    // color: Colors.cyan[200],
                  ),
                )
              : const SizedBox()
        ],
      ),
    ),
  );
}

Widget textButton({
  required String text,
  bool processing = false,
  bool disabled = false,
  VoidCallback? onPressed,
}) {
  return TextButton(
    onPressed: (!processing && !disabled) ? onPressed : null,
    style: ButtonStyle(
      padding: WidgetStateProperty.all(
        const EdgeInsets.fromLTRB(20, 12, 20, 12),
      ),
    ),
    child: IntrinsicWidth(
      child: Row(
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color:
                  (!processing && !disabled) ? Colors.cyan : Colors.cyan[200],
            ),
          ),
          processing ? const SizedBox(width: 10) : const SizedBox(),
          processing
              ? SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.0,
                    color: (!processing && !disabled)
                        ? Colors.cyan
                        : Colors.cyan[200],
                  ),
                )
              : const SizedBox()
        ],
      ),
    ),
  );
}
