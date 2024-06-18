import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_mobile_app/services/announcement_service.dart';
import 'package:tobeto_mobile_app/blocs/announcement_bloc/announcement_bloc.dart';
import '../announcement_screen/announcement_widgets/announcement_card.dart';
import 'package:tobeto_mobile_app/utils/constant/colors.dart';

class AnnouncementScreen extends StatelessWidget {
  const AnnouncementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AnnouncementBloc(AnnouncementService())..add(LoadAnnouncements()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Duyuru ve Haberlerim"),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: const AnnouncementView(),
      ),
    );
  }
}

class AnnouncementView extends StatefulWidget {
  const AnnouncementView({super.key});

  @override
  State<AnnouncementView> createState() => _AnnouncementViewState();
}

class _AnnouncementViewState extends State<AnnouncementView> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _showOnlyUnread = false;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_filterAnnouncements);
  }

  @override
  void dispose() {
    _searchController.removeListener(_filterAnnouncements);
    _searchController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _filterAnnouncements() {
    final query = _searchController.text.toLowerCase();
    context.read<AnnouncementBloc>().add(FilterAnnouncements(query));
    if (_showOnlyUnread) {
      context.read<AnnouncementBloc>().add(const ToggleShowUnread(true));
    }
  }

  void _toggleShowUnread() {
    setState(() {
      _showOnlyUnread = !_showOnlyUnread;
    });
    context.read<AnnouncementBloc>().add(ToggleShowUnread(_showOnlyUnread));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                flex: 9,
                child: TextField(
                  controller: _searchController,
                  focusNode: _focusNode,
                  decoration: InputDecoration(
                    hintText: _focusNode.hasFocus ? '' : 'Ara...',
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
                flex: 1,
                child: IconButton(
                  icon: Icon(_showOnlyUnread ? Icons.visibility_off : Icons.visibility),
                  onPressed: _toggleShowUnread,
                  tooltip: _showOnlyUnread ? 'Hepsini Göster' : 'Okunmuş Olanları Gizle',
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: BlocBuilder<AnnouncementBloc, AnnouncementState>(
            builder: (context, state) {
              if (state is AnnouncementsLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is AnnouncementsLoaded || state is AnnouncementsFiltered) {
                final announcements =
                    state is AnnouncementsLoaded ? state.announcements : (state as AnnouncementsFiltered).announcements;
                if (announcements.isEmpty) {
                  return const Center(child: Text('No announcements available.'));
                }
                return ListView.builder(
                  itemCount: announcements.length,
                  itemBuilder: (context, index) {
                    return AnnouncementCard(announcement: announcements[index], focusNode: _focusNode);
                  },
                );
              } else if (state is AnnouncementsError) {
                return Center(child: Text(state.message));
              } else {
                return const Center(child: Text('Unexpected state.'));
              }
            },
          ),
        ),
        /*Expanded(
          child: BlocBuilder<AnnouncementBloc, AnnouncementState>(
            builder: (context, state) {
              if (state is AnnouncementsLoaded || state is AnnouncementsFiltered) {
                final announcements =
                    state is AnnouncementsLoaded ? state.announcements : (state as AnnouncementsFiltered).announcements;
                return ListView.builder(
                  itemCount: announcements.length,
                  itemBuilder: (context, index) {
                    return AnnouncementCard(announcement: announcements[index], focusNode: _focusNode);
                  },
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ), */
      ],
    );
  }
}
