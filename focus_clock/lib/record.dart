class Record {
  var startTime;
  var stopTime;

  set start(var time) {
    startTime = time;
  }

  set stop(var time) {
    stopTime = time;
  }

  String saveTime() {
    var d = DateTime.parse(stopTime).difference(DateTime.parse(startTime));
    return d.inSeconds.toString();
  }
}
