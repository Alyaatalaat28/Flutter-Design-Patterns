import 'subsystem.dart';

class HomeTheaterFacade {
  final Amplifier amp;
  final DvdPlayer dvd;
  final Projector projector;
  final Screen screen;
  final TheaterLights lights;
  StringBuffer log = StringBuffer();

  HomeTheaterFacade({
    required this.amp,
    required this.dvd,
    required this.projector,
    required this.screen,
    required this.lights,
  });

  void watchMovie(String movie) {
    log.writeln("Get ready to watch \"$movie\"...");
    lights.dim(10);
    screen.down();
    projector.on();
    projector.wideScreenMode();
    amp.on();
    amp.setDvd(dvd);
    amp.setVolume(5);
    dvd.on();
    dvd.play(movie);
  }

  void endMovie() {
    log.writeln("Shutting down the movie theater...");
    lights.on();
    screen.up();
    projector.off();
    amp.off();
    dvd.stop();
    dvd.off();
  }

  String getSystemStatus() {
    return "${amp.getStatus()}\n${dvd.getStatus()}\n${projector.getStatus()}\n${screen.getStatus()}\n${lights.getStatus()}";
  }

  String getLog() => log.toString();
}