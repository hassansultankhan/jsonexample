class prayer {
  String fajr, dhuhur, asar, maghrib, isha;

  prayer(this.fajr, this.dhuhur, this.asar, this.maghrib, this.isha);

  static List<prayer> getmonthdata(Map<String, dynamic> data) {
    List<prayer> alldata = [];
    for (final day in data['data']) {
      String fajr = day['timings']['Fajr'];
      String dhuhur = day['timings']['Dhuhr'];
      String asr = day['timings']['Asr'];
      String maghrib = day['timings']['Maghrib'];
      String isha = day['timings']['Isha'];
      prayer p = prayer(fajr, dhuhur, asr, maghrib, isha);
      alldata.add(p);
    }
    return alldata;
  }
}
