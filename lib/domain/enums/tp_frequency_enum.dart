enum TpFrequencyEnum { EVERY_DAY, WEEKLY, MONTHLY, ONE_TIME }

class TpFrequencyUtils {
  static TpFrequencyEnum fromString(String value) {
    switch (value) {
      case 'EVERY_DAY':
        return TpFrequencyEnum.EVERY_DAY;
      case 'WEEKLY':
        return TpFrequencyEnum.WEEKLY;
      case 'MONTHLY':
        return TpFrequencyEnum.MONTHLY;

      case 'ONE_TIME':
        return TpFrequencyEnum.ONE_TIME;
      default:
        return null as TpFrequencyEnum;
    }
  }
}