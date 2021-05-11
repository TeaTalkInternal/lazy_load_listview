import 'package:flutter/material.dart';
import 'package:lazy_load_listview/lazy_load_listview.dart';
import 'package:lazy_load_listview/models/list_item.dart';

class ExampleWidget extends StatefulWidget {
  @override
  _ExampleWidgetState createState() => _ExampleWidgetState();
}

class _ExampleWidgetState extends State<ExampleWidget> {
  List<ListItem> _herosList = [
    ListItem(
      firstRowText: 'Sonu Sood',
      secondRowText: 'Actor',
      thirdRowText: 'Man with million hearts',
      forthRowText: 'Mumbai, Maharashtra, India',
      imagePath:
          'https://images.indianexpress.com/2021/05/sonu-sood-1200-1.jpg',
      isLocalImage: false,
    ),
    ListItem(
      firstRowText: 'Dr. Shankare Gowda',
      secondRowText: 'Doctor',
      thirdRowText: 'A skin specialist who treats patients for Rs 5',
      forthRowText: 'Mandya, Karnataka, India',
      imagePath:
          'https://new-img.patrika.com/upload/2018/04/24/five_rupees_doctor_2700143_835x547-m.jpg',
      isLocalImage: false,
    ),
    ListItem(
      firstRowText: 'Babar Ali',
      secondRowText: 'Youngest Headmaster',
      thirdRowText: 'Teacher for poor',
      forthRowText: 'Murshidabad, West Bengal, India',
      imagePath:
          'https://upload.wikimedia.org/wikipedia/commons/e/eb/Babar-Ali-Portfolio-Image.jpg',
      isLocalImage: false,
    ),
    ListItem(
      firstRowText: 'Anand Kumar',
      secondRowText: 'Mathematics Educator',
      thirdRowText: 'Coaches underprivileged students',
      forthRowText: 'Patna, Bihar, India',
      imagePath:
          'https://www.jagranjosh.com/imported/images/E/GK/anand-kumar.jpg',
      isLocalImage: false,
    ),
    ListItem(
      firstRowText: 'Shivakumara Swami',
      secondRowText: 'Humanitarian, spiritual leader & educator',
      thirdRowText: 'He founded a total of 132 institutions for education',
      forthRowText: 'Tumkur, Karnataka, India',
      imagePath:
          'https://www.filmibeat.com/img/popcorn/profile_photos/sri-shivakumara-swamy-20190121111407-7590.jpg',
      isLocalImage: false,
    ),
    ListItem(
      firstRowText: 'Kareem Bhai',
      secondRowText: 'Retired daily-wage laborer',
      thirdRowText: 'Distributes free newspaper for children',
      forthRowText: 'Abids, Hyderabad, India',
      imagePath:
          'https://www.theink24.com/wp-content/uploads/2018/06/paperboy_kareem-bhai.png',
      isLocalImage: false,
    ),
    ListItem(
      firstRowText: 'Salumarada Thimmakka',
      secondRowText: 'Environmentalist',
      thirdRowText: 'Planted more than 385 trees to help travellers',
      forthRowText: 'Gubbi Taluk, Tumkur, India',
      imagePath:
          'https://www.newskarnataka.com/storage/photos/shares/2018MAY/saalumarada_thimmakka.jpg',
      isLocalImage: false,
    ),
  ];

  bool _shouldEndLoadingPhotos = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 15.0,
        ),
        color: Colors.grey[100],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DiscoverAppBarWidget(),
            //To explore all the Customisation options to load the listview use the following commented code

            Expanded(
              child: LazyLoadListView(
                listItems: _herosList,
                listItemType: LazyLoadListViewItemType.largeImageListItemType,
                onListItemTap: _didTapList,
                onScrollDidReachEnd: _loadMorePhotos,
                shouldEndLoad: _shouldEndLoadingPhotos,
                fourthRowPrefixIcon: Icons.location_pin,
                loadingIndicatorColor: Colors.grey,
                endOfListText: 'No more results available',
              ),
            ),
            /*
            //To simply load list use the following commented code
            Expanded(
              child: LazyLoadListView(
                listItems: _herosList,
              ),
            ),
          */
            //To simply use your own custom list item list use the following commented code
            /*
            Expanded(
              child: LazyLoadListView(
                listItems: _herosList,
                listItemType: LazyLoadListViewItemType.customListItemType,
                customListItemWidgetBuilder: (_context, _index) {
                  final _hero = _herosList[_index];
                  return CustomListTile(hero: _hero);
                },
                onScrollDidReachEnd: _loadMorePhotos,
                shouldEndLoad: _shouldEndLoadingPhotos,
              ),
            ),
          */
          ],
        ),
      ),
    );
  }

//Callbacks
  void _didTapList(int _index) {
    print('Index $_index');
  }

  void _loadMorePhotos() {
    //You may values fetched from server and append to your datasource.
    //here we have added a future delay to mock a server call
    if (_herosList.length < 8) {
      Future.delayed(Duration(seconds: 1), () {
        setState(() {
          _herosList.addAll([
            ListItem(
              firstRowText: 'Omkarnath Sharma',
              secondRowText: 'Retired blood bank technician',
              thirdRowText:
                  'Has set free medicine bank for the underprivileged and poor',
              forthRowText: 'Delhi, India',
              imagePath:
                  'https://nkhayi.files.wordpress.com/2012/05/009-omkar-nath.jpg',
              isLocalImage: false,
            ),
            ListItem(
              firstRowText: 'Mamta Rawat',
              secondRowText: 'Part-time trainer for the NIM',
              thirdRowText:
                  'Saved thousands of lives in the Uttarakhand flood of 2013',
              forthRowText: 'Uttarakhand, Bankoli, India',
              imagePath: 'https://i.ytimg.com/vi/o9rkNiA-awI/maxresdefault.jpg',
              isLocalImage: false,
            ),
            ListItem(
              firstRowText: 'Dr APJ Abdul Kalam',
              secondRowText: 'Aerospace Scientist, Author',
              thirdRowText: 'An inspiration to many',
              forthRowText: 'Rameswaram, Tamil Nadu, India',
              imagePath:
                  'https://www.apjabdulkalamfoundation.org/images/about/abdulkalamprofile.jpg',
              isLocalImage: false,
            ),
          ]);
        });
      });
    } else {
      setState(() {
        _shouldEndLoadingPhotos = true;
      });
    }
  }
}

//Sub-Widgets
//Header
class DiscoverAppBarWidget extends StatelessWidget {
  const DiscoverAppBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 60.0,
        left: 5.0,
        bottom: 10.0,
      ),
      child: Text(
        'Real life Heros',
        style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 32.0,
            color: Colors.grey[850]),
      ),
    );
  }
}

//Custom List Item
class CustomListTile extends StatelessWidget {
  const CustomListTile({
    Key? key,
    required ListItem hero,
  })   : _hero = hero,
        super(key: key);

  final ListItem _hero;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(
              _hero.imagePath,
            ),
            radius: 40.0,
          ),
          contentPadding: EdgeInsets.all(0.0),
          title: Text(
            _hero.firstRowText,
            style: TextStyle(
              color: Colors.black,
              fontSize: 17.0,
              fontWeight: FontWeight.w900,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Text(
            _hero.secondRowText,
            style: TextStyle(
              color: Colors.grey[700],
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: 15.0,
            color: Colors.grey,
          ),
        ),
        Divider(
          indent: 75.0,
          color: Colors.grey,
        )
      ],
    );
  }
}
