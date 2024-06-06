import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/utils/constant/colors.dart';
import '../announcement_screen/announcement_widgets/announcement_card.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';

class Announcement {
  final String title;
  final String description;
  final DateTime date;
  bool isRead;

  Announcement({required this.title, required this.description, required this.date, this.isRead = false});

  void markAsRead() {
    isRead = true;
  }
}

class AnnouncementScreen extends StatefulWidget {
  const AnnouncementScreen({super.key});

  @override
  State<AnnouncementScreen> createState() => _AnnouncementScreenState();
}

class _AnnouncementScreenState extends State<AnnouncementScreen> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _showOnlyUnread = false;

  List<Announcement> announcements = [
    Announcement(
        title: "Mentor Oturumları Hk.",
        description:
            "Önümüzdeki haftadan itibaren proje sürecinde mentor oturumlarını 3 ayrı gruba ayırıyoruz. İstanbul Kodluyor çerçevesinde şu an; eğitimi devam edenler, mezun olanlar, işe başlayanlar olarak 3 ana kategori var. Her grubun mentor oturumlarında sohbetleri, ihtiyaçları ve dinleyecekleri değişiyor. Aynı anda her grubu mentor oturumuna almak yerine aşağıdaki gibi tarihleri belirledik ve platformda atamalarınızı yaptık. 1) Eğitimi devam edenler: Her hafta perşembeleri saat 12.00 - 13.00 . Not: eskiden zorunlu değildi ama önümüzdeki 2 hafta için eğitimi devam edenlere zorunlu. 2) Mezun olanlar: 2 haftada 1 yapılacak olup, çarşambaları saat 15.00 -16.00 arasında. Zorunlu demeyelim ama katılmanızı canı gönülden istiyoruz ki istihdam sürecinde hepimiz hayallerimize ulaşalım. 3) İşe başlayanlar: Ayda 1 olup, her ayın 2.pazartesisi saat 12.00-13.00 arasında. Zorunlu değil ancak genel durumunuzu görmek ve destek olmak için kıymetli. Sevgiler,",
        date: DateTime.now(),
        isRead: false),
    Announcement(
        title: "Mezunlar için İstanbul Kodluyor Süreci", description: "Açıklama 2", date: DateTime.now(), isRead: true),
    Announcement(title: "6 Mart Sınavları Hk.", description: "Açıklama 3", date: DateTime.now(), isRead: true),
    Announcement(
        title: "20 Şubat Kampüs Buluşması Hk.", description: "Açıklama 4", date: DateTime.now(), isRead: false),
    Announcement(title: "Mindset Anketi", description: "Açıklama 5", date: DateTime.now(), isRead: true),
  ];

  List<Announcement> filteredAnnouncements = [];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_filterAnnouncements);
    filteredAnnouncements = announcements;
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
    setState(() {
      if (query.isEmpty) {
        filteredAnnouncements = announcements;
      } else {
        filteredAnnouncements =
            announcements.where((announcement) => announcement.title.toLowerCase().contains(query)).toList();
      }
      if (_showOnlyUnread) {
        filteredAnnouncements = filteredAnnouncements.where((announcement) => !announcement.isRead).toList();
      }
    });
  }

  void _toggleShowUnread() {
    setState(() {
      _showOnlyUnread = !_showOnlyUnread;
      _filterAnnouncements();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Duyuru ve Haberlerim"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(
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
            child: ListView.builder(
              itemCount: filteredAnnouncements.length,
              itemBuilder: (context, index) {
                return AnnouncementCard(announcement: filteredAnnouncements[index], focusNode: _focusNode);
              },
            ),
          ),
        ],
      ),
    );
  }
}
