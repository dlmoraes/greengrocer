import 'package:get/get.dart';

String? emailValidator(String? email) {
  if (email == null || email.isEmpty) return 'Digite seu e-mail!';

  if (!email.isEmail) return 'Digite um e-mail válido!';

  return null;
}

String? passwordValidator(String? password) {
  if (password == null || password.isEmpty) {
    return 'Digite sua senha!';
  }

  if (password.length < 7) {
    return 'A senha deve ter no mínimo 7 caracteres!';
  }
  return null;
}

String? nameValidator(String? name) {
  if (name == null || name.isEmpty) return 'Digite um nome!';

  if (name.split(' ').length == 2) return 'Digite seu nome completo!';

  return null;
}

String? phoneValidator(String? phone) {
  if (phone == null || phone.isEmpty) return 'Informe o número do seu celular!';

  if (phone.length < 14 || !phone.isPhoneNumber) {
    return 'Digite um telefone válido!';
  }

  return null;
}

String? cpfValidator(String? cpf) {
  if (cpf == null || cpf.isEmpty) return 'Informe o número do seu CPF!';

  if (!cpf.isCpf) return 'Digite um CPF válido!';

  return null;
}
