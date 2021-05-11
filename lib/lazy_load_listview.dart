library lazy_load_listview;

import 'package:flutter/material.dart';
import 'package:lazy_load_listview/custom_widgets/large_image_list_Item_widget.dart';
import 'package:lazy_load_listview/custom_widgets/regular_list_Item_widget.dart';
import 'package:lazy_load_listview/models/list_item.dart';

//Types of ListItem
enum LazyLoadListViewItemType {
  largeImageListItemType,
  regularImageListItemType,
  customListItemType
}

class LazyLoadListView extends StatefulWidget {
  final List<ListItem> listItems;
  final Function? onListItemTap;
  final IndexedWidgetBuilder? customListItemWidgetBuilder;
  final LazyLoadListViewItemType listItemType;
  final Function? onScrollDidReachEnd;
  final bool shouldEndLoad;
  final IconData? fourthRowPrefixIcon;
  final String endOfListText;
  final Color loadingIndicatorColor;

  LazyLoadListView({
    required this.listItems,
    this.onListItemTap,
    this.onScrollDidReachEnd,
    this.listItemType = LazyLoadListViewItemType.regularImageListItemType,
    this.shouldEndLoad = false,
    this.fourthRowPrefixIcon,
    this.endOfListText = 'No more results available',
    this.loadingIndicatorColor = Colors.grey,
    this.customListItemWidgetBuilder,
  });

  @override
  _LazyLoadListViewState createState() => _LazyLoadListViewState();
}

class _LazyLoadListViewState extends State<LazyLoadListView> {
  ScrollController _scrollController = ScrollController();
  bool _scrollDidReachEnd = false;
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        //Detect scroll position here
        setState(() {
          _scrollDidReachEnd = true;
        });
        if (widget.onScrollDidReachEnd != null) {
          widget.onScrollDidReachEnd!();
          return;
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      padding: EdgeInsets.only(
        top: 5.0,
        bottom: 30.0,
      ),
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return _buildListTileItem(context, index);
      },
      itemCount: _getWidgetsCount(),
    );
  }

  int _getWidgetsCount() {
    if (widget.listItems.length == 0) {
      return 0;
    } else if (widget.onScrollDidReachEnd == null ||
        (widget.onScrollDidReachEnd != null && _scrollDidReachEnd == false)) {
      return widget.listItems.length;
    } else if (widget.shouldEndLoad == true) {
      return widget.listItems.length + 1;
    }
    return widget.listItems.length + 1;
  }

  Widget _buildListTileItem(BuildContext context, int index) {
    if (index == widget.listItems.length && widget.shouldEndLoad == true) {
      return Center(
          child: Padding(
        padding: const EdgeInsets.only(
          top: 15.0,
          bottom: 10.0,
        ),
        child: Text(
          widget.endOfListText,
          style: TextStyle(color: Colors.grey, fontSize: 15.9),
        ),
      ));
    } else if (index == widget.listItems.length &&
        widget.shouldEndLoad == false) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: CircularProgressIndicator(
            valueColor: new AlwaysStoppedAnimation<Color>(
              widget.loadingIndicatorColor,
            ),
          ),
        ),
      );
    } else {
      // return (widget.listItemType ==
      //         LazyLoadListViewItemType.largeImageListItemType)
      //     ? _buildLargeImageListViewWidget(context, index)
      //     : _buildRegularListViewWidget(context, index);
      if (widget.listItemType ==
          LazyLoadListViewItemType.largeImageListItemType) {
        return _buildLargeImageListViewWidget(context, index);
      } else if (widget.listItemType ==
              LazyLoadListViewItemType.customListItemType &&
          widget.customListItemWidgetBuilder != null) {
        return widget.customListItemWidgetBuilder!(context, index);
      }
      return _buildRegularListViewWidget(context, index);
    }
  }

  //Two variations of List Items.
  //Large Image ListItem
  Widget _buildLargeImageListViewWidget(BuildContext context, int index) {
    final ListItem _listItem = widget.listItems[index];
    return LargeImageListItemWidget(
      onListItemTap: widget.onListItemTap,
      listItem: _listItem,
      listItemIndex: index,
      fourthRowPrefixIcon: widget.fourthRowPrefixIcon,
      loadingIndicatorColor: widget.loadingIndicatorColor,
    );
  }

  //Regular Image ListItem
  Widget _buildRegularListViewWidget(BuildContext context, int index) {
    final ListItem _listItem = widget.listItems[index];
    return RegularListItemWidget(
      onListItemTap: widget.onListItemTap,
      listItem: _listItem,
      listItemIndex: index,
      fourthRowPrefixIcon: widget.fourthRowPrefixIcon,
      loadingIndicatorColor: widget.loadingIndicatorColor,
    );
  }
}
