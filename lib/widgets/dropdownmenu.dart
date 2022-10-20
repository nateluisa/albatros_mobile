import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';


class MyDropDownMenu extends StatefulWidget {
  const MyDropDownMenu({Key? key, this.alignment, required this.dropdownItems}) : super(key: key);
  final AlignmentGeometry? alignment;
  final List<String> dropdownItems;

  @override
  State<MyDropDownMenu> createState() => _MyDropDownMenuState();
}

class _MyDropDownMenuState extends State<MyDropDownMenu> {

  String? selectedValue;


  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: widget.alignment,
      child: DropdownButtonHideUnderline(
        child: DropdownButton2(
          isExpanded: true,
          hint: Row(
            children: const [
              // Icon(
              //   Icons.list,
              //   size: 16,
              //   color: Colors.black,
              // ),
              SizedBox(
                width: 4,
              ),
              Expanded(
                child: Text(
                  '',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          items: widget.dropdownItems
              .map((item) => DropdownMenuItem<String>(
            value: item,
            child: Text(
              item,
              style: const TextStyle(
                fontSize: 14,
                //fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              overflow: TextOverflow.visible,
            ),
          ))
              .toList(),
          value: selectedValue,
          onChanged: (value) {
            setState(() {
              selectedValue = value as String;
            });
          },
          icon: const Icon(
            Icons.arrow_forward_ios_outlined,
          ),
          iconSize: 14,
          iconEnabledColor: Colors.black,
          iconDisabledColor: Colors.white,
          buttonHeight: 50,
          buttonWidth: 300,
          buttonPadding: const EdgeInsets.only(left: 14, right: 14),
          buttonDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            border: Border.all(
              color: Colors.black26,
            ),
            color: Colors.white,
          ),
          buttonElevation: 0,
          itemHeight: 40,
          itemPadding: const EdgeInsets.only(left: 14, right: 14),
          dropdownMaxHeight: 200,
          dropdownWidth: 320,
          dropdownPadding: null,
          dropdownDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
          ),
          dropdownElevation: 2,
          scrollbarRadius: const Radius.circular(8),
          scrollbarThickness: 6,
          scrollbarAlwaysShow: true,
          offset: const Offset(-20, 0),
        ),
      ),
    );
  }
}
/// valores de referencia direto da api
// class MyCustomDrop extends StatelessWidget {
//   final Widget hint;
//   final String? value;
//   final List<String> dropdownItems;
//   final ValueChanged<String?>? onChanged;
//   final DropdownButtonBuilder? selectedItemBuilder;
//   final Alignment? hintAlignment;
//   final Alignment? valueAlignment;
//   final double? buttonHeight, buttonWidth;
//   final EdgeInsetsGeometry? buttonPadding;
//   final BoxDecoration? buttonDecoration;
//   final int? buttonElevation;
//   final Widget? icon;
//   final double? iconSize;
//   final Color? iconEnabledColor;
//   final Color? iconDisabledColor;
//   final double? itemHeight;
//   final EdgeInsetsGeometry? itemPadding;
//   final double? dropdownHeight, dropdownWidth;
//   final EdgeInsetsGeometry? dropdownPadding;
//   final BoxDecoration? dropdownDecoration;
//   final int? dropdownElevation;
//   final Radius? scrollbarRadius;
//   final double? scrollbarThickness;
//   final bool? scrollbarAlwaysShow;
//   final Offset? offset;
//
//   const MyCustomDrop({
//     required this.hint,
//     this.value,
//     required this.dropdownItems,
//     required this.onChanged,
//     this.selectedItemBuilder,
//     this.hintAlignment,
//     this.valueAlignment,
//     this.buttonHeight,
//     this.buttonWidth,
//     this.buttonPadding,
//     this.buttonDecoration,
//     this.buttonElevation,
//     this.icon,
//     this.iconSize,
//     this.iconEnabledColor,
//     this.iconDisabledColor,
//     this.itemHeight,
//     this.itemPadding,
//     this.dropdownHeight,
//     this.dropdownWidth,
//     this.dropdownPadding,
//     this.dropdownDecoration,
//     this.dropdownElevation,
//     this.scrollbarRadius,
//     this.scrollbarThickness,
//     this.scrollbarAlwaysShow,
//     this.offset,
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return DropdownButtonHideUnderline(
//       child: DropdownButton2(
//         //To avoid long text overflowing.
//         isExpanded: true,
//         hint: hint,
//         value: value,
//         items: dropdownItems
//             .map((item) => DropdownMenuItem<String>(
//           value: item,
//           child: Container(
//             alignment: valueAlignment,
//             child: Text(
//               item,
//               overflow: TextOverflow.ellipsis,
//               maxLines: 1,
//               style: const TextStyle(
//                 fontSize: 14,
//               ),
//             ),
//           ),
//         ))
//             .toList(),
//         onChanged: onChanged,
//         selectedItemBuilder: selectedItemBuilder,
//         icon: icon ?? const Icon(Icons.arrow_forward_ios_outlined),
//         iconSize: iconSize ?? 12,
//         iconEnabledColor: iconEnabledColor,
//         iconDisabledColor: iconDisabledColor,
//         buttonHeight: buttonHeight ?? 40,
//         buttonWidth: buttonWidth ?? 140,
//         buttonPadding:
//         buttonPadding ?? const EdgeInsets.only(left: 14, right: 14),
//         buttonDecoration: buttonDecoration ??
//             BoxDecoration(
//               borderRadius: BorderRadius.circular(8),
//               border: Border.all(
//                 color: Colors.black45,
//               ),
//             ),
//         buttonElevation: buttonElevation,
//         itemHeight: itemHeight ?? 40,
//         itemPadding: itemPadding ?? const EdgeInsets.only(left: 14, right: 14),
//         //Max height for the dropdown menu & becoming scrollable if there are more items. If you pass Null it will take max height possible for the items.
//         dropdownMaxHeight: dropdownHeight ?? 200,
//         dropdownWidth: dropdownWidth ?? 140,
//         dropdownPadding: dropdownPadding,
//         dropdownDecoration: dropdownDecoration ??
//             BoxDecoration(
//               borderRadius: BorderRadius.circular(8),
//             ),
//         dropdownElevation: dropdownElevation ?? 8,
//         scrollbarRadius: scrollbarRadius ?? const Radius.circular(40),
//         scrollbarThickness: scrollbarThickness,
//         scrollbarAlwaysShow: scrollbarAlwaysShow,
//         //Null or Offset(0, 0) will open just under the button. You can edit as you want.
//         offset: offset,
//         dropdownOverButton: false, //Default is false to show menu below button
//       ),
//     );
//   }
// }