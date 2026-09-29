import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  final VoidCallback onFinished;

  const SplashScreen({super.key, required this.onFinished});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  static const String logoPath = 'assets/ironclad.png';

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..forward();

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        onFinish();
      }
    });
  }

  void onFinish() {
    if (!mounted) return;
    widget.onFinished();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // Converte uma faixa de tempo em uma animação.
  double animate(double begin, double end, {Curve curve = Curves.easeOut}) {
    return CurvedAnimation(
      parent: _controller,
      curve: Interval(begin, end, curve: curve),
    ).value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF080D0F),
      body: SafeArea(
        child: Center(
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              // Entrada geral da composição.
              final stageOpacity = Tween<double>(begin: 0.35, end: 1.0)
                  .animate(
                    CurvedAnimation(
                      parent: _controller,
                      curve: const Interval(0.0, 0.17, curve: Curves.easeOut),
                    ),
                  )
                  .value;

              final stageScale = Tween<double>(begin: 0.975, end: 1.0)
                  .animate(
                    CurvedAnimation(
                      parent: _controller,
                      curve: const Interval(0.0, 0.17, curve: Curves.easeOut),
                    ),
                  )
                  .value;

              // Fade da splash no final.
              final departureOpacity = Tween<double>(begin: 1.0, end: 0.0)
                  .animate(
                    CurvedAnimation(
                      parent: _controller,
                      curve: const Interval(0.88, 1.0, curve: Curves.easeIn),
                    ),
                  )
                  .value;

              return Opacity(
                opacity: stageOpacity * departureOpacity,
                child: Transform.scale(
                  scale: stageScale,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.90,
                    height: MediaQuery.of(context).size.width * 0.90,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        // 1 - Ghost
                        _LogoLayer(
                          imagePath: logoPath,
                          opacity: _ghostOpacity(),
                          clip: const LogoInsets(
                            top: 0.17,
                            right: 0.18,
                            bottom: 0.37,
                            left: 0.18,
                          ),
                        ),

                        // 2 - Parte superior do escudo
                        _LogoLayer(
                          imagePath: logoPath,
                          opacity: animate(0.166, 0.366),
                          clip: _crestTopClip(),
                        ),

                        // 3 - Parte inferior do escudo
                        _LogoLayer(
                          imagePath: logoPath,
                          opacity: animate(0.19, 0.373),
                          clip: _crestBottomClip(),
                        ),

                        // 4 - Carro
                        _LogoLayer(
                          imagePath: logoPath,
                          opacity: animate(0.333, 0.533),
                          clip: const LogoInsets(
                            top: 0.30,
                            right: 0.19,
                            bottom: 0.54,
                            left: 0.19,
                          ),
                          translateX: _carMovement(),
                        ),

                        // 5 - IRONCLAD
                        _LogoLayer(
                          imagePath: logoPath,
                          opacity: animate(0.50, 0.64),
                          clip: const LogoInsets(
                            top: 0.64,
                            right: 0.13,
                            bottom: 0.23,
                            left: 0.13,
                          ),
                          translateY: _wordmarkMovement(),
                        ),

                        // 6 - AUTOMOTIVE
                        _LogoLayer(
                          imagePath: logoPath,
                          opacity: animate(0.567, 0.707),
                          clip: const LogoInsets(
                            top: 0.75,
                            right: 0.25,
                            bottom: 0.14,
                            left: 0.25,
                          ),
                          translateY: _submarkMovement(),
                        ),

                        // 7 - Reflexo dourado
                        _HighlightLayer(
                          imagePath: logoPath,
                          opacity: animate(
                            0.667,
                            0.833,
                            curve: Curves.easeInOut,
                          ),
                          clip: const LogoInsets(
                            top: 0.17,
                            right: 0.18,
                            bottom: 0.37,
                            left: 0.18,
                          ),
                          progress: animate(
                            0.667,
                            0.833,
                            curve: Curves.easeInOut,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  // -------------------------
  // GHOST
  // -------------------------

  double _ghostOpacity() {
    if (_controller.value > 0.17) {
      return 0.0;
    }

    return TweenSequence<double>([
          TweenSequenceItem(tween: Tween(begin: 0.0, end: 0.09), weight: 55),
          TweenSequenceItem(tween: Tween(begin: 0.09, end: 0.0), weight: 45),
        ])
        .animate(
          CurvedAnimation(
            parent: _controller,
            curve: const Interval(0.0, 0.17),
          ),
        )
        .value;
  }

  // -------------------------
  // ESCUDO - PARTE SUPERIOR
  // -------------------------

  LogoInsets _crestTopClip() {
    final progress = animate(0.166, 0.366);

    return LogoInsets(
      top: 0.18,
      right: 0.50 - (0.26 * progress),
      bottom: 0.64,
      left: 0.50 - (0.26 * progress),
    );
  }

  // -------------------------
  // ESCUDO - PARTE INFERIOR
  // -------------------------

  LogoInsets _crestBottomClip() {
    final progress = animate(0.19, 0.373);

    return LogoInsets(
      top: 0.44,
      right: 0.48 - (0.18 * progress),
      bottom: 0.38,
      left: 0.48 - (0.18 * progress),
    );
  }

  // -------------------------
  // CARRO
  // -------------------------

  double _carMovement() {
    final progress = animate(0.333, 0.533);

    return -0.0125 * (1.0 - progress);
  }

  // -------------------------
  // IRONCLAD
  // -------------------------

  double _wordmarkMovement() {
    final progress = animate(0.50, 0.64);

    return 0.006 * (1.0 - progress);
  }

  // -------------------------
  // AUTOMOTIVE
  // -------------------------

  double _submarkMovement() {
    final progress = animate(0.567, 0.707);

    return 0.0045 * (1.0 - progress);
  }
}

// ==========================================================
// CAMADA DA LOGO
// ==========================================================

class _LogoLayer extends StatelessWidget {
  final String imagePath;
  final double opacity;
  final LogoInsets clip;
  final double translateX;
  final double translateY;

  const _LogoLayer({
    required this.imagePath,
    required this.opacity,
    required this.clip,
    this.translateX = 0.0,
    this.translateY = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity.clamp(0.0, 1.0),
      child: ClipPath(
        clipper: LogoClipper(clip),
        child: Transform.translate(
          offset: Offset(
            MediaQuery.of(context).size.width * translateX,
            MediaQuery.of(context).size.width * translateY,
          ),
          child: Image.asset(imagePath, fit: BoxFit.contain),
        ),
      ),
    );
  }
}

// ==========================================================
// BRILHO DOURADO
// ==========================================================

class _HighlightLayer extends StatelessWidget {
  final String imagePath;
  final double opacity;
  final LogoInsets clip;
  final double progress;

  const _HighlightLayer({
    required this.imagePath,
    required this.opacity,
    required this.clip,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: (opacity * 0.20).clamp(0.0, 1.0),
      child: ClipPath(
        clipper: LogoClipper(clip),
        child: ShaderMask(
          blendMode: BlendMode.screen,
          shaderCallback: (bounds) {
            final position = -1.2 + (2.4 * progress);

            return LinearGradient(
              begin: Alignment(position, 0),
              end: Alignment(position + 0.5, 0),
              colors: const [
                Colors.transparent,
                Colors.white,
                Colors.transparent,
              ],
              stops: const [0.0, 0.5, 1.0],
            ).createShader(bounds);
          },
          child: ColorFiltered(
            colorFilter: const ColorFilter.matrix([
              1.32,
              0,
              0,
              0,
              0,
              0,
              1.32,
              0,
              0,
              0,
              0,
              0,
              1.32,
              0,
              0,
              0,
              0,
              0,
              1,
              0,
            ]),
            child: Image.asset(imagePath, fit: BoxFit.contain),
          ),
        ),
      ),
    );
  }
}

// ==========================================================
// RECORTES DA LOGO
// ==========================================================

class LogoInsets {
  final double top;
  final double right;
  final double bottom;
  final double left;

  const LogoInsets({
    required this.top,
    required this.right,
    required this.bottom,
    required this.left,
  });
}

// ==========================================================
// CLIPPER
// ==========================================================

class LogoClipper extends CustomClipper<Path> {
  final LogoInsets insets;

  const LogoClipper(this.insets);

  @override
  Path getClip(Size size) {
    final rect = Rect.fromLTRB(
      size.width * insets.left,
      size.height * insets.top,
      size.width * (1.0 - insets.right),
      size.height * (1.0 - insets.bottom),
    );

    return Path()..addRect(rect);
  }

  @override
  bool shouldReclip(covariant LogoClipper oldClipper) {
    return oldClipper.insets.top != insets.top ||
        oldClipper.insets.right != insets.right ||
        oldClipper.insets.bottom != insets.bottom ||
        oldClipper.insets.left != insets.left;
  }
}
