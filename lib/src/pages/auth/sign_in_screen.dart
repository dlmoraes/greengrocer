import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:greengrocer/src/pages/commom_widgets/custom_text_field.dart';
import 'package:greengrocer/src/pages/auth/sign_up_screen.dart';
import 'package:greengrocer/src/pages/base/base_screen.dart';
import 'package:greengrocer/src/config/custom_colors.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: CustomColors.customSwatchColor,
        body: SingleChildScrollView(
          child: SizedBox(
            height: size.height,
            width: size.width,
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Nome do app
                      Text.rich(
                        TextSpan(
                          style: const TextStyle(
                            fontSize: 40,
                          ),
                          children: [
                            const TextSpan(
                              text: 'Green',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: 'grocer',
                              style: TextStyle(
                                color: CustomColors.customContrastColor,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Categorias
                      SizedBox(
                        height: 30,
                        child: DefaultTextStyle(
                          style: const TextStyle(
                            fontSize: 25,
                          ),
                          child: AnimatedTextKit(
                            pause: Duration.zero,
                            repeatForever: true,
                            animatedTexts: [
                              FadeAnimatedText('Frutas'),
                              FadeAnimatedText('Verduras'),
                              FadeAnimatedText('Legumes'),
                              FadeAnimatedText('Carnes'),
                              FadeAnimatedText('Cereais'),
                              FadeAnimatedText('Laticíneos'),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),

                // Formulario
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 40,
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(45),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Email
                      const CustomTextField(
                        icon: Icons.email,
                        label: 'E-mail',
                      ),

                      // Senha
                      const CustomTextField(
                        icon: Icons.lock,
                        label: 'Senha',
                        isSecret: true,
                      ),

                      // Botão de entrar
                      SizedBox(
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () =>
                              Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const BaseScreen(),
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: CustomColors.customSwatchColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                          ),
                          child: const Text(
                            'Entrar',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),

                      // Esqueceu a senha
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Esqueceu a senha?',
                            style: TextStyle(
                              color: CustomColors.customContrastColor,
                            ),
                          ),
                        ),
                      ),

                      // Divisor
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: Divider(
                                color: Colors.grey.withAlpha(90),
                                thickness: 2,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Text('Ou'),
                            ),
                            Expanded(
                              child: Divider(
                                color: Colors.grey.withAlpha(90),
                                thickness: 2,
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(
                        height: 50,
                        child: OutlinedButton(
                          onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => SignUpScreen(),
                            ),
                          ),
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(
                              width: 2,
                              color: Colors.green,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                          ),
                          child: const Text(
                            'Criar conta',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
