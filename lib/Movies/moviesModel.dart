class MoviesMock {
  String? title;
  String? year;
  String? rated;
  String? released;
  String? runtime;
  String? genre;
  String? director;
  String? writer;
  String? actors;
  String? plot;
  String? language;
  String? imdbID;
  List<String>? images;

  MoviesMock(
      {this.title,
      this.year,
      this.rated,
      this.released,
      this.runtime,
      this.genre,
      this.director,
      this.writer,
      this.actors,
      this.plot,
      this.language,
      this.imdbID,
      this.images});

  MoviesMock.fromJson(Map<String, dynamic> json) {
    title = json['Title'];
    year = json['Year'];
    rated = json['Rated'];
    released = json['Released'];
    runtime = json['Runtime'];
    genre = json['Genre'];
    director = json['Director'];
    writer = json['Writer'];
    actors = json['Actors'];
    plot = json['Plot'];
    language = json['Language'];
    imdbID = json['imdbID'];
    images = json['Images'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Title'] = this.title;
    data['Year'] = this.year;
    data['Rated'] = this.rated;
    data['Released'] = this.released;
    data['Runtime'] = this.runtime;
    data['Genre'] = this.genre;
    data['Director'] = this.director;
    data['Writer'] = this.writer;
    data['Actors'] = this.actors;
    data['Plot'] = this.plot;
    data['Language'] = this.language;
    data['imdbID'] = this.imdbID;
    data['Images'] = this.images;
    return data;
  }
}
