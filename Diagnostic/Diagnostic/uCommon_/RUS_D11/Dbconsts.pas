{ *************************************************************************** }
{                                                                             }
{ Kylix and Delphi Cross-Platform Visual Component Library                    }
{                                                                             }
{ Copyright (c) 1997, 2001 Borland Software Corporation                       }
{                                                                             }
{  Русификация: 1998-2001 Polaris Software                                    }
{               http://polesoft.da.ru                                         }
{ Проверено для D11 2008 Yuri Zhukov                    }
{          uura@mail.ru                                 } 
{ *************************************************************************** }

unit DbConsts;

interface

resourcestring
  SInvalidFieldSize = 'Неверный размер поля';
  SInvalidFieldKind = 'Неверный FieldKind';
  SInvalidFieldRegistration = 'Неверная регистрация поля';
  SUnknownFieldType = 'Тип поля ''%s'' неизвестен';
  SFieldNameMissing = 'Отсутствует имя поля';
  SDuplicateFieldName = 'Дубликат имени поля ''%s''';
  SFieldNotFound = 'Поле ''%s'' не найдено';
  SFieldAccessError = 'Не могу получить доступ к полю ''%s'' как типа %s';
  SFieldValueError = 'Неверное значение для поля ''%s''';
  SFieldRangeError = '%g - неверное значение для поля ''%s''. Разрешенный диапазон - от %g до %g';
  SBcdFieldRangeError = '%s - неверное значение для поля ''%s''. Разрешенный диапазон - от %s до %s';
  SInvalidIntegerValue = '''%s'' - неверное целое значение для поля ''%s''';
  SInvalidBoolValue = '''%s'' - неверное логическое значение для поля ''%s''';
  SInvalidFloatValue = '''%s'' - неверное дробное значение для поля ''%s''';
  SFieldTypeMismatch = 'Неверный тип поля ''%s'', ожидается: %s, установлено: %s';
  SFieldSizeMismatch = 'Неверный размер для поля ''%s'', ожидается: %d, установлено: %d';
  SInvalidVarByteArray = 'Неверный вариантный тип или размер';
  SFieldOutOfRange = 'Значение поля ''%s'' вышло за границы';
//  SBCDOverflow = '(Переполнение)';
  SCantAdjustPrecision = 'Error adjusting BCD precision';
  SFieldRequired = 'Поле ''%s'' должно иметь значение';
  SDataSetMissing = 'Поле ''%s'' не имеет набора данных (dataset)';
  SInvalidCalcType = 'Поле ''%s'' не может быть вычисляемым или поисковым полем';
  SFieldReadOnly = 'Поле ''%s'' не может быть изменено';
  SFieldIndexError = 'Индекс поля вышел за границы';
  SNoFieldIndexes = 'Нет активного индекса';
  SNotIndexField = 'Поле ''%s'' не индексировано и не может быть изменено';
  SIndexFieldMissing = 'Не могу получить доступ к индексному полю ''%s''';
  SDuplicateIndexName = 'Дубликат имени индекса ''%s''';
  SNoIndexForFields = 'Нет индекса для полей ''%s''';
  SIndexNotFound = 'Индекс ''%s'' не найден';
  SDuplicateName = 'Дубликат имени ''%s'' в %s';
  SCircularDataLink = 'Циклические связи данных не разрешены';
  SLookupInfoError = 'Информация поиска (lookup) для поля ''%s'' - неполная';
  SNewLookupFieldCaption = 'Новое поисковое (lookup) поле';
  SDataSourceChange = 'DataSource не может быть изменен';
  SNoNestedMasterSource = 'Вложенные таблицы не могут иметь MasterSource';
  SDataSetOpen = 'Не могу выполнить эту операцию для открытого набора данных (dataset)';
  SNotEditing = 'Набор данных (Dataset) не в режиме редактирования или вставки';
  SDataSetClosed = 'Не могу выполнить эту операцию для закрытого набора данных (dataset)';
  SDataSetEmpty = 'Не могу выполнить эту операцию для пустого набора данных (dataset)';
  SDataSetReadOnly = 'Не могу изменять набор данных "только для чтения" (read-only dataset)';
  SNestedDataSetClass = 'Вложенный набор данных должен наследоваться от %s';
  SExprTermination = 'Выражение фильтра некорректно завершено';
  SExprNameError = 'Незавершенное имя поля';
  SExprStringError = 'Незавершенная строковая константа';
  SExprInvalidChar = 'Неверный символ в выражении фильтра: ''%s''';
  SExprNoRParen = ''')'' ожидается, но обнаружено %s';
  SExprNoRParenOrComma = ''')'' или '','' ожидается, но обнаружено %s';
  SExprNoLParen = '''('' ожидается, но обнаружено %s';
  SExprExpected = 'Ожидается выражение, но обнаружено %s';
  SExprBadField = 'Поле ''%s'' не может использоваться в выражении фильтра';
  SExprBadNullTest = 'NULL разрешено только с ''='' и ''<>''';
  SExprRangeError = 'Константа вышла за границы';
  SExprNotBoolean = 'Поле ''%s'' - не логического типа';
  SExprIncorrect = 'Некорректно сформированное выражение фильтра';
  SExprNothing = 'пусто';
  SExprTypeMis = 'Несовпадение типов в выражении';
  SExprBadScope = 'В операция нельзя смешивать агрегатные значения со значениями полей';
  SExprNoArith = 'Арифметика в выражении фильтра не поддерживается';
  SExprNotAgg = 'Выражение не является агрегатным';
  SExprBadConst = 'Константа неверного типа %s';
  SExprNoAggFilter = 'Агрегатные выражения не поддерживаются в фильтрах';
  SExprEmptyInList = 'Список IN команды не может быть пустым';
  SInvalidKeywordUse = 'Неверное использование ключевого слова';
  STextFalse = '0';
  STextTrue = '1';
  SParameterNotFound = 'Параметр ''%s'' не найден';
  SInvalidVersion = 'Невозможно загрузить параметры привязки';
  SParamTooBig = 'Параметр ''%s'', не могу сохранить данные длиннее %d байт';
  SBadFieldType = 'Тип поля ''%s'' не поддерживается';
  SAggActive = 'Свойство не может быть изменено, пока aggregate активно';
  SProviderSQLNotSupported = 'SQL не поддерживается: %s';
  SProviderExecuteNotSupported = 'Выполнение не поддерживается: %s';
  SExprNoAggOnCalcs = 'Используется поле ''%s'' неверного типа вычисляемого поля в aggregate, используйте internalcalc';
  SRecordChanged = 'Запись не найдена или изменена другим пользователем';
  SDataSetUnidirectional = 'Операция не допускается на однонаправленном наборе данных (dataset)';
  SUnassignedVar = 'Unassigned значение варианта';
  SRecordNotFound = 'Запись не найдена';
  SFileNameBlank = 'Свойство FileName не может быть пустым';
  SFieldNameTooLarge = 'Имя поля %s превысило %d символов';
  
  { For FMTBcd }

  SBcdOverflow = 'Переполнение BCD';
  SInvalidBcdValue = '%s - неверное BCD значение';
  SInvalidFormatType = 'Неверный тип формата для BCD';

  { For SqlTimSt }

  SCouldNotParseTimeStamp = 'Не могу разобрать строку SQL TimeStamp';
  SInvalidSqlTimeStamp = 'Неверные значения SQL даты/времени';

  SDeleteRecordQuestion = 'Удалить запись?';
  SDeleteMultipleRecordsQuestion = 'Удалить все выбранные записи?';
  STooManyColumns = 'Таблица (Grid) не может содержать более 256 колонок';

  { For reconcile error }
  SSkip = 'Пропустить';
  SAbort = 'Прервать';
  SMerge = 'Объединить';
  SCorrect = 'Correct';
  SCancel  = 'Отмена';
  SRefresh = 'Обновить';
  SModified = 'Изменено';
  SInserted = 'Вставлено';
  SDeleted  = 'Удалено';
  SCaption = 'Ошибка изменения - %s';
  SUnchanged = '<Не изменено>';  
  SBinary = '(Двоичный)';                              
  SAdt = '(ADT)';   
  SArray = '(Массив)'; 
  SFieldName = 'Имя поля'; 
  SOriginal = 'Исходное значение'; 
  SConflict = 'Конфликтующее значение';  
  SValue = ' Значение';   
  SNoData = '<Нет записей>';
  SNew = 'Нов.';    

implementation

end.
