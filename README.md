# lazy_load_listview

- [lazy_load_listview](#lazy_load_listview)
- [How to use it.](#how-to-use-it)
- [parameters](#parameters)

Language: [English](README.md)

A simple flutter package for displaying list of items in listview with option to lazy fetch items.

LazyLoadListView provides with 2 different types of options to display Listview rows.
LazyLoadListView provides the liberty to the developers to pass their own custom builder to build custom row. The package provides option to lazy fetch data too.

# Technical Notes:
The layout for pages is built using Listview.builder .
Dev have options show either inbuilt package provided ListTile (Rows) or provide their own designed widgets. 



![](https://github.com/TeaTalkInternal/github_assets/blob/master/gifs/lazy_load_listview_1.gif)![](https://github.com/TeaTalkInternal/github_assets/blob/master/gifs/lazy_load_listview_2.gif)![](https://github.com/TeaTalkInternal/github_assets/blob/master/images/lazy_load_listview.png)


#  How to use it.

The usage is very simple, just use the following code for default rendering of Listview. By default regularImageListItemType row is displayed.

To just go with default implementaion of LazyLoadListView, Use the following code. Here the row will be of type regularImageListItemType.

```dart
 LazyLoadListView(
    listItems: _herosList,
 ),
```
or use the following code to explore power of LazyLoadListView
```dart
 LazyLoadListView(
    listItems: _herosList,
    listItemType: LazyLoadListViewItemType.largeImageListItemType,
    onListItemTap: _didTapList,
    onScrollDidReachEnd: _loadMorePhotos,
    shouldEndLoad: _shouldEndLoadingPhotos,
    fourthRowPrefixIcon: Icons.location_pin,
    loadingIndicatorColor: Colors.grey,
    endOfListText: 'No more results available',
 ),
```
or use the following with to provide your own custom row / ListTile widget

```dart
 LazyLoadListView(
   listItems: _herosList,
   listItemType: LazyLoadListViewItemType.customListItemType,
   customListItemWidgetBuilder: (_context, _index) {
     final _hero = _herosList[_index];
     return CustomListTile(hero: _hero);
   },
   onScrollDidReachEnd: _loadMorePhotos,
   shouldEndLoad: _shouldEndLoadingPhotos,
 ),
```
Here CustomListTile is simple widget created in example code, You may create any and pass it here.

#parameters
## Parameters for lazy_load_listview

| parameter                  | description                                                                           | value                                                                                                                                                                               |
| -------------------------- | ------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| listItems                        | Array of items data to be rendered as rows in Listview, Use ListItem object to group item details                                                                  |     \[ListItem]()                                                                                                                                                                              |
| shouldEndLoad          | set the value to true to stop lazy loading of data, Like once you reach end of data from your server or so                                           | This is a optional parameter. value can be true/false                                                                                                                                                    |                                                    |
| listItemType          | Type of List row to be generated                                            | This is a optional parameter. Pass the type of ListItem to be genrated. Value can be either largeImageListItemType, regularImageListItemType or customListItemType.                                                                                                                                                    |
| onScrollDidReachEnd          | handler called when list is scrolled to bottom.                                            | This is a optional parameter. Pass a method where you can handle your logic for lazy loading.                                                                                                                                                    |
| fourthRowPrefixIcon          | The fourth row has a optional prefix icon for text. This can be used to represent phone number, location, email etc.                                            | This is a optional parameter. Pass IconData type value.                                                                                                                                                                                                                                  |
| loadingIndicatorColor          | Color for CircularProgressIndicator for image load or list data load                                            | This is a optional parameter. Pass Color type value. Default value is Colors.grey                                                                                                                                                                                                                                                    |
| endOfListText          | Text or String to be shown once fetch reaches its max limit. No more data available after this point                                            | This is a optional parameter. Default value is "No more results available"                                                                                                                                                                |
| onListItemTap          | ListItem or row click handler                                            | This is a optional parameter.  Pass method to be called on click. Index parameter is returned on click                                                                                  |
| customListItemWidgetBuilder          | Custom IndexedWidgetBuilder (Widget Function(BuildContext context, int index)) . Pass your own custom widget, like ListTile, Card or any.                                           | This is a optional parameter.                                                                                                  |

## Attributes/Properties of ListItem

| parameter                  | description                                                                           | default                                                                                                                                                                               |
| -------------------------- | ------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| firstRowText          | String to be displayed in first row Text widget                                          | empty string                                                                                                                                                    |
| secondRowText          | String to be displayed in second row Text widget                                            | empty string                                                                                                                                                    |
| thirdRowText          | String to be displayed in third row Text widget                                            | empty string                                                                                                                                                    |
| forthRowText          | String to be displayed in fourth row Text widget                                            | empty string                                                                                                                                                    |
| imagePath          | Image path of image, either local assets folder image or http image path                                            | empty string                                                                                                                                                    |
| isLocalImage          | Value is true if imagePath is local assets folder image, Value is true if imagePath is http image path                                             | true                                                                                                                                                    |

The usage is well described in the example code.

[git repo here](https://github.com/TeaTalkInternal/lazy_load_listview)

Made with ❤ and dedicated with respect to the Saviour  [Sonu Sood](https://twitter.com/SonuSood)
