enum EventType { RANKED, LEARN, FUN }

class EventTypeUtils {
  static EventType fromString(String value) {
    switch (value) {
      case 'RANKED':
        return EventType.RANKED;
      case 'LEARN':
        return EventType.LEARN;
      case 'FUN':
        return EventType.FUN;
      default:
        return null as EventType;
    }
  }
}