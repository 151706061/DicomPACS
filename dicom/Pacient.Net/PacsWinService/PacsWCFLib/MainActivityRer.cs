using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.ServiceModel;
using System.Threading;
using System.Xml;
using System.Runtime.Serialization;
using System.Collections;
using Iberis.HL7;

namespace PacsWCFLib
{
    public class MainActivityRer
    {       
        private static int _lpuToUpdateScheduleCount;

        #region Общие функции

        public void SetConnectionString(string aValue)
        {
            SQL.ConnectionString = aValue;
            Logger.Trace("SetConnectionString: {0}", aValue);
        }

        public MainActivityRer(string dbConnectionString = "", string soapConnectionString = "", string aProxyAddress = "")
        {
            if (!string.IsNullOrEmpty(dbConnectionString))
                SQL.ConnectionString = dbConnectionString;

            Logger.Trace("DBConnectionString: {0}", SQL.ConnectionString);
        }

        public static void Initialize(string dbConnectionString = "")
        {
            Logger.Trace("Initialize");

            if (!string.IsNullOrEmpty(dbConnectionString))
                SQL.ConnectionString = dbConnectionString;

            Logger.Trace("DBConnectionString: {0}", SQL.ConnectionString);
        }

        public static bool CheckConnectSocket(string host = null, int port = 0)
        {
            try
            {
                if (PacsInteraction.CheckConnect(host, port))
                {
                    Logger.Trace("CheckConnectHL7Socket - ok");
                    return true;
                }
            }
            catch (Exception e)
            {
                Logger.Error(e);
            }
            return false;
        }

        public static bool CheckConnectDataBase()
        {
            string mess = string.Empty;
            try
            {
                SQL.CheckConnectDataBase();
            }
            catch (Exception ex)
            {
                Logger.Error(ex);
                mess = ex.Message;
            }

            if (string.IsNullOrEmpty(mess))
            {
                Logger.Trace("CheckConnectDataBase - ok");
                return true;
            }
            else
            {
                Logger.Error(null, "CheckConnectDataBase: {0}", mess);
                return false;
            }
        }

        private static void SetMaxThreadCount(int threadCount)
        {
            bool threadCountSetSuccesfully;     //пока макс число потоков не будет установлено успешно, увеличиваем threadCount и пробуем установить еще раз
            do
            {
                threadCountSetSuccesfully = ThreadPool.SetMaxThreads(threadCount, threadCount);
                Logger.Trace("SetMaxThreads={0}, Succeeded={1}", threadCount, threadCountSetSuccesfully);
                threadCount++;
            } while (!threadCountSetSuccesfully);
        }

        public static void CleanBuffers()
        {
            try
            {
                //DataRepository.CleanBuffers();
            }
            catch { }
        }


        #endregion
       
        #region Назначения на инструментальные исследования
        public static void UpdatePrescs(int threadCount, DateTime datetime_on)
        {
            Logger.Trace("UpdatePrescs - Begin. ThreadCount={0}", threadCount);
            var timeBegin = DateTime.Now;

            var lpuList = DataRepository.GetLpuList();

            _lpuToUpdateScheduleCount = lpuList.Count;
            var markerEvent = _lpuToUpdateScheduleCount > 0 ? new AutoResetEvent(false) : new AutoResetEvent(true);

            SetMaxThreadCount(threadCount);

            for (int i = 0; i < lpuList.Count; i++)
            {
                var lpuNum = i + 1;
                Lpu lpuCopy = lpuList[i];

                //ThreadPool.QueueUserWorkItem(callback => UpdateDoctorsForLpu(lpuCopy, markerEvent, lpuNum, lpuList.Count));
                UpdatePrescsForLpu(lpuCopy, markerEvent, datetime_on, lpuNum, lpuList.Count);
            }

            markerEvent.WaitOne();
            Logger.Trace("UpdatePrescs - ok. Duration: {0} minutes", (DateTime.Now - timeBegin).TotalMinutes);
        }

        public static void UpdatePrescsForLpu(Lpu lpu, AutoResetEvent markerEvent, DateTime datetime_on, int lpuNum, int lpuListCount)
        {
            var timeBegin = DateTime.Now;

            try
            {
                Logger.Trace("UpdatePrescsForLpu - Begin.");

                var prescList = DataRepository.GetPrescListToUpdate(lpu, datetime_on);

                foreach (var presc in prescList)
                {
                    
                    
                    /*if (doctor.OidTheir > 0)
                    {
                        RerReference.doctor doctor_new = Rer2Interaction.UpdateDoctor(doctor);
                        if (doctor_new != null)
                        {
                            DataRepository.UpdateBuffer(lpu, datetime_on, actions, doctor.BufferOids);
                        }
                        else
                        {
                            Logger.Trace("Rer2Interaction.UpdateDoctor - error update doctor, doctor_new is null, doctor: {0}", doctor);
                        }
                    }
                    else
                    {
                        RerReference.doctor doctor_new = Rer2Interaction.CreateDoctor(doctor);
                        if (doctor_new != null)
                        {
                            if (DataRepository.CreateDoctor(doctor, doctor_new))
                            {
                                DataRepository.UpdateBuffer(lpu, datetime_on, actions, doctor.BufferOids);
                            }
                            else
                            {
                                Logger.Trace("CreateDoctor - error create match for doctor: {0}", String.Format("{0} {1} {2}", doctor_new.surname, doctor_new.name, doctor_new.patronymic));
                            }
                        }
                        else
                        {
                            Logger.Trace("Rer2Interaction.CreateDoctor - error create doctor, doctor_new id null, doctor: {0}", doctor);
                        }
                    }*/
                }
            }
            catch (Exception e)
            {
                Logger.Error(e);
            }
            finally
            {
                Logger.Trace("UpdatePrescsForLpu - ok. Duration: {0} minutes", (DateTime.Now - timeBegin).TotalMinutes);

                if (Interlocked.Decrement(ref _lpuToUpdateScheduleCount) == 0)
                {
                    markerEvent.Set();
                }
            }
        }

        #endregion
        
       
    }
}
