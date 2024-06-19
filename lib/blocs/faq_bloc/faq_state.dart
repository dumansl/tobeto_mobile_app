import '../../model/faq_model.dart';

abstract class FAQState {
  const FAQState();
}

class FAQInitial extends FAQState {}

class FAQLoading extends FAQState {}

class FAQLoaded extends FAQState {
  final Map<String, FAQCategory> faqs;

  const FAQLoaded(this.faqs);
}

class FAQError extends FAQState {
  final String message;

  const FAQError(this.message);
}
