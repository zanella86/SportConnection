enum Frequency { EVERY_DAY, WEEKLY, MONTHLY, ONE_TIME }

class FrequencyUtils {
  static Frequency fromString(String value) {
    switch (value) {
      case 'EVERY_DAY':
        return Frequency.EVERY_DAY;
      case 'WEEKLY':
        return Frequency.WEEKLY;
      case 'MONTHLY':
        return Frequency.MONTHLY;

      case 'ONE_TIME':
        return Frequency.ONE_TIME;
      default:
        return null as Frequency;
    }
  }
}