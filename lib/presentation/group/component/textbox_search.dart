import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kovio_coffee/application/group/group_bloc.dart';
import 'package:kovio_coffee/presentation/core/widget_color.dart';
import 'package:kovio_coffee/presentation/core/widget_size.dart';
import 'package:kovio_coffee/presentation/core/widget_string.dart';
import 'package:kovio_coffee/presentation/core/widget_style.dart';

class TextboxSearch extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  TextboxSearch({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GroupBloc, GroupState>(
      builder: (context, state) => TextField(
        controller: _controller,
        style: yTextNormal,
        maxLines: 1,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.search,
        onChanged: (value) {
          context.read<GroupBloc>().add(GroupEvent.searchChanged(value));
        },
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: sTextNormal),
          hintText: textHintSearchGroup,
          hintStyle: yTextHint,
          filled: true,
          fillColor: kPrimaryColor,
          focusedBorder: yBorderSearch,
          enabledBorder: yBorderSearch,
          errorBorder: yBorderSearch,
          border: yBorderSearch,
          prefixIcon: Icon(
            Icons.search,
            size: sIconTextbox,
            color: kTextSecondColor,
          ),
          suffixIcon: (_controller.text.length > 0)
              ? ElevatedButton(
                  onPressed: () {
                    _controller.clear();
                    context.read<GroupBloc>().add(GroupEvent.searchChanged(""));
                  },
                  style: yButtonCircleIcon,
                  child: Icon(
                    Icons.close,
                    size: sIconTextbox,
                    color: kTextSecondColor,
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
