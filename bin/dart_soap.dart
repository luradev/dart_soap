import 'package:http/http.dart' as http;
import 'package:xml/xml.dart';

import 'objecto.dart';

void main(List<String> arguments) {
  soap_call();
}

Future<void> soap_call() async {
  String codigo = "77001032";
  //String url = "https://apps.correios.com.br/SigepMasterJPA/AtendeClienteService/AtendeCliente?wsdl";

  String envelope =
      "<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" " +
          "xmlns:cli=\"http://cliente.bean.master.sigep.bsb.correios.com.br/\"> " +
          "   <soapenv:Header/> " +
          "   <soapenv:Body>  " +
          "      <cli:consultaCEP> " +
          "         <cep>" +
          codigo +
          "</cep> " +
          "      </cli:consultaCEP>  " +
          "   </soapenv:Body> " +
          "</soapenv:Envelope>";

  final response = await http.post(
    Uri.parse(
        "https://apps.correios.com.br/SigepMasterJPA/AtendeClienteService/AtendeCliente"),
    headers: {
      "Content-Type": "text/xml",
    },
    body: envelope,
  );

  final document = XmlDocument.parse(response.body);
  final obj = document.findAllElements('return');
  Objecto ob = Objecto(obj);

  //var saida = obj.first.findAllElements("bairro").first.text;
  print(ob.bairro);
  print(ob.cep);
  print(ob.cidade);
  print(ob.endereco);
  print(ob.uf);
}
