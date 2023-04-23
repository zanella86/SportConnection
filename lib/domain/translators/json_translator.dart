abstract class JsonTranslator<T> {  // TODO Prova de Conceito
  T? fromJson(Map<String, dynamic> json);
  Map<String, dynamic> toJson(T model);
}