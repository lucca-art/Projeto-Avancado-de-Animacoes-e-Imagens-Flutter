# Flutter Animated Dashboard ✨

Dashboard animado com Flutter, utilizando animações customizadas, Lottie, Hero Animations e Modal Bottom Sheets.  
Tema: **Viagens**

---

## Como Rodar o App

1. Clone o repositório:
    ```bash
    git clone https://github.com/seu-usuario/flutter-animated-dashboard.git
    cd flutter-animated-dashboard
    ```

2. Instale as dependências:
    ```bash
    flutter pub get
    ```

3. Verifique o arquivo `pubspec.yaml`:
    ```yaml
    flutter:
      assets:
        - assets/images/
        - assets/animations/
    ```

4. Rode o app:
    ```bash
    flutter run
    ```

---

## Pacotes Usados

| Pacote                  | Função                                                  |
|--------------------------|---------------------------------------------------------|
| `lottie`                 | Exibir animações Lottie (.json) com ótima performance   |
| `cached_network_image`   | Carregar imagens de rede com cache e placeholder         |

---

## Justificativas de Animações

| Animação     | Justificativa |
|--------------|---------------|
| **Loading**  | Dá feedback visual enquanto operações ocorrem. Torna o app mais fluido e evita a sensação de travamento. |
| **Success**  | Recompensa o usuário com um retorno positivo após uma ação concluída com sucesso. |
| **Fail**     | Informa falhas de maneira amigável, sem ser agressivo, mantendo a experiência consistente. |

---
