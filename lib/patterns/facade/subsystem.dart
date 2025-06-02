// Subsystem: DvdPlayer
// ignore_for_file: avoid_print

class DvdPlayer {
  String description;
  String? currentMovie;

  DvdPlayer(this.description);

  void on() => print("$description DVD Player on");
  void play(String movie) {
    currentMovie = movie;
    print("$description DVD Player playing \"$movie\"");
  }
  void stop() {
    print("$description DVD Player stopped \"$currentMovie\"");
    currentMovie = null;
  }
  void off() => print("$description DVD Player off");

  String getStatus() => "$description DVD Player: ${currentMovie != null ? 'Playing \"$currentMovie\"' : 'Off'}";
}

// Subsystem: Projector
class Projector {
  String description;
  DvdPlayer? dvdPlayer;

  Projector(this.description);

  void on() => print("$description Projector on");
  void wideScreenMode() => print("$description Projector in widescreen mode");
  void off() => print("$description Projector off");

  String getStatus() => "$description Projector: ${dvdPlayer != null ? 'On (widescreen)' : 'Off'}";
}

// Subsystem: Amplifier
class Amplifier {
  String description;
  DvdPlayer? dvdPlayer;
  int volume = 0;

  Amplifier(this.description);

  void on() => print("$description Amplifier on");
  void setDvd(DvdPlayer dvd) {
    dvdPlayer = dvd;
    print("$description Amplifier setting DVD player to ${dvd.description}");
  }
  void setVolume(int level) {
    volume = level;
    print("$description Amplifier setting volume to $level");
  }
  void off() => print("$description Amplifier off");

  String getStatus() => "$description Amplifier: ${dvdPlayer != null ? 'On, Volume $volume' : 'Off'}";
}

// Subsystem: Screen
class Screen {
  String description;

  Screen(this.description);

  void down() => print("$description Screen going down");
  void up() => print("$description Screen going up");

  String getStatus() => "$description Screen: Down";
}

// Subsystem: Lights
class TheaterLights {
  String description;
  int brightness = 100;

  TheaterLights(this.description);

  void dim(int level) {
    brightness = level;
    print("$description Theater Lights dimming to $level%");
  }
  void on() => print("$description Theater Lights on");

  String getStatus() => "$description Theater Lights: $brightness%";
}