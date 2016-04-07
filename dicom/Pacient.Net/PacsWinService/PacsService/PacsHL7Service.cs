using System;
using System.ServiceProcess;
using System.Threading;
using PacsService.Properties;
using PacsWCFLib;
using System.Collections.Generic;
using Timer = System.Timers.Timer;
using System.Timers;
using Iberis.HL7.Net;

namespace PacsService
{
    public partial class PacsHL7Service : ServiceBase
    {
        private enum UpdatelEnum
        {
            UpdateLpuSettings,
            UpdateAreas,
            UpdateSchedule,
            UpdatePeople,
            UpdateArrival,
            UpdateReferral,
            UpdateCall,
            CleanBuffers,
            RestoreConnection,
            UpdateLpuNames,
            UpdatePrescs
        }

        private static readonly object InstanceLockObjectFed = new object();

        private static bool _isPause;

        private static readonly Dictionary<UpdatelEnum, Timer> Timers = new Dictionary<UpdatelEnum, Timer>
            {
                {UpdatelEnum.CleanBuffers, null},
                {UpdatelEnum.RestoreConnection, null},
                {UpdatelEnum.UpdateLpuSettings, null},
                {UpdatelEnum.UpdateAreas, null},
                {UpdatelEnum.UpdateArrival, null},
                {UpdatelEnum.UpdateCall, null},
                {UpdatelEnum.UpdatePeople, null},
                {UpdatelEnum.UpdateReferral, null},
                {UpdatelEnum.UpdateSchedule, null},
                {UpdatelEnum.UpdateLpuNames, null},
                {UpdatelEnum.UpdatePrescs, null}
            };

        //private static MainActivityRer _fedWCFLibClient;
        private readonly Thread _workedThread;
        
        private static int _threadCount;
        private static bool _isConnected;

        private static HL7Server m_Server = new HL7Server();

        #region Public members

        public PacsHL7Service()
        {
            Logger.Trace("PacsHL7Service");
            InitializeComponent();
            CanPauseAndContinue = true;

            InitHL7Server();

            _workedThread = new Thread(DoWorkFed);
            _workedThread.SetApartmentState(ApartmentState.STA);
        }

        protected override void OnStart(string[] args)
        {
            _isPause = false;
            Start();
        }

        protected override void OnStop()
        {
            Stop();
        }

        protected override void OnPause()
        {
            _isPause = true;
            Pause();
        }

        protected override void OnContinue()
        {
            _isPause = false;
            Continue();
        }

        #endregion



        private void Start()
        {
            Logger.Trace("SERVICE START");
            if (_workedThread != null)
                _workedThread.Start();

            // задержка для ослабления нагрузки
            Thread.Sleep(1000); 
        }

        private new void Stop()
        {
            Logger.Trace("SERVICE STOP");
            if (_workedThread != null)
                _workedThread.Abort();

            Logger.Trace("workedThread aborted");
        }

        private static void Pause()
        {
            try
            {
                Logger.Trace(" || SERVICE PAUSE ||");
                SwitchTimers(false);
            }
            catch (Exception ex)
            {
                Logger.Error(ex);
            }
        }


        private static void Continue()
        { 
            try
            {
                Logger.Trace(">>> SERVICE CONTINUE >>>");
                CheckConnectFed();
            }
            catch (Exception ex)
            {
                Logger.Error(ex);
            }
        }


        /// <summary>
        ///  делегат для добавления таймера
        /// </summary>
        private static Timer CreateTimer(ElapsedEventHandler elapsed, int timerInterval, string timerName)
        {
            var aTimer = new Timer
            {
                Enabled = false,
                Interval = 1000 * timerInterval,
                AutoReset = true
            };

            aTimer.Elapsed += elapsed;

            Logger.Trace(string.Format("{0} interval = {1} sec = {2} min = {3} hours",
                timerName, aTimer.Interval / 1000, aTimer.Interval / (1000 * 60), aTimer.Interval / (1000 * 60 * 60)));
            return aTimer;
        }

        /// <summary>
        /// лог след. обновления
        /// </summary>
        private static void LogNextTime(System.Timers.Timer aTimer, string aName)
        {
            if (aTimer.Enabled)
                Logger.Trace("== service '{0}' next start : {1}", aName, DateTime.Now.AddMilliseconds(aTimer.Interval).ToString("dd.MM.yyyy HH:mm:ss"));
        }

        private static void SwitchTimers(bool value)
        {
            foreach (var timer in Timers.Values)
            {
                timer.Enabled = value;
            }
        }

        private void InitHL7Server()
        {
            m_Server.ReceiveMessage += m_Server_ReceiveMessage;
            m_Server.Listen("", Settings.Default.HL7ServerPort, 1);
        }

        private static void m_Server_ReceiveMessage(object sender, HL7MessageEventArgs e)
        {
            /*var message = new Message();
            Console.WriteLine("Incoming message");
            Console.WriteLine("================");
            Console.WriteLine(e.Message.Replace("\r", "\r\n"));
            message.FromString(e.Message);
            var success = false;
            if (message["MSH"][9] == "ORM^O01")
                success = ProcessORM(message);
            message = message.CreateAck(success);
            e.AckMessage = message.ToString();
            Console.WriteLine("Ack");
            Console.WriteLine("===");
            Console.WriteLine(e.AckMessage.Replace("\r", "\r\n"));
            Console.WriteLine();*/
        }

        private void DoWorkFed()
        {
            _threadCount = 0;
            MainActivityRer.Initialize(Settings.Default.ConnectionStringDatabase);

            Logger.Trace("WCFLibClient.ConnectionString: <{0}>", SQL.ConnectionString);

            try
            {
                /*Timers[UpdatelEnum.UpdateLpuSettings] = CreateTimer(TimerElapsedUpdateLpuSettings, Settings.Default.TimerIntervalUpdateLpuSettings, "TimerIntervalUpdateLpuSettings");
                Timers[UpdatelEnum.UpdateAreas] = CreateTimer(TimerElapsedUpdateAreas, Settings.Default.TimerIntervalUpdateAreas, "TimerIntervalUpdateAreas");
                Timers[UpdatelEnum.UpdateSchedule] = CreateTimer(TimerElapsedUpdateSchedule, Settings.Default.TimerIntervalUpdateSchedule, "TimerIntervalUpdateSchedule");
                Timers[UpdatelEnum.UpdatePeople] = CreateTimer(TimerElapsedUpdatePeople, Settings.Default.TimerIntervalUpdatePeople, "TimerIntervalUpdatePeople");
                Timers[UpdatelEnum.UpdateArrival] = CreateTimer(TimerElapsedUpdateArrival, Settings.Default.TimerIntervalUpdateArrival, "TimerIntervalUpdateArrival");
                Timers[UpdatelEnum.UpdateReferral] = CreateTimer(TimerElapsedUpdateReferral, Settings.Default.TimerIntervalUpdateReferral, "TimerIntervalUpdateReferral");
                Timers[UpdatelEnum.UpdateCall] = CreateTimer(TimerElapsedUpdateCall, Settings.Default.TimerIntervalUpdateCall, "TimerIntervalUpdateCall");
                Timers[UpdatelEnum.CleanBuffers] = CreateTimer(TimerElapsedCleanBuffers, Settings.Default.TimerIntervalCleanBuffers, "TimerIntervalCleanBuffers");
                Timers[UpdatelEnum.RestoreConnection] = CreateTimer(TimerElapsedRestoreConnect, Settings.Default.TimerIntervalRestoreConnect, "TimerRestoreConnect");
                Timers[UpdatelEnum.UpdateLpuNames] = CreateTimer(TimerElapsedUpdateLpuNames, Settings.Default.TimerIntervalUpdateLpuNames, "TimerUpdateLpuNames");*/
                Timers[UpdatelEnum.UpdatePrescs] = CreateTimer(TimerElapsedUpdatePrescs, Settings.Default.TimerIntervalUpdatePrescs, "TimerUpdatePrescs");

                if (CheckConnectFed())
                {
                    SwitchTimers(false);

                    if (_isConnected)
                        UpdateFedBase(UpdatelEnum.UpdateSchedule);

                    if (!_isPause && _isConnected)
                    {
                        SwitchTimers(true);

                        foreach (var timer in Timers)
                        {
                            LogNextTime(timer.Value, timer.Key.ToString());
                        }
                    }
                }
            }

            catch (Exception ex)
            {
                Logger.Error(ex);
            }
        }


        private static bool CheckConnectFed()
        {
            var timerRestoreConnect = Timers[UpdatelEnum.RestoreConnection];

            timerRestoreConnect.Enabled = false;

            Logger.Trace("Проверка коннекта.");

            bool result;
            if (MainActivityRer.CheckConnectDataBase())
                result = MainActivityRer.CheckConnectSocket();
            else
                result = false;

            SwitchTimers(result);

            if (!result)
            {
                Logger.Trace("Коннекта пока нет. Попробуем позже через {0} сек...", timerRestoreConnect.Interval / 1000);
                timerRestoreConnect.Enabled = true;
            }
            else
            {
                Logger.Trace("КОННЕКТ ПОЯВИЛСЯ! :) Работаем в штатном режиме.");
            }
            _isConnected = result;
            return result;
        }

        private void TimerElapsedUpdatePrescs(object sender, ElapsedEventArgs e)
        {
            var timer = Timers[UpdatelEnum.UpdatePrescs];
            timer.Enabled = false;
            UpdateFedBase(UpdatelEnum.UpdatePrescs);
            if (!_isPause && _isConnected)
            {
                timer.Enabled = true;
                LogNextTime(Timers[UpdatelEnum.UpdatePrescs], UpdatelEnum.UpdatePrescs.ToString());
            }
        }
        /*
        private void TimerElapsedUpdateLpuSettings(object sender, ElapsedEventArgs e)
        {
            var timer = Timers[UpdatelEnum.UpdateLpuSettings];
            timer.Enabled = false;
            UpdateFedBase(UpdatelEnum.UpdateLpuSettings);
            if (!_isPause && _isConnected)
            {
                timer.Enabled = true;
                LogNextTime(Timers[UpdatelEnum.UpdateLpuSettings], UpdatelEnum.UpdateLpuSettings.ToString());
            }
        }

        private void TimerElapsedUpdateAreas(object sender, ElapsedEventArgs e)
        {
            var timer = Timers[UpdatelEnum.UpdateAreas];
            timer.Enabled = false;
            UpdateFedBase(UpdatelEnum.UpdateAreas);
            if (!_isPause && _isConnected)
            {
                timer.Enabled = true;
                LogNextTime(Timers[UpdatelEnum.UpdateAreas], UpdatelEnum.UpdateAreas.ToString());
            }
        }

        private void TimerElapsedUpdateSchedule(object sender, ElapsedEventArgs e)
        {
            var timer = Timers[UpdatelEnum.UpdateSchedule];
            timer.Enabled = false;
            UpdateFedBase(UpdatelEnum.UpdateSchedule);
            if (!_isPause && _isConnected)
            {
                timer.Enabled = true;
                LogNextTime(Timers[UpdatelEnum.UpdateSchedule], UpdatelEnum.UpdateSchedule.ToString());
            }
        }

        private void TimerElapsedUpdatePeople(object sender, ElapsedEventArgs e)
        {
            var timer = Timers[UpdatelEnum.UpdatePeople];
            timer.Enabled = false;
            UpdateFedBase(UpdatelEnum.UpdatePeople);
            if (!_isPause && _isConnected)
            {
                timer.Enabled = true;
                LogNextTime(Timers[UpdatelEnum.UpdatePeople], UpdatelEnum.UpdatePeople.ToString());
            }
        }

        private void TimerElapsedUpdateArrival(object sender, ElapsedEventArgs e)
        {
            var timer = Timers[UpdatelEnum.UpdateArrival];
            timer.Enabled = false;
            UpdateFedBase(UpdatelEnum.UpdateArrival);
            if (!_isPause && _isConnected)
            {
                timer.Enabled = true;
                LogNextTime(Timers[UpdatelEnum.UpdateArrival], UpdatelEnum.UpdateArrival.ToString());
            }
        }

        private void TimerElapsedUpdateReferral(object sender, ElapsedEventArgs e)
        {
            var timer = Timers[UpdatelEnum.UpdateReferral];
            timer.Enabled = false;
            UpdateFedBase(UpdatelEnum.UpdateReferral);
            if (!_isPause && _isConnected)
            {
                timer.Enabled = true;
                LogNextTime(Timers[UpdatelEnum.UpdateReferral], UpdatelEnum.UpdateReferral.ToString());
            }
        }

        private void TimerElapsedUpdateCall(object sender, ElapsedEventArgs e)
        {
            var timer = Timers[UpdatelEnum.UpdateCall];
            timer.Enabled = false;
            UpdateFedBase(UpdatelEnum.UpdateCall);
            if (!_isPause && _isConnected)
            {
                timer.Enabled = true;
                LogNextTime(Timers[UpdatelEnum.UpdateCall], UpdatelEnum.UpdateCall.ToString());
            }
        }

        private void TimerElapsedCleanBuffers(object sender, ElapsedEventArgs e)
        {
            var timer = Timers[UpdatelEnum.CleanBuffers];
            timer.Enabled = false;
            UpdateFedBase(UpdatelEnum.CleanBuffers);
            if (!_isPause && _isConnected)
            {
                timer.Enabled = true;
                LogNextTime(Timers[UpdatelEnum.CleanBuffers], UpdatelEnum.CleanBuffers.ToString());
            }
        }

        private void TimerElapsedUpdateLpuNames(object sender, ElapsedEventArgs e)
        {
            var timer = Timers[UpdatelEnum.UpdateLpuNames];
            timer.Enabled = false;
            UpdateFedBase(UpdatelEnum.UpdateLpuNames);
            if (!_isPause && _isConnected)
            {
                timer.Enabled = true;
                LogNextTime(Timers[UpdatelEnum.UpdateLpuNames], UpdatelEnum.UpdateLpuNames.ToString());
            }
        }

        private void TimerElapsedRestoreConnect(object sender, ElapsedEventArgs e)
        {
            CheckConnectFed();
        }
        */
        private static void UpdateFedBase(UpdatelEnum aCode)
        {
            // ограничиваем размер очереди
            if (_threadCount >= 10)
            {
                Logger.Trace("CAST AWAY code: {1} (current count = {0})", _threadCount, aCode);
                return;
            }

            //кол ожидающих в очереди
            _threadCount++;
            Logger.Trace("Thread count = {0} ++ (code: {1})", _threadCount, aCode);

            // блокируем параллелльное вхождение
            lock (InstanceLockObjectFed)
            {
                bool res = false;
                try
                {
                    var timeBegin = DataRepository.GetCurrentTimestamp(); //запускаем все проливки в одно время

                    Logger.Trace("Service: {0}; datetime_on: {1}", aCode, timeBegin.ToString());
                    switch (aCode)
                    {

                        case UpdatelEnum.UpdatePrescs:
                            MainActivityRer.UpdatePrescs(Settings.Default.ThreadCount, timeBegin);
                            res = true;
                            break;
/*
                        case UpdatelEnum.UpdateLpuSettings:
                            //MainActivityRer.UpdateLpuSettings(Settings.Default.ThreadCount);
                            res = true;
                            break;

                        case UpdatelEnum.UpdateAreas:
                            //MainActivityRer.UploadAreas(Settings.Default.ThreadCount);
                            res = true;
                            break;

                        case UpdatelEnum.UpdateArrival:
                            //MainActivityRer.UploadArrival(true, Settings.Default.ThreadCount);
                            res = true;
                            break;

                        case UpdatelEnum.UpdateCall:
                            //MainActivityRer.UploadCall(Settings.Default.ThreadCount);
                            res = true;
                            break;

                        case UpdatelEnum.UpdatePeople:
                            //MainActivityRer.UploadPeople(true, Settings.Default.ThreadCount);
                            res = true;
                            break;

                        case UpdatelEnum.UpdateReferral:
                            //MainActivityRer.UploadReferral(Settings.Default.ThreadCount);
                            res = true;
                            break;

                        case UpdatelEnum.UpdateSchedule:
                            //MainActivityRer.UpdateDoctors(Settings.Default.ThreadCount, timeBegin);
                            //MainActivityRer.UploadSchedule(true, Settings.Default.ThreadCount, timeBegin);
                            //MainActivityRer.UploadPeople(true, Settings.Default.ThreadCount, timeBegin);
                            //MainActivityRer.UploadArrival(true, Settings.Default.ThreadCount, timeBegin);
                            res = true;
                            break;

                        case UpdatelEnum.UpdateLpuNames:
                            //MainActivityRer.UpdateLpuNames();
                            res = true;
                            break;

                        case UpdatelEnum.CleanBuffers:
                            //MainActivityRer.CleanBuffers();
                            res = true;
                            break;*/
                    }
                }
                catch (Exception ex)
                {
                    Logger.Error(ex);
                    res = false;
                }
                finally
                {
                    _threadCount--;
                    Logger.Trace("Service: {0} - {1}.   Thread count = {2} --", aCode, res, _threadCount);

                    if (!res)
                        CheckConnectFed();
                }
            }
        }
    }
}
