import 'package:bloc/bloc.dart';
import 'package:tobeto_mobile_app/blocs/faq_bloc/faq_event.dart';
import 'package:tobeto_mobile_app/blocs/faq_bloc/faq_state.dart';
import 'package:tobeto_mobile_app/services/faq_service.dart';

class FAQBloc extends Bloc<FAQEvent, FAQState> {
  final FAQService faqService = FAQService();

  FAQBloc() : super(FAQInitial()) {
    on<FetchFAQs>(faqBloc);
  }

  Future<void> faqBloc(FetchFAQs event, Emitter<FAQState> emit) async {
    emit(FAQLoading());
    try {
      final faqs = await faqService.fetchFAQs();
      emit(FAQLoaded(faqs));
    } catch (e) {
      emit(FAQError(e.toString()));
    }
  }
}
