# 🌀 Projeto Avançado de Animações e Imagens Flutter

Este mini-app Flutter combina técnicas modernas de **animação**, **gestão otimizada de imagens** e **componentes customizados** para simular funcionalidades comuns em apps de e-commerce e dashboards corporativos. O projeto destaca transições suaves, feedback visual e carregamento otimizado de recursos, elevando a experiência do usuário.

---

## 🚀 Funcionalidades

### 1. **Tela de Boas-Vindas com Cross-Fade e Lottie**
- Imagem de capa carregada via `CachedNetworkImage`, com placeholder local e `fadeInDuration`.
- Animação de entrada combinando `AnimatedCrossFade` com animação Lottie (`assets/animations/welcome.json`) controlada por `AnimationController` de 2 segundos.
- Navegação automática para o Dashboard após final da animação usando `Navigator.pushReplacement`.

### 2. **Transição Hero para o Dashboard**
- Efeito `Hero(tag: 'appLogo')` aplicado ao logo em ambas as telas para continuidade visual durante a transição.

### 3. **Dashboard com Cards Expansíveis**
- `GridView.count` com 4 cards.
- Cada card:
  - Imagem local (`Image.asset`).
  - Título e subtítulo.
  - Expansão com `AnimatedContainer` (cor, padding e tamanho).
  - Medidor circular animado com `CustomPainter` + `AnimationController`, variando de 0.3 a 1.0 de forma randômica.

### 4. **Botão “Adicionar” com Animação Física**
- Botão dentro de cada card dispara `SpringSimulation` (efeito de mola).
- Ícone “salta” com `Transform.translate` e `Transform.scale`.
- Contador global no `AppBar` com animação de `ScaleTransition` a cada incremento.

### 5. **Modal com Sequência Staggered**
- Clique em card expandido abre `showModalBottomSheet`.
- Sub-itens animam com `staggered animation` usando `Interval` e `AnimationController`.
- Animações de `opacity` + `Transform.translate` em sequência.

---

## 📦 Pacotes Utilizados

- [`cached_network_image`](https://pub.dev/packages/cached_network_image)
- [`lottie`](https://pub.dev/packages/lottie)
- [`flutter_animate`](https://pub.dev/packages/flutter_animate) *(opcional para simplificar transições)*
- [`flutter_spring`](https://pub.dev/packages/flutter_spring) *(ou implementação manual de `SpringSimulation` com physics)*

---

## 🧠 Justificativas Técnicas

- **Lottie + Cross-Fade**: experiência suave e moderna na tela inicial.
- **Hero**: mantém o contexto visual entre telas.
- **AnimatedContainer + CustomPainter**: controle fino e performance em animações de cards.
- **SpringSimulation**: simula física realista, tornando o feedback do botão mais natural.
- **Staggered Animation**: melhora a legibilidade e percepção hierárquica ao abrir detalhes.
- **Imagem com `CachedNetworkImage`**: carrega da web com cache e placeholder, evitando "piscadas".
- **Boas práticas com Mixins e Dispose**: evita vazamento de memória e mantém performance ideal.

---

## 🛠️ Como Rodar o Projeto

1. **Clone o repositório**
   ```bash
   git clone https://github.com/seu-usuario/flutter-animacoes-avancadas.git
   cd flutter-animacoes-avancadas
