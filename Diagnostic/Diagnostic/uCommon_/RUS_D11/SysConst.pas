{ *********************************************************************** }
{                                                                         }
{ Delphi / Kylix Cross-Platform Runtime Library                           }
{                                                                         }
{ Copyright (c) 1995, 2001 Borland Software Corporation                   }
{                                                                         }
{  Русификация: 1999-2002 Polaris Software                                }
{               http://polesoft.da.ru                                     }
{ Проверено для D11 2008 Yuri Zhukov                    }
{          uura@mail.ru                                 } 
{ *********************************************************************** }

unit SysConst;

interface

resourcestring
  SUnknown = '<неизвестен>';
  SInvalidInteger = '''%s'' - неверное целое значение';
  SInvalidFloat = '''%s'' - неверное дробное значение';
  SInvalidCurrency = '''%s'' - неверное денежное значение';
  SInvalidDate = '''%s'' - неверная дата';
  SInvalidTime = '''%s'' - неверное время';
  SInvalidDateTime = '''%s'' - неверная дата и время';
  SInvalidDateTimeFloat = '''%g'' - неверная дата и время';
  SInvalidTimeStamp = '''%d.%d'' - неверная дата и время (timestamp)';
  SInvalidGUID = '''%s'' - неверное значение GUID';
  SInvalidBoolean = '''%s'' - неверное логическое значение';
  STimeEncodeError = 'Неверный аргумент для формирования времени';
  SDateEncodeError = 'Неверный аргумент для формирования даты';
  SOutOfMemory = 'Не хватает памяти';
  SInOutError = 'Ошибка ввода/вывода %d';
  SFileNotFound = 'Файл не найден';
  SInvalidFilename = 'Неверное имя файла';
  STooManyOpenFiles = 'Слишком много открытых файлов';
  SAccessDenied = 'В доступе к файлу отказано';
  SEndOfFile = 'Чтение за окончанием файла';
  SDiskFull = 'Диск полон';
  SInvalidInput = 'Неверный ввод числа';
  SDivByZero = 'Деление на ноль';
  SRangeError = 'Ошибка выхода за границы (Range check)';
  SIntOverflow = 'Переполнение целого';
  SInvalidOp = 'Неверная операция с дробными числами';
  SZeroDivide = 'Нецелочисленное деление на ноль';
  SOverflow = 'Нецелочисленное переполнение';
  SUnderflow = 'Нецелочисленная потеря (underflow)';
  SInvalidPointer = 'Неверная операция с указателем';
  SInvalidCast = 'Неверное приведение класса';
{$IFDEF MSWINDOWS}  
  SAccessViolationArg3 = 'Нарушение доступа по адресу %p. %s по адресу %p';
{$ENDIF}  
{$IFDEF LINUX}
  SAccessViolationArg2 = 'Нарушение доступа по адресу %p, обращение к адресу %p';
{$ENDIF}  
  SAccessViolationNoArg = 'Нарушение доступа';
  SStackOverflow = 'Переполнение стека';
  SControlC = 'Нажатие Control-C';
  SQuit = 'Нажатие кнопки Выход';
  SPrivilege = 'Привилегированная инструкция';
  SOperationAborted = 'Операция прервана';
  SException = 'Исключительная ситуация %s в модуле %s по адресу %p.' + sLineBreak + '%s%s' + sLineBreak;
  SExceptTitle = 'Ошибка приложения';
{$IFDEF LINUX}
  SSigactionFailed = 'sigaction call failed';
{$ENDIF}  
  SInvalidFormat = 'Формат ''%s'' неверен или несовместим с аргументом';
  SArgumentMissing = 'Нет аргумента для формата ''%s''';
  SDispatchError = 'Вызовы вариантных методов не поддерживаются';
  SReadAccess = 'Чтение';
  SWriteAccess = 'Запись';
  SResultTooLong = 'Результат форматирования длиннее, чем 4096 символов';
  SFormatTooLong = 'Строка формата слишком длинная';

  SVarArrayCreate = 'Ошибка создания вариантного массива';
  SVarArrayBounds = 'Индекс вариантного массива вышел за границы';
  SVarArrayLocked = 'Вариантный массив заблокирован';
  SVarArrayWithHResult = 'Неожиданная ошибка вариантного или safe массива: %s%.8x';

  SInvalidVarCast = 'Неверное преобразование вариантного типа';
  SInvalidVarOp = 'Неверная операция с вариантом';
  SInvalidVarNullOp = 'Неверная операция с NULL';
  SInvalidVarOpWithHResultWithPrefix = 'Неверная операция с вариантом (%s%.8x)'#10'%s';
  SVarTypeRangeCheck1 = 'Ошибка выхода за границы (range check) для варианта типа (%s)';
  SVarTypeRangeCheck2 = 'Ошибка выхода за границы (range check) при конвертировании варианта типа (%s) в тип (%s)';
  SVarTypeOutOfRangeWithPrefix = 'Произвольный вариантный тип (%s%.4x) вышел за границы';
  SVarTypeAlreadyUsedWithPrefix = 'Произвольный вариантный тип (%s%.4x) уже используется %s';
  SVarTypeNotUsableWithPrefix = 'Произвольный вариантный тип (%s%.4x) является непригодным';
  SVarTypeTooManyCustom = 'Зарегистрировано cлишком много произвольных вариантных типов';

  // the following are not used anymore
  SVarNotArray = 'Вариант не является массивом' deprecated; // not used, use SVarInvalid
  SVarTypeUnknown = 'Неизвестный произвольный вариантный тип (%.4x)' deprecated; // not used anymore
  SVarTypeOutOfRange = 'Произвольный вариантный тип (%.4x) вышел за границы';
  SVarTypeAlreadyUsed = 'Произвольный вариантный тип (%.4x) уже используется %s';
  SVarTypeNotUsable = 'Произвольный вариантный тип (%.4x) является непригодным';
  SInvalidVarOpWithHResult = 'Неверная операция с вариантом ($%.8x)' {$IFDEF VER150}deprecated{$ENDIF};
  
  SVarTypeCouldNotConvert = 'Не могу преобразовать вариант типа (%s) в тип (%s)';
  SVarTypeConvertOverflow = 'Переполнение при преобразовании варианта типа (%s) в тип (%s)';
  SVarOverflow = 'Переполнение варианта';
  SVarInvalid = 'Неверный аргумент';
  SVarBadType = 'Неверный тип варианта';
  SVarNotImplemented = 'Операция не поддерживается';
  SVarOutOfMemory = 'Операции с вариантом не хватило памяти';
  SVarUnexpected = 'Неожиданная ошибка варианта';

  SVarDataClearRecursing = 'Рекурсия во время выполнения VarDataClear';
  SVarDataCopyRecursing = 'Рекурсия во время выполнения VarDataCopy';
  SVarDataCopyNoIndRecursing = 'Рекурсия во время выполнения VarDataCopyNoInd';
  SVarDataInitRecursing = 'Рекурсия во время выполнения VarDataInit';
  SVarDataCastToRecursing = 'Рекурсия во время выполнения VarDataCastTo';
  SVarIsEmpty = 'Вариант - пустой';
  sUnknownFromType = 'Не могу преобразовать из указанного типа';
  sUnknownToType = 'Не могу преобразовать в указанный тип';
  SExternalException = 'Внешняя исключительная ситуация %x';
  SAssertionFailed = 'Assertion failed';
  SIntfCastError = 'Интерфейс не поддерживается';
  SSafecallException = 'Исключительная ситуация в safecall методе';
  SAssertError = '%s (%s, строка %d)';
  SAbstractError = 'Абстрактная ошибка';
  SModuleAccessViolation = 'Нарушение доступа по адресу %p в модуле ''%s''. %s по адресу %p';
  SCannotReadPackageInfo = 'Не могу получить информацию пакета для пакета ''%s''';
  sErrorLoadingPackage = 'Не могу загрузить пакет %s.'#13#10'%s';
  SInvalidPackageFile = 'Неверный файл пакета ''%s''';
  SInvalidPackageHandle = 'Неверный дескриптор пакета';
  SDuplicatePackageUnit = 'Не могу загрузить пакет ''%s''.  Он включает модуль ''%s''' +
    ', который также содержится в пакете ''%s''';
  SOSError = 'Системная ошибка.  Код: %d.'+sLineBreak+'%s';
  SUnkOSError = 'Ошибка при вызове функции ОС';
  SWin32Error = 'Ошибка Win32.  Код: %d.'#10'%s';
  SUnkWin32Error = 'Ошибка функции Win32 API';
  SNL = 'Приложение не имеет лицензии на использование этой возможности';

  SShortMonthNameJan = 'Янв';
  SShortMonthNameFeb = 'Фев';
  SShortMonthNameMar = 'Мар';
  SShortMonthNameApr = 'Апр';
  SShortMonthNameMay = 'Май';
  SShortMonthNameJun = 'Июн';
  SShortMonthNameJul = 'Июл';
  SShortMonthNameAug = 'Авг';
  SShortMonthNameSep = 'Сен';
  SShortMonthNameOct = 'Окт';
  SShortMonthNameNov = 'Ноя';
  SShortMonthNameDec = 'Дек';

  SLongMonthNameJan = 'Январь';
  SLongMonthNameFeb = 'Февраль';
  SLongMonthNameMar = 'Март';
  SLongMonthNameApr = 'Апрель';
  SLongMonthNameMay = 'Май';
  SLongMonthNameJun = 'Июнь';
  SLongMonthNameJul = 'Июль';
  SLongMonthNameAug = 'Август';
  SLongMonthNameSep = 'Сентябрь';
  SLongMonthNameOct = 'Октябрь';
  SLongMonthNameNov = 'Ноябрь';
  SLongMonthNameDec = 'Декабрь';

  SShortDayNameSun = 'Вс';
  SShortDayNameMon = 'Пн';
  SShortDayNameTue = 'Вт';
  SShortDayNameWed = 'Ср';
  SShortDayNameThu = 'Чт';
  SShortDayNameFri = 'Пт';
  SShortDayNameSat = 'Сб';

  SLongDayNameSun = 'Воскресенье';
  SLongDayNameMon = 'Понедельник';
  SLongDayNameTue = 'Вторник';
  SLongDayNameWed = 'Среда';
  SLongDayNameThu = 'Четверг';
  SLongDayNameFri = 'Пятница';
  SLongDayNameSat = 'Суббота';

{$IFDEF LINUX}
  SEraEntries = '';
{$ENDIF}

  SCannotCreateDir = 'Невозможно создать каталог';
  SCodesetConversionError = 'Ошибка преобразования codeset';


implementation

end.