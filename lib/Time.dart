enum Time {
  Today,
  Yestaday,
  ThisWeek,
  ThisMonth,
  ThisYear,
  LastWeek,
  LastMonth,
  LastYear,
  LongAgo,
}

class TimeHelper {
  static String getValue(Time time) {
    switch (time) {
      case Time.Today:
        return '今日';
      case Time.Yestaday:
        return '昨日';
      case Time.ThisWeek:
        return '今週';
      case Time.ThisMonth:
        return '今月';
      case Time.ThisYear:
        return '今年';
      case Time.LastWeek:
        return '先週';
      case Time.LastMonth:
        return '先月';
      case Time.LastYear:
        return '去年';
      case Time.LongAgo:
        return 'かなり前';
    }
  }
}
