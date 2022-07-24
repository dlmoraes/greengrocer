import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class UtilsServices {
  // R$ Valor
  String priceToCurrency(double price) {
    NumberFormat numberFormat = NumberFormat.simpleCurrency(locale: 'pt_BR');
    return numberFormat.format(price);
  }

  // DD/MM/YYYY
  String formatDateTime(DateTime dateTime) {
    initializeDateFormatting();

    DateFormat dateFormat = DateFormat.yMd('pt_BR').add_Hm();
    return dateFormat.format(dateTime);
  }
}
