&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	МодификацияУправляемыхФорм.ПрименитьМакетИзменений(ЭтаФорма);
	МодификацияУправляемыхФорм.ПрименитьМакетИзменений(ЭтаФорма);

	ИзменитьДату = НСтр("ru = 'Изменить дату'");
КонецПроцедуры

&НаСервере
Процедура ПослеЗаписиНаСервере(ТекущийОбъект, ПараметрыЗаписи)
	Для Каждого СтрокаТаблицы Из Объект.Товары Цикл
		СтрокаТаблицы.Реквизит1 = "Гиперссылка";
	КонецЦикла;
КонецПроцедуры

&НаСервере
Процедура ПриЧтенииНаСервере(ТекущийОбъект)
	УстановитьВидимостьДоступностьЭлементовФормы(ЭтаФорма);

	Для Каждого СтрокаТаблицы Из Объект.Товары Цикл
		СтрокаТаблицы.Реквизит1 = "Гиперссылка";
	КонецЦикла;
КонецПроцедуры

&НаКлиенте
Процедура ПриОткрытии(Отказ)
	ОбновитьОграничениеИзмененияРеквизитов();
КонецПроцедуры

&НаКлиенте
Процедура Подбор(Команда)
КонецПроцедуры

&НаКлиенте
Процедура МОД_РассчитатьПроценты()
	Сообщить("МОД_РассчитатьПроценты");	
КонецПроцедуры

&НаКлиенте
Процедура МОД_ДополнительныеРасходыНоменклатураПриИзменении(Элемент)
	Сообщить("МОД_ДополнительныеРасходыНоменклатураПриИзменении");
КонецПроцедуры

&НаКлиенте
Процедура МОД_ДополнительныеРасходыЗначениеПриИзменении(Элемент)
	Сообщить("МОД_ДополнительныеРасходыЗначениеПриИзменении");
КонецПроцедуры

&НаКлиенте
Процедура Печать(Команда)
КонецПроцедуры

&НаКлиенте
Процедура ОбновитьОграничениеИзмененияРеквизитов()
	Если ЭтаФорма.Объект.МОД_Утвержден = ЭтаФорма.МОД_БылУтвержден Тогда
		Возврат;
	КонецЕсли;
	
	МодификацияУправляемыхФорм.ОтменитьОграничениеИзмененияРеквизитов(ЭтаФорма);
	Если ЭтаФорма.Объект.МОД_Утвержден Тогда
		МодификацияУправляемыхФорм.ОграничитьИзменениеРеквизитов(ЭтаФорма, "МОД_Утвержден,Реквизит1,ФормаЗаписать");
	КонецЕсли;
	
	ЭтаФорма.МОД_БылУтвержден = ЭтаФорма.Объект.МОД_Утвержден;
КонецПроцедуры

&НаКлиентеНаСервереБезКонтекста
Процедура УстановитьВидимостьДоступностьЭлементовФормы(ЭтаФорма)
	ЭтаФорма.Элементы.ТоварыПодбор.Доступность = ЗначениеЗаполнено(ЭтаФорма.Объект.Реквизит1);
	МодификацияУправляемыхФорм.ВосстановитьОграничениеИзмененияРеквизитов(ЭтаФорма);
КонецПроцедуры

&НаКлиенте
Процедура ПослеЗаписи(ПараметрыЗаписи)
	ОбновитьОграничениеИзмененияРеквизитов();
КонецПроцедуры

&НаКлиенте
Процедура Реквизит1ПриИзменении(Элемент)
	УстановитьВидимостьДоступностьЭлементовФормы(ЭтаФорма);
КонецПроцедуры

&НаКлиенте
Процедура ТоварыРеквизит1Нажатие(Элемент, СтандартнаяОбработка)
	ПоказатьПредупреждение( , НСтр("ru = 'Гиперссылка ячейки'"));
КонецПроцедуры


#Если Сервер Тогда
МодификацияУправляемыхФорм.ПрименитьМакетИзменений(ЭтаФорма);
МодификацияУправляемыхФорм.ИнициализироватьОграничениеИзмененияРеквизитов(ЭтаФорма);
#КонецЕсли
