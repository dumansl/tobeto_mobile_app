import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_mobile_app/screens/dashboard_screen/widgets/fixed_appbar.dart';
import 'package:tobeto_mobile_app/services/education_service.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';
import '/blocs/course_bloc/course_bloc.dart';
import '/model/course_model.dart';
import 'education_widgets/course_card.dart';

class EducationScreen extends StatefulWidget {
  const EducationScreen({super.key});

  @override
  State<EducationScreen> createState() => _EducationScreenState();
}

class _EducationScreenState extends State<EducationScreen> with SingleTickerProviderStateMixin {
  final TextEditingController _searchController = TextEditingController();
  List<Course> _filteredCourses = [];
  TabController? _tabController;
  final FocusNode _focusNode = FocusNode();
  bool _userEligible = false;
  bool _loading = true;
  String? _userId;
  String _sortOrder = 'A-Z';
  String? _selectedProducer;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_filterCourses);
    _tabController = TabController(length: 3, vsync: this);
    _focusNode.addListener(() {
      setState(() {});
    });
    _getUserIdAndCheckStatus();
  }

  @override
  void dispose() {
    _searchController.removeListener(_filterCourses);
    _searchController.dispose();
    _tabController?.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _filterCourses() {
    final query = _searchController.text.toLowerCase();
    final courses = (context.read<CourseBloc>().state as CoursesLoaded).courses;
    List<Course> filteredList = courses.where((course) {
      return course.title.toLowerCase().contains(query);
    }).toList();

    if (_selectedProducer != null) {
      filteredList = filteredList.where((course) {
        return course.producer.toLowerCase() == _selectedProducer!.toLowerCase();
      }).toList();
    }

    setState(() {
      _filteredCourses = filteredList;
      _sortCourses();
    });
  }

  void _sortCourses() {
    setState(() {
      if (_sortOrder == 'A-Z') {
        _filteredCourses.sort((a, b) => a.title.compareTo(b.title));
      } else if (_sortOrder == 'Z-A') {
        _filteredCourses.sort((a, b) => b.title.compareTo(a.title));
      }
    });
  }

  void _getUserIdAndCheckStatus() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        _userId = user.uid;
        _userEligible = await EducationService().checkUserStatus(_userId!);
      }
    } catch (e) {
      print('Error checking user status: $e');
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }

  void _updateSortOrder(String newOrder) {
    setState(() {
      _sortOrder = newOrder;
      _sortCourses();
    });
  }

  void _showFilterPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Filtrele'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: const Text('Hepsi'),
                onTap: () {
                  setState(() {
                    _selectedProducer = null;
                  });
                  Navigator.pop(context);
                  _filterCourses();
                },
              ),
              ListTile(
                title: const Text('Enocta'),
                onTap: () {
                  setState(() {
                    _selectedProducer = 'enocta';
                  });
                  Navigator.pop(context);
                  _filterCourses();
                },
              ),
              ListTile(
                title: const Text('Istanbul Kodluyor'),
                onTap: () {
                  setState(() {
                    _selectedProducer = 'istanbul kodluyor';
                  });
                  Navigator.pop(context);
                  _filterCourses();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (!_userEligible) {
      return const Scaffold(
        body: Center(
          child: Text('Eğitimleri görüntülemek için başvurunuzun tamamlanmış olması gerekmektedir.'),
        ),
      );
    }

    return BlocProvider<CourseBloc>(
      create: (context) => CourseBloc()..add(LoadCourses()),
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: FixedAppbar(
            isLeading: false,
            title: Text(
              "Eğitimlerim",
              style: TobetoTextStyle.poppins(context).subHeadlinePurpleBold28,
            ),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 8,
                          child: TextField(
                            controller: _searchController,
                            focusNode: _focusNode,
                            decoration: InputDecoration(
                              hintText: _focusNode.hasFocus ? '' : 'Arama',
                              prefixIcon: const Icon(Icons.search),
                              border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                borderSide: BorderSide(color: TobetoColor.purple),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: DropdownButton<String>(
                            value: _sortOrder,
                            icon: const Icon(Icons.sort, color: TobetoColor.purple),
                            onChanged: (String? newValue) {
                              if (newValue != null) {
                                _updateSortOrder(newValue);
                              }
                            },
                            style: const TextStyle(color: TobetoColor.purple),
                            dropdownColor: Colors.white,
                            items: <String>['A-Z', 'Z-A'].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value, style: TextStyle(color: TobetoColor.purple)),
                              );
                            }).toList(),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: GestureDetector(
                            onTap: () {
                              _showFilterPopup(context);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(ImagePath.purpleFilter, width: 36, height: 36),
                            ),
                          ),
                        ),
                      ],
                    ),
                    TabBar(
                      dividerHeight: 0,
                      tabAlignment: TabAlignment.start,
                      controller: _tabController,
                      isScrollable: true,
                      indicatorColor: TobetoColor.purple,
                      tabs: [
                        Tab(
                          child: Text(
                            TobetoText.mainEducation,
                            style: TobetoTextStyle.poppins(context).captionBlackNormal12,
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Tab(
                          child: Text(
                            TobetoText.mainContinue,
                            style: TobetoTextStyle.poppins(context).captionBlackNormal12,
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Tab(
                          child: Text(
                            TobetoText.mainComplated,
                            style: TobetoTextStyle.poppins(context).captionBlackNormal12,
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: BlocBuilder<CourseBloc, CourseState>(
                  builder: (context, state) {
                    if (state is CoursesLoaded) {
                      final coursesToShow = _searchController.text.isEmpty ? state.courses : _filteredCourses;
                      return TabBarView(
                        controller: _tabController,
                        children: [
                          _buildCourseList(coursesToShow),
                          _buildCourseList(coursesToShow.where((course) => course.status == 'ongoing').toList()),
                          _buildCourseList(coursesToShow.where((course) => course.status == 'completed').toList()),
                        ],
                      );
                    } else if (state is CourseLoadFailure) {
                      return Center(child: Text('Failed to load courses: ${state.error}'));
                    }
                    return const Center(child: CircularProgressIndicator());
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCourseList(List<Course> courses) {
    final sortedCourses = List<Course>.from(courses);
    if (_sortOrder == 'A-Z') {
      sortedCourses.sort((a, b) => b.title.compareTo(a.title));
    } else if (_sortOrder == 'Z-A') {
      sortedCourses.sort((a, b) => a.title.compareTo(b.title));
    }

    return ListView.builder(
      itemCount: sortedCourses.length,
      itemBuilder: (context, index) {
        final course = sortedCourses[index];
        return CourseCard(
          course: course,
        );
      },
    );
  }
}
