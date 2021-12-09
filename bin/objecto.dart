import 'package:xml/xml.dart' as xml;

class Objecto {
  late String bairro;
  late String cep;
  late String cidade;
  late String endereco;
  late String uf;

  Objecto(Iterable<xml.XmlElement> obj) {
    bairro = obj.first.findAllElements("bairro").first.text;
    cep = obj.first.findAllElements("cep").first.text;
    cidade = obj.first.findAllElements("cidade").first.text;
    endereco = obj.first.findAllElements("end").first.text;
    uf = obj.first.findAllElements("uf").first.text;
  }
}
