import 'package:flutter/material.dart';
import 'package:learninglion/constants/constants.dart';
import 'package:learninglion/widgets/text_widget.dart';

class ChartWidget extends StatelessWidget {
  const ChartWidget({Key? key, required this.msg, required this.chatIndex})
      : super(key: key);

  final String msg;
  final int chatIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: chatIndex == 0 ? scaffoldBackgroundColor : cardColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  chatIndex == 0
                      ? Icons.man_outlined
                      : Icons.data_thresholding_outlined,
                  color: Colors.white,
                ),
                const SizedBox(
                  width: 15,
                ),
                 Expanded(
                   child: TextWidget(
                    label: msg,
                ),
                 ),
                chatIndex  == 0 ? const SizedBox.shrink() : Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(
                      Icons.thumb_up_alt_outlined,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.thumb_down_alt_outlined,
                      color: Colors.white,
                    )
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
