﻿#language: ru


Функционал: создание документа заказ клиента (подсистема продажи)

Как Менеджер по продажам я хочу
создание документа заказ клиенту 
чтобы сумма по строчке табличной части товары должна быть расчитана корректно 
Контекст: 
Дано Я открыл новый сеанс TestClient или подключил уже существующий

Сценарий: создание документа заказа клиента
// создание заказа клиента
* Открытие формы создания документа
	И я закрываю все окна клиентского приложения
	И В командном интерфейсе я выбираю 'Продажи' 'Заказы'
	Тогда открылось окно 'Заказы товаров'
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	Тогда открылось окно 'Заказ (создание)'
* Заполнение шапки заказа клиента
	И из выпадающего списка с именем "Организация" я выбираю точное значение 'ООО "1000 мелочей"'
	И из выпадающего списка с именем "Покупатель" я выбираю точное значение 'Мосхлеб ОАО'
	И из выпадающего списка с именем "Склад" я выбираю точное значение 'Строящийся склад'
* Заполнение табличной части "товары"
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" я нажимаю кнопку выбора у реквизита с именем "ТоварыТовар"
	Тогда открылось окно 'Товары'
	И я нажимаю на кнопку с именем 'ФормаСписок'
	И в таблице "Список" я перехожу к строке:
		| 'Код'       | 'Наименование' |
		| '000000029' | 'Хлеб'         |
	И я нажимаю на кнопку с именем 'ФормаВыбрать'
	И в таблице "Товары" я активизирую поле с именем "ТоварыЦена"
	И в таблице "Товары" в поле с именем 'ТоварыЦена' я ввожу текст '444,01'		
	И в таблице "Товары" я активизирую поле с именем "ТоварыКоличество"
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '333'	
	И в таблице "Товары" я завершаю редактирование строки
* Сохранение в переменные цены и количества
	И я запоминаю значение таблицы 'Товары' поля 'Цена' как "$Цена$"
	И я запоминаю значение таблицы 'Товары' поля 'Количество' как "$Количество$"	
	И Я запоминаю значение выражения '$Цена$*$Количество$' в переменную "$Сумма$"
* Проверка строчки табличной части
	Тогда таблица "Товары" стала равной:
		| 'Товар' | 'Цена'   | 'Количество' | 'Сумма'      |
		| 'Хлеб'  | "$Цена$" | "$Количество$"        | "$Сумма$" |
	
