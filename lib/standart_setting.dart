/*
Налаштування будуть заповнюватись зі вкладки налаштування, без цих данних процесс запуску додтк неможливий
ЦЕЙ метод потрібен для зберігання інформації користувача
В подальшому виконаємо рефакторинг та замінемо цей метод
 */
class StSetting{
  String nameUser;
  int numberLearningCardDay;
  StSetting(this.nameUser, this.numberLearningCardDay);

}