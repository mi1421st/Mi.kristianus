part of "home_page.dart";

class HomeAppBar extends StatefulWidget with PreferredSizeWidget {
  HomeAppBar({Key? key}) : super(key: key);


  @override
  Size get preferredSize => const Size.fromHeight(150);

  @override
  HomeAppBarState createState() => HomeAppBarState();
}

class HomeAppBarState extends State<HomeAppBar> {

  final DatePickerController _controller = DatePickerController();


  DateTime weekdayOf(DateTime time, int weekday) => time.add(Duration(days: weekday - time.weekday));
  DateTime saturdayOf(DateTime time) => weekdayOf(time, 6);
  DateTime sundayOf(DateTime time) => weekdayOf(time, 7);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      toolbarHeight: 115,
      expandedHeight: 180.0,
      floating: true,
      pinned: true,
      flexibleSpace: LayoutBuilder(
        builder: (context, constraint) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Visibility(
                visible: constraint.biggest.height == 180,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                    // color: Colors.greenAccent,
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back),
                          onPressed: () {},
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: const [
                                Text(
                                  "Alamat Pengantaran",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: Colors.grey
                                )),
                                SizedBox(width: 5,),
                                Icon(Icons.keyboard_arrow_down)
                              ],
                            ),
                            const Text(
                              "Kulina",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 20
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )),
              Container(
                  // color: Colors.green,
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 5),
                  child: DatePicker(
                    DateTime.now(),
                    width: 60,
                    height: 80,
                    controller: _controller,
                    initialSelectedDate: DateTime.now(),
                    daysCount: 56,
                    selectionColor: Colors.orange,
                    selectedTextColor: Colors.white,
                    deactivatedColor: Colors.grey[400]!,
                    inactiveDates: [
                      saturdayOf(DateTime.now()),
                      sundayOf(DateTime.now()),
                      saturdayOf(DateTime.now().add(const Duration(days: 7))),
                      sundayOf(DateTime.now().add(const Duration(days: 7))),
                      saturdayOf(DateTime.now().add(const Duration(days: 14))),
                      sundayOf(DateTime.now().add(const Duration(days: 14))),
                      saturdayOf(DateTime.now().add(const Duration(days: 21))),
                      sundayOf(DateTime.now().add(const Duration(days: 21))),
                      saturdayOf(DateTime.now().add(const Duration(days: 28))),
                      sundayOf(DateTime.now().add(const Duration(days: 28))),
                      saturdayOf(DateTime.now().add(const Duration(days: 35))),
                      sundayOf(DateTime.now().add(const Duration(days: 35))),
                      saturdayOf(DateTime.now().add(const Duration(days: 42))),
                      sundayOf(DateTime.now().add(const Duration(days: 42))),
                      saturdayOf(DateTime.now().add(const Duration(days: 49))),
                      sundayOf(DateTime.now().add(const Duration(days: 49))),
                      saturdayOf(DateTime.now().add(const Duration(days: 56))),
                      sundayOf(DateTime.now().add(const Duration(days: 56))),
                    ],
                    dayTextStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    onDateChange: (date) {
                      // New date selected
                      setState(() {
                        context.read<HomeAppBarBloc>().selectedValue = date;
                        context.read<HomeAppBarBloc>().add(LoadDate());
                      });
                    },
                  )),
            ],
          );
        }
      ),
    );
  }

}