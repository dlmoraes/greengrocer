import 'package:flutter/material.dart';
import 'package:greengrocer/src/config/app_data.dart' as appData;
import 'package:greengrocer/src/pages/auth/controller/auth_controller.dart';
import 'package:greengrocer/src/pages/commom_widgets/custom_text_field.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  final authController = AuthController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil do usuário'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => authController.signOut(),
          ),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
        children: [
          //Email
          CustomTextField(
            icon: Icons.email,
            label: 'E-mail',
            initialValue: appData.user.email,
            readOnly: true,
          ),
          // Nome
          CustomTextField(
            icon: Icons.person,
            label: 'Nome',
            initialValue: appData.user.name,
            readOnly: true,
          ),
          // Celular
          CustomTextField(
            icon: Icons.phone,
            label: 'Celular',
            initialValue: appData.user.phone,
            readOnly: true,
          ),
          // CPF
          CustomTextField(
            icon: Icons.file_copy,
            label: 'CPF',
            isSecret: true,
            initialValue: appData.user.cpf,
            readOnly: true,
          ),
          // Botão para atualizar senha
          SizedBox(
            height: 50,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(
                  color: Colors.green,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () async {
                bool? result = await updatePassword();
                print(result);
              },
              child: const Text(
                'Atualizar senha',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<bool?> updatePassword() {
    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 16,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Titulo
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Text(
                          'Atualize sua senha',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      // Senha atual
                      const CustomTextField(
                        icon: Icons.lock,
                        label: 'Senha atual',
                        isSecret: true,
                      ),

                      // Nova senha
                      const CustomTextField(
                        icon: Icons.lock_outline,
                        label: 'Nova senha',
                        isSecret: true,
                      ),

                      // Confirmação de nova senha
                      const CustomTextField(
                        icon: Icons.lock_outline,
                        label: 'Confirmar nova senha',
                        isSecret: true,
                      ),
                      SizedBox(
                        height: 45,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          onPressed: () => Navigator.of(context).pop(true),
                          child: const Text(
                            'Atualizar',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 5,
                  right: 5,
                  child: IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.of(context).pop(false),
                  ),
                )
              ],
            ),
          );
        });
  }
}
