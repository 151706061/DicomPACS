using System;
using log4net;
using log4net.Config;

namespace PacsWCFLib
{
    public class Logger
    {
        private readonly static ILog _logger;
        private Logger()
        { }

        static Logger()
        {
            var configFile = new System.IO.FileInfo(AppDomain.CurrentDomain.BaseDirectory + "/log.config.xml");
            if (configFile.Exists)
            {
                try
                {
                    XmlConfigurator.ConfigureAndWatch(configFile);
                }
                catch
                {
                    //Конфигурация log4net не прошла
                }
                _logger = LogManager.GetLogger(typeof(Logger));
            }
        }

        public static void Trace(string traceMessage, params object[] par)
        {
            try
            {
                if (_logger != null)
                    _logger.InfoFormat(traceMessage, par);
            }
            catch { }
        }

        public static void Error(string errorMessage, params object[] par)
        {
            try
            {
                if (_logger != null)
                    _logger.ErrorFormat(errorMessage, par);
            }
            catch { }
        }

        public static void Error(Exception e)
        {
            try
            {
                if (_logger != null)
                    _logger.Error(e);
            }
            catch { }
        }

        public static void TraceSoap(string traceMessage, params object[] par)
        {
            try
            {
                if (_logger != null)
                    _logger.InfoFormat(traceMessage, par);
            }
            catch { }
        }

        public static void ErrorSoap(string errorMessage, params object[] par)
        {
            try
            {
                if (_logger != null)
                    _logger.ErrorFormat(errorMessage, par);
            }
            catch { }
        }

        public static void ErrorSoap(Exception e)
        {
            try
            {
                if (_logger != null)
                    _logger.Error(e);
            }
            catch { }
        }
    }
}
