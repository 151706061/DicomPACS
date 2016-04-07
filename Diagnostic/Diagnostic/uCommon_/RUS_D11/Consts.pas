{********************************************************}
{                                                        }
{       Borland Delphi Visual Component Library          }
{                                                        }
{  Copyright (c) 1995-2001 Borland Software Corporation  }
{                                                        }
{  Русификация: 1998-2002 Polaris Software               }
{               http://polesoft.da.ru                    }
{********************************************************}

unit Consts;

interface

resourcestring
  SOpenFileTitle = 'Открыть';
  SCantWriteResourceStreamError = 'Не могу записывать в поток ресурсов "только для чтения"';
  SDuplicateReference = 'WriteObject вызван дважды для одного и того же экземпляра';
  SClassMismatch = 'Неверный класс ресурса %s';
  SInvalidTabIndex = 'Tab индекс вышел за границы';
  SInvalidTabPosition = 'Позиция tab несовместима с текущим стилем tab';
  SInvalidTabStyle = 'Cтиль tab несовместим с текущей позицией tab';
  SInvalidBitmap = 'Изображение Bitmap имеет неверный формат';
  SInvalidIcon = 'Иконка (Icon) имеет неверный формат';
  SInvalidMetafile = 'Метафайл имеет неверный формат';
  SInvalidPixelFormat = 'Неверный точечный (pixel) формат';
  SInvalidImage = 'Неверный формат потока';
  SBitmapEmpty = 'Изображение Bitmap пустое';
  SScanLine = 'Scan line индекс вышел за границы';
  SChangeIconSize = 'Не могу изменить размер иконки';
  SOleGraphic = 'Неверная операция с TOleGraphic';
  SUnknownExtension = 'Неизвестное расширение файла изображения (.%s)';
  SUnknownClipboardFormat = 'Неподдерживаемый формат буфера обмена';
  SOutOfResources = 'Не хватает системных ресурсов';
  SNoCanvasHandle = 'Canvas не позволяет рисовать';
  SInvalidImageSize = 'Неверный размер изображения';
  STooManyImages = 'Слишком много изображений';
  SDimsDoNotMatch = 'Размеры изображения не совпадают с размерами в image list';
  SInvalidImageList = 'Неверный ImageList';
  SReplaceImage = 'Невозможно заменить изображение';
  SImageIndexError = 'Неверный индекс ImageList';
  SImageReadFail = 'Ошибка чтения данных ImageList из потока';
  SImageWriteFail = 'Ошибка записи данных ImageList в поток';
  SWindowDCError = 'Ошибка создания контекста окна (window device context)';
  SClientNotSet = 'Клиент TDrag не инициализирован';
  SWindowClass = 'Ошибка создания оконного класса';
  SWindowCreate = 'Ошибка создания окна';
  SCannotFocus = 'Не могу передать фокус ввода отключенному или невидимому окну';
  SParentRequired = 'Элемент управления ''%s'' не имеет родительского окна';
  SParentGivenNotAParent = 'Данный родитель не является родителем ''%s''';
  SMDIChildNotVisible = 'Не могу скрыть дочернюю форму MDI';
  SVisibleChanged = 'Не могу изменить Visible в OnShow или OnHide';
  SCannotShowModal = 'Не могу сделать видимым модальное окно';
  SScrollBarRange = 'Свойство Scrollbar вышло за границы';
  SPropertyOutOfRange = 'Свойство %s вышло за границы';
  SMenuIndexError = 'Индекс меню вышел за границы';
  SMenuReinserted = 'Меню вставлено дважды';
  SMenuNotFound = 'Подменю - не в меню';
  SNoTimers = 'Нет доступных таймеров';
  SNotPrinting = 'Принтер не находится сейчас в состоянии печати';
  SPrinting = 'Идет печать...';
  SPrinterIndexError = 'Индекс принтера вышел за границы';
  SInvalidPrinter = 'Выбран неверный принтер';
  SDeviceOnPort = '%s on %s';
  SGroupIndexTooLow = 'GroupIndex не может быть меньше, чем GroupIndex предыдущего пункта меню';
  STwoMDIForms = 'Нельзя иметь более одной основной MDI формы в программе';
  SNoMDIForm = 'Не могу создать форму. Нет активных MDI форм';
  SImageCanvasNeedsBitmap = 'Можно редактировать только изображения, которые содержат bitmap';
  SControlParentSetToSelf = 'Элемент управления не может быть родителем самого себя';
  SOKButton = 'OK';
  SCancelButton = 'Отмена';
  SYesButton = '&Да';
  SNoButton = '&Нет';
  SHelpButton = '&Справка';
  SCloseButton = '&Закрыть';
  SIgnoreButton = 'Про&должить';
  SRetryButton = '&Повторить';
  SAbortButton = 'Прервать';
  SAllButton = '&Все';

  SCannotDragForm = 'Не могу перемещать форму';
  SPutObjectError = 'PutObject для неопределенного типа';
  SCardDLLNotLoaded = 'Не могу загрузить CARDS.DLL';
  SDuplicateCardId = 'Найден дубликат CardId';

  SDdeErr = 'Возвращена ошибка DDE  ($0%x)';
  SDdeConvErr = 'Ошибка DDE - диалог не установлен ($0%x)';
  SDdeMemErr = 'Ошибка - не хватает памяти для DDE ($0%x)';
  SDdeNoConnect = 'Не могу присоединить DDE диалог (conversation)';

  SFB = 'FB';
  SFG = 'FG';
  SBG = 'BG';
  SOldTShape = 'Не могу загрузить старую версию TShape';
  SVMetafiles = 'Метафайлы';
  SVEnhMetafiles = 'Расширенные метафайлы';
  SVIcons = 'Иконки';
  SVBitmaps = 'Картинки';
  SGridTooLarge = 'Таблица (Grid) слишком большая для работы';
  STooManyDeleted = 'Удаляется слишком много строк или столбцов';
  SIndexOutOfRange = 'Индекс Grid вышел за границы';
  SFixedColTooBig = 'Число фиксированных столбцов должно быть меньше общего числа столбцов';
  SFixedRowTooBig = 'Число фиксированных строк должно быть меньше общего числа строк';
  SInvalidStringGridOp = 'Не могу вставить или удалить строки из таблицы (grid)';
  SInvalidEnumValue = 'Неверное Enum значение';
  SInvalidNumber = 'Неверное числовое значение';
  SOutlineIndexError = 'Индекс Outline не найден';
  SOutlineExpandError = 'Родительский узел должен быть раскрыт';
  SInvalidCurrentItem = 'Неверное значение для текущего элемента';
  SMaskErr = 'Введено неверное значение';
  SMaskEditErr = 'Введено неверное значение.  Нажмите Esc для отмены изменений';
  SOutlineError = 'Неверный индекс outline';
  SOutlineBadLevel = 'Неверное определение уровня';
  SOutlineSelection = 'Неверный выбор';
  SOutlineFileLoad = 'Ошибка загрузки файла';
  SOutlineLongLine = 'Строка слишком длинная';
  SOutlineMaxLevels = 'Достигнута максимальная глубина outline';

  SMsgDlgWarning = 'Предупреждение';
  SMsgDlgError = 'Ошибка';
  SMsgDlgInformation = 'Информация';
  SMsgDlgConfirm = 'Подтверждение';
  SMsgDlgYes = '&Да';
  SMsgDlgNo = '&Нет';
  SMsgDlgOK = 'OK';
  SMsgDlgCancel = 'Отмена';
  SMsgDlgHelp = '&Справка';
  SMsgDlgHelpNone = 'Справка недоступна';
  SMsgDlgHelpHelp = 'Справка';
  SMsgDlgAbort = 'П&рервать';
  SMsgDlgRetry = '&Повторить';
  SMsgDlgIgnore = 'Про&должить';
  SMsgDlgAll = '&Все';
  SMsgDlgNoToAll = 'Н&ет для всех';
  SMsgDlgYesToAll = 'Д&а для всех';

  SmkcBkSp = 'BkSp';
  SmkcTab = 'Tab';
  SmkcEsc = 'Esc';
  SmkcEnter = 'Enter';
  SmkcSpace = 'Space';
  SmkcPgUp = 'PgUp';
  SmkcPgDn = 'PgDn';
  SmkcEnd = 'End';
  SmkcHome = 'Home';
  SmkcLeft = 'Left';
  SmkcUp = 'Up';
  SmkcRight = 'Right';
  SmkcDown = 'Down';
  SmkcIns = 'Ins';
  SmkcDel = 'Del';
  SmkcShift = 'Shift+';
  SmkcCtrl = 'Ctrl+';
  SmkcAlt = 'Alt+';

  srUnknown = '(Неизвестно)';
  srNone = '(Нет)';
  SOutOfRange = 'Значение должно быть между %d и %d';

  SDateEncodeError = 'Неверный аргумент для формирования даты';
  SDefaultFilter = 'Все файлы (*.*)|*.*';
  sAllFilter = 'Все';
  SNoVolumeLabel = ': [ - нет метки тома - ]';
  SInsertLineError = 'Невозможно вставить строку';

  SConfirmCreateDir = 'Указанная папка не существует. Создать ее?';
  SSelectDirCap = 'Выбор папки';
  SDirNameCap = '&Имя папки:';
  SDrivesCap = '&Устройства:';
  SDirsCap = '&Папки:';
  SFilesCap = '&Файлы: (*.*)';
  SNetworkCap = '&Сеть...';
  
  SColorPrefix = 'Color';
  SColorTags = 'ABCDEFGHIJKLMNOP';

  SInvalidClipFmt = 'Неверный формат буфера обмена';
  SIconToClipboard = 'Буфер обмена не поддерживает иконки';
  SCannotOpenClipboard = 'Не могу открыть буфер обмена';

  SDefault = 'Default';

  SInvalidMemoSize = 'Текст превысил емкость memo';
  SCustomColors = 'Custom Colors';
  SInvalidPrinterOp = 'Операция не поддерживается на выбранном принтере';
  SNoDefaultPrinter = 'Нет выбранного по умолчанию принтера';

  SIniFileWriteError = 'Не могу записать в %s';

  SBitsIndexError = 'Индекс Bits вышел за границы';

  SUntitled = '(Без имени)';

  SInvalidRegType = 'Неверный тип данных для ''%s''';

  SUnknownConversion = 'Неизвестное расширение файла для конвертирования RichEdit (.%s)';
  SDuplicateMenus = 'Меню ''%s'' уже используется другой формой';

  SPictureLabel = 'Картинка:';
  SPictureDesc = ' (%dx%d)';
  SPreviewLabel = 'Просмотр';

  SCannotOpenAVI = 'Не могу открыть AVI';

  SNotOpenErr = 'Нет открытых устройств MCI';
  SMPOpenFilter = 'Все файлы (*.*)|*.*|Аудио файлы (*.wav)|*.wav|Midi файлы (*.mid)|*.mid|Видео для Windows (*.avi)|*.avi';
  SMCINil = '';
  SMCIAVIVideo = 'AVIVideo';
  SMCICDAudio = 'CDAudio';
  SMCIDAT = 'DAT';
  SMCIDigitalVideo = 'DigitalVideo';
  SMCIMMMovie = 'MMMovie';
  SMCIOther = 'Other';
  SMCIOverlay = 'Overlay';
  SMCIScanner = 'Scanner';
  SMCISequencer = 'Sequencer';
  SMCIVCR = 'VCR';
  SMCIVideodisc = 'Videodisc';
  SMCIWaveAudio = 'WaveAudio';
  SMCIUnknownError = 'Неизвестный код ошибки';

  SBoldItalicFont = 'Bold Italic';
  SBoldFont = 'Bold';
  SItalicFont = 'Italic';
  SRegularFont = 'Regular';

  SPropertiesVerb = 'Свойства';

  SServiceFailed = 'Сбой службы на %s: %s';
  SExecute = 'execute';
  SStart = 'start';
  SStop = 'stop';
  SPause = 'pause';
  SContinue = 'continue';
  SInterrogate = 'interrogate';
  SShutdown = 'shutdown';
  SCustomError = 'Сбой службы в custom message(%d): %s';
  SServiceInstallOK = 'Служба установлена успешно';
  SServiceInstallFailed = 'Сбой при установке службы "%s", ошибка: "%s"';
  SServiceUninstallOK = 'Служба снята успешно';
  SServiceUninstallFailed = 'Сбой при снятии службы "%s", ошибка: "%s"';

  SInvalidActionRegistration = 'Неверная регистрация действия (action)';
  SInvalidActionUnregistration = 'Неверная отмена регистрации действия (action)';
  SInvalidActionEnumeration = 'Неверный перечень действий (action)';
  SInvalidActionCreation = 'Неверное создание действия (action)';

  SDockedCtlNeedsName = 'Докированный элемент должен иметь имя';
  SDockTreeRemoveError = 'Ошибка удаления элемента из dock tree';
  SDockZoneNotFound = ' - область докирования не найдена';
  SDockZoneHasNoCtl = ' - область докирования не имеет элементов управления';
  SDockZoneVersionConflict = 'Error loading dock zone from the stream. ' +
    'Expecting version %d, but found %d.';

  SAllCommands = 'All Commands';

  SDuplicateItem = 'Список не допускает дубликатов ($0%x)';

  STextNotFound = 'Текст не нейден: "%s"';
  SBrowserExecError = 'Не указан браузер по умолчанию';

  SColorBoxCustomCaption = 'Выбрать...';

  SMultiSelectRequired = 'Режим множественного выбора должен быть включен для этой возможности';

  SKeyCaption = 'Параметр';
  SValueCaption = 'Значение';
  SKeyConflict = 'Параметр с именем "%s" уже создан';
  SKeyNotFound = 'Параметр "%s" не найден';
  SNoColumnMoving = 'goColMoving - неподдерживаемая опция';
  SNoEqualsInKey = 'Параметр не может содержать знак "равно" ("=")';

  SSendError = 'Ошибка отправки почты';
  SAssignSubItemError = 'Не могу присвоить подпункт к actionbar когда один из его предков уже присвоен actionbar';
  SDeleteItemWithSubItems = 'Пункт %s имеет подпункты, все равно удалить?';
  SDeleteNotAllowed = 'Вам не разрешено удалять этот пункт';
  SMoveNotAllowed = 'Пункт %s нельзя перемещать';
  SMoreButtons = 'Больше кнопок';
  SErrorDownloadingURL = 'Ошибка загрузки URL: %s';
  SUrlMonDllMissing = 'Не могу загрузить %s';
  SAllActions = '(Все действия)';
  SNoCategory = '(Нет категории)';
  SExpand = 'Expand';
  SErrorSettingPath = 'Ошибка установки пути: "%s"';
  SLBPutError = 'Попытка поместить пункты в виртуальный listbox';
  SErrorLoadingFile = 'Ошибка загрузки ранее сохраненного файла настроек: %s'#13'Вы хотите удалить его?';
  SResetUsageData = 'Reset все используемые данные?';
  SFileRunDialogTitle = 'Выполнить';
  SNoName = '(Нет имени)';      
  SErrorActionManagerNotAssigned = 'ActionManager должен быть присвоен первым';
  SAddRemoveButtons = '&Добавить или удалить кнопки';
  SResetActionToolBar = 'Reset Toolbar';
  SCustomize = '&Настроить';
  SSeparator = 'Разделитель';
  SCirularReferencesNotAllowed = 'Циклические ссылки не поддерживаются';
  SCannotHideActionBand = '%s не позволяет скрыть (hiding)';
  SErrorSettingCount = 'Ошибка установки %s.Count';
  SListBoxMustBeVirtual = 'Listbox (%s) Style должен быть Virtual для установки такого Count';
  SUnableToSaveSettings = 'Не могу сохранить установки';  
  SRestoreDefaultSchedule = 'Вы хотите восстановить Priority Schedule по умолчанию?';
  SNoGetItemEventHandler = 'Не определен обработчик события OnGetItem';
  SInvalidColorMap = 'Неверный Colormap этот ActionBand требует ColorMaps типа TCustomActionBarColorMapEx';
  SDuplicateActionBarStyleName = 'Стиль с именем %s уже зарегистрирован';
  SStandardStyleActionBars = 'Стандартный стиль';
  SXPStyleActionBars = 'Стиль XP';
  SActionBarStyleMissing = 'Нет модуля со стилем ActionBand в предложении uses.'#13 +
    'Ваше приложение должно включать либо XPStyleActnCtrls, StdStyleActnCtrls, или ' +
    'модуль со стилем ActionBand третьей фирмы в своем предложении uses.';
  SAssignError = 'Не могу значение %s присвоить %s';
  SInvalidColorString = 'Invalid Color string';  
  
  SInvalidPath = '"%s" неправильный путь';
  SInvalidPathCaption = 'Неправильный путь';
  
  SANSIEncoding = 'ANSI';
  SASCIIEncoding = 'ASCII';
  SUnicodeEncoding = 'Unicode';
  SBigEndianEncoding = 'Big Endian Unicode';
  SUTF8Encoding = 'UTF-8';
  SUTF7Encoding = 'UTF-7';
  SEncodingLabel = 'Encoding:';

  sCannotAddFixedSize = 'Cannot add columns or rows while expand style is fixed size';
  sInvalidSpan = '''%d'' is not a valid span';
  sInvalidRowIndex = 'Row index, %d, out of bounds';
  sInvalidColumnIndex = 'Column index, %d, out of bounds';
  sInvalidControlItem = 'ControlItem.Control cannot be set to owning GridPanel';
  sCannotDeleteColumn = 'Cannot delete a column that contains controls';
  sCannotDeleteRow = 'Cannot delete a row that contains controls';
  sCellMember = 'Member';
  sCellSizeType = 'Size Type';
  sCellValue = 'Value';
  sCellAutoSize = 'Auto';
  sCellPercentSize = 'Percent';
  sCellAbsoluteSize = 'Absolute';
  sCellColumn = 'Column%d';
  sCellRow = 'Row%d';

  STrayIconRemoveError = 'Cannot remove shell notification icon';
  STrayIconCreateError = 'Cannot create shell notification icon';

  SPageControlNotSet = 'PageControl must first be assigned';

  SWindowsVistaRequired = '%s requires Windows Vista or later';
  SXPThemesRequired = '%s requires themes to be enabled';

  STaskDlgButtonCaption = 'Button%d';
  STaskDlgRadioButtonCaption = 'RadioButton%d';
  SInvalidTaskDlgButtonCaption = 'Caption cannot be empty';

implementation

end.
