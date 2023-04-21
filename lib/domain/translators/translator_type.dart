// TODO Prova de conceito: Em avaliação...
abstract class TranslatorType<E,M> {
  E toEntity(M model);
  M toModel(E entity);
}