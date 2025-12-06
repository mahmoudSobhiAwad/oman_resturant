import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/utils/theme/app_colors.dart';
import '../../core/utils/theme/custom_app_font_styles.dart';
import '../../shared/widgets/custom_text_field.dart';

class CustomSelectorField<T> extends StatefulWidget {
  const CustomSelectorField({
    super.key,
    this.changeValue,
    required this.controller,
    required this.list,
    required this.itemAsString,
    this.header,
    this.hintText,
    this.itemValidator,
    this.fillDisableColor,
    this.isLoadingMore = false,
    this.scrollController,
    this.onTap,
  });

  final TextEditingController controller;
  final Color? fillDisableColor;
  final bool isLoadingMore;
  final ScrollController? scrollController;
  final void Function()? onTap;

  /// Callback when an item is selected
  final void Function(T)? changeValue;
  final String? Function(String?)? itemValidator;

  /// Items to show in the menu
  final List<T> list;

  /// How to display the item as text
  final String Function(T) itemAsString;

  final String? header;
  final String? hintText;

  @override
  State<CustomSelectorField<T>> createState() => CustomSelectorFieldState<T>();
}

class CustomSelectorFieldState<T> extends State<CustomSelectorField<T>>
    with SingleTickerProviderStateMixin {
  bool isOpen = false;
  late final AnimationController _controller;
  late final Animation<double> _iconTurns;
  int _previousListLength = 0;
  BuildContext? _menuContext;

  // ** دالة عامة لفتح مربع الحوار (Popup Menu) **
  void openSelector() {
    _showPopupMenu(context);
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _iconTurns = Tween<double>(
      begin: 0,
      end: 0.5,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    _previousListLength = widget.list.length;
  }

  @override
  void didUpdateWidget(CustomSelectorField<T> oldWidget) {
    super.didUpdateWidget(oldWidget);

    // لو الـ menu مفتوح والـ list اتغير، اقفله وافتحه تاني
    if (isOpen && widget.list.length != _previousListLength) {
      _previousListLength = widget.list.length;

      // اقفل الـ menu الحالي
      if (_menuContext != null && _menuContext!.mounted) {
        Navigator.of(_menuContext!).pop();

        Future.delayed(const Duration(milliseconds: 150), () {
          if (mounted) {
            _showPopupMenu(context);
          }
        });
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _showPopupMenu(BuildContext context) async {
    setState(() {
      isOpen = true;
      _controller.forward();
    });

    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final Offset position = renderBox.localToGlobal(const Offset(0, 5));

    final selected = await showMenu<T>(
      color: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      constraints: BoxConstraints(
        maxHeight: MediaQuery.sizeOf(context).height * 0.4,
        maxWidth: 300,
      ),
      menuPadding: const EdgeInsets.all(0),
      context: context,
      position: RelativeRect.fromLTRB(
        position.dx,
        position.dy + renderBox.size.height,
        position.dx + renderBox.size.width,
        position.dy + renderBox.size.height + 100,
      ),
      items: [
        widget.isLoadingMore
            ? PopupMenuItem(
                key: Key(
                  'custom_selector_field_menu_item${widget.isLoadingMore}',
                ),
                enabled: false,
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Center(child: CupertinoActivityIndicator()),
                ),
              )
            : PopupMenuItem<T>(
                enabled: false,
                key: Key(
                  'custom_selector_field_menu_item${widget.isLoadingMore}',
                ),
                padding: EdgeInsets.zero,
                child: Builder(
                  builder: (menuContext) {
                    _menuContext = menuContext;
                    return SizedBox(
                      width: renderBox.size.width,
                      height: (widget.list.length * 48.0).clamp(
                        0,
                        MediaQuery.sizeOf(context).height * 0.4,
                      ),
                      child: ListView.separated(
                        controller: widget.scrollController,
                        itemCount: widget.list.length,
                        separatorBuilder: (context, index) =>
                            const Divider(height: 1),
                        itemBuilder: (context, index) {
                          final item = widget.list[index];
                          return InkWell(
                            onTap: () {
                              context.pop(item);
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 12,
                              ),
                              child: Text(
                                widget.itemAsString(item),
                                style: CustomAppFontStyle.regular16.copyWith(
                                  color: AppColors.black,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
      ],
    );

    setState(() {
      isOpen = false;
      _controller.reverse();
      _menuContext = null;
    });

    if (selected != null) {
      widget.controller.text = widget.itemAsString(selected);
      widget.changeValue?.call(selected);
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      onTap: () {
        widget.onTap?.call();
        if (widget.list.isNotEmpty) {
          // يتم فك التركيز قبل الفتح لضمان عمل showMenu بشكل صحيح
          if (FocusScope.of(context).hasFocus) {
            FocusScope.of(context).unfocus();
            Future.delayed(const Duration(milliseconds: 200), () {
              if (context.mounted) openSelector();
            });
          } else {
            openSelector();
          }
        }
      },
      fillDisableColor: widget.fillDisableColor,
      controller: widget.controller,
      headerText: widget.header,
      hintText: widget.hintText,
      validator: widget.itemValidator,
      isReadOnly: true,
      disabledBorder: InputBorder.none,
      focusFillColor: widget.fillDisableColor,
      suffixWidget: AnimatedBuilder(
        animation: _iconTurns,
        builder: (context, child) {
          return Transform.rotate(
            angle: _iconTurns.value * 3.1416 * 2,
            child: Icon(
              Icons.keyboard_arrow_down_outlined,
              color: AppColors.gray27,
            ),
          );
        },
      ),
    );
  }
}
