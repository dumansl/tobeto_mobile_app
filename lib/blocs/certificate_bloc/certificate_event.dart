abstract class CertificateEvent {}

class LoadCertificate extends CertificateEvent {}

class AddCertificate extends CertificateEvent {
  final Map<String, dynamic> certificate;

  AddCertificate(this.certificate);
}

class RemoveCertificate extends CertificateEvent {
  Map<String, dynamic> certificate;

  RemoveCertificate(this.certificate);
}
