enum TpEventEnum { RANKED, LEARN, FUN }

class TpEventEnumUtils {
  static TpEventEnum fromString(String value) {
    switch (value) {
      case 'RANKED':
        return TpEventEnum.RANKED;
      case 'LEARN':
        return TpEventEnum.LEARN;
      case 'FUN':
        return TpEventEnum.FUN;
      default:
        return null as TpEventEnum;
    }
  }
}