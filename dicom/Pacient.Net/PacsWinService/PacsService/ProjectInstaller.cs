using System;
using System.Collections;
using System.ComponentModel;
using System.Configuration.Install;
using System.Reflection;
using System.Threading;
using System.IO;
using System.Xml;
using PacsWCFLib;

namespace FederalScheduleService
{
    [RunInstaller(true)]
    public partial class ProjectInstaller : Installer
    {
        class CommandParam
        {
            public string CommandString;
            public int TimeWait;
        }

        private string _name;
        private string _fullname;

        public ProjectInstaller()
        {
            InitializeComponent();
        }

        public override void Commit(IDictionary savedState)
        {
            Logger.Trace("Commit");
            base.Commit(savedState);
            DoWork();
            Logger.Trace("");
            Logger.Trace("Install Done");
        }

        private string ShortcutName
        {
            get
            {
                if (_name == null)
                {
                    Assembly myAssembly = Assembly.GetExecutingAssembly();
                    try
                    {
                        object titleAttribute = myAssembly.GetCustomAttributes(typeof(AssemblyTitleAttribute), false)[0];
                        _name = ((AssemblyTitleAttribute)titleAttribute).Title;
                    }
                    catch (Exception e)
                    {
                        Logger.Error(e);
                    }

                    if ((_name == null) || (_name.Trim() == string.Empty))
                        _name = myAssembly.GetName().Name;
                }
                return _name;
            }
        }


        private string FullName
        {
            get
            {
                if (_fullname == null)
                {
                    Assembly myAssembly = Assembly.GetExecutingAssembly();
                    try
                    {
                        _fullname = myAssembly.Location;
                    }
                    catch (Exception e)
                    {
                        Logger.Error(e);
                    }
                }
                return _fullname;
            }
        }

        public override void Install(IDictionary savedState)
        {
            try
            {
                base.Install(savedState);
                Logger.Trace("SzRer2Service Install!");
            }
            catch (Exception e)
            {
                Logger.Error(e);
            }
        }

        public void DoWork()
        {
            try
            {
                // The installer will pass the ALLUSERS, START_SERVICE and QUICKLAUNCH_SHORTCUT   
                // parameters. These have been set to the values of radio buttons and checkboxes from the
                // MSI user interface.
                // ALLUSERS is set according to whether the user chooses to install for all users (="1") 
                // or just for themselves (="").
                // If the user checked the checkbox to install one of the shortcuts, then the corresponding 
                // parameter value is "1".  If the user did not check the checkbox to install one of the 
                // desktop shortcut, then the corresponding parameter value is an empty string.

                // First make sure the parameters have been provided.

                EDIT_SETTINGS_PARAM();

                SHOW_SETTINGS_PARAM();

                START_SERVICE_PARAM();

            }
            catch (Exception e)
            {
                Logger.Error(e);
            }
        }


        public void SHOW_SETTINGS_PARAM()
        {
            const string SHOW_SETTINGS_PARAM = "SHOW_SETTINGS";

            if (!Context.Parameters.ContainsKey(SHOW_SETTINGS_PARAM))
                Logger.Error(null, string.Format("The {0} parameter has not been provided for the {1} class.", SHOW_SETTINGS_PARAM, GetType()));

            else
            {
                bool installShowSettings = Context.Parameters[SHOW_SETTINGS_PARAM] != string.Empty;

                Logger.Trace("installShowSettings {0} ", installShowSettings);

                if (installShowSettings)
                {
                    Logger.Trace("installShowSettings...");
                    var aCommand1 = new CommandParam
                    {
                        CommandString = string.Format(@"notepad.exe ""{0}.config"" || ""{0}.config""", FullName),
                        TimeWait = 0
                    };
                    Logger.Trace("installShowSettings...{0} sec.", aCommand1.TimeWait);

                    ExecuteCommandAsync(aCommand1);
                }
            }
        }

        public void START_SERVICE_PARAM()
        {
            const string START_SERVICE_PARAM = "START_SERVICE";

            if (!Context.Parameters.ContainsKey(START_SERVICE_PARAM))
                Logger.Error(null, string.Format("The {0} parameter has not been provided for the {1} class.", START_SERVICE_PARAM, GetType()));

            else
            {
                bool installStartService = Context.Parameters[START_SERVICE_PARAM] != string.Empty;

                Logger.Trace("installStartService {0} ", installStartService);

                if (installStartService)
                {
                    var aCommand2 = new CommandParam
                    {
                        CommandString = string.Format("net start {0}", ShortcutName),
                        TimeWait = 10
                    };
                    Logger.Trace("installStartService...{0} sec.", aCommand2.TimeWait);

                    ExecuteCommandAsync(aCommand2);
                }
            }
        }

        /// <summary>
        /// см. также Custom Action  - Primary output from FederalScheduleService (Active)
        /// нужно добавить:
        /// /START_SERVICE=[START_SERVICE] /SHOW_SETTINGS=[SHOW_SETTINGS] /EDITA1="[EDITA1]" /EDITA2="[EDITA2]" /EDITA3="[EDITA3]" /EDITA4="[EDITA4]" /EDITB1="[EDITB1]" /BUTTON2="[BUTTON2]"
        /// </summary>
        public void EDIT_SETTINGS_PARAM()
        {

            const string BUTTON2_SETTINGS_PARAM = "BUTTON2";
            const string EDITA1_SETTINGS_PARAM = "EDITA1";
            const string EDITA2_SETTINGS_PARAM = "EDITA2";
            const string EDITA3_SETTINGS_PARAM = "EDITA3";
            const string EDITA4_SETTINGS_PARAM = "EDITA4";
            const string EDITB1_SETTINGS_PARAM = "EDITB1";
            const string EDITB2_SETTINGS_PARAM = "EDITB2";
            const string EDITB3_SETTINGS_PARAM = "EDITB3";
            const string EDITB4_SETTINGS_PARAM = "EDITB4";
            const string FEDERALSERVICE_SETTINGS_PARAM = "FEDERALSERVICE";
            const string REGIONALSERVICE_SETTINGS_PARAM = "REGIONALSERVICE";



            // EDITA1_SETTINGS_PARAM
            string parameterValue = string.Empty;

            // делегат для добавления параметров
            var setParameter = new Action<string, string, string, bool>((aParamName, aParamCode, aDivider, aCheckEmpty) =>
            {
                if (!Context.Parameters.ContainsKey(aParamName))
                    Logger.Error(null, string.Format("The {0} parameter has not been provided for the {1} class.", aParamName, GetType()));
                else
                {
                    string param = Context.Parameters[aParamName];

                    if (!aCheckEmpty || (aCheckEmpty && !string.IsNullOrEmpty(param)))
                    {
                        parameterValue += string.Format("{0}{1}{2}", aParamCode, param, aDivider);
                        Logger.Trace("{0}: <{1}> ", aParamName, param);
                    }

                }
            });

            // делегат для изменениея значения параметров
            var setParameterValue = new Action<string, string>((aParamName, aParamValue) =>
            {
                String fileline;
                string filename = string.Format("{0}.config", FullName);
                Logger.Trace("Save parameter to file config: {0}", filename);
                Logger.Trace("parameter name: {0}", aParamName);
                Logger.Trace("parameter value: {0}", aParamValue);

                var xmlDoc = new XmlDocument();
                XmlElement aElement = xmlDoc.CreateElement("Param");

                using (var sr = new StreamReader(filename)) { fileline = sr.ReadToEnd(); }

                aElement.InnerXml = fileline;

                foreach (XmlNode item in aElement.ChildNodes)
                {
                    string res = ParseXML(item, aParamName, aParamValue);
                    if (!string.IsNullOrEmpty(res))
                        break;
                }

                fileline = aElement.InnerXml;

                if (!string.IsNullOrEmpty(fileline))
                    using (var outfile = new StreamWriter(filename)) { outfile.Write(fileline); }

            });


            parameterValue = string.Empty;
            setParameter(BUTTON2_SETTINGS_PARAM, "", "", false);

            if (parameterValue == "1")
            {// Oracle
                parameterValue = string.Empty;
                setParameter(EDITA1_SETTINGS_PARAM, "Provider=Oracle; data source=", "; port=1521;", false);
                setParameter(EDITA2_SETTINGS_PARAM, "SID=", ";", false);
                setParameter(EDITA3_SETTINGS_PARAM, "user=", ";", false);
                setParameter(EDITA4_SETTINGS_PARAM, "password=", ";", false);
                parameterValue += " Unicode=true; direct=true";
            }
            else
            {// PostgreSQL
                parameterValue = string.Empty;
                setParameter(EDITA1_SETTINGS_PARAM, "Provider=PostgreSQL; host=", "; port=5432;", false);
                setParameter(EDITA2_SETTINGS_PARAM, "database=", ";", false);
                setParameter(EDITA3_SETTINGS_PARAM, "user=", ";", false);
                setParameter(EDITA4_SETTINGS_PARAM, "password=", ";", false);
                parameterValue += " Unicode=true";
            }

            setParameterValue("ConnectionStringDatabase", parameterValue);

            parameterValue = string.Empty;
            setParameter(EDITB1_SETTINGS_PARAM, "", "", false);
            setParameterValue("ConnectionSOAPFederalAddress", parameterValue);

            parameterValue = string.Empty;
            setParameter(EDITB2_SETTINGS_PARAM, "", "", false);
            setParameterValue("ConnectionSOAPRegionalAddress", parameterValue);


            // пример ProxyAddress:  http://192.168.1.196:808/
            parameterValue = string.Empty;
            setParameter(EDITB3_SETTINGS_PARAM.Replace(@"http://", ""), "http://", "", true);
            setParameter(EDITB4_SETTINGS_PARAM, ":", "/", true);

            setParameterValue("ProxyAddress", parameterValue);


            parameterValue = string.Empty;
            setParameter(FEDERALSERVICE_SETTINGS_PARAM, "", "", false);
            if (parameterValue == "1")
                setParameterValue("FederalService", "True");
            else
                setParameterValue("FederalService", "False");


            parameterValue = string.Empty;
            setParameter(REGIONALSERVICE_SETTINGS_PARAM, "", "", false);
            if (parameterValue == "1")
                setParameterValue("RegionService", "True");
            else
                setParameterValue("RegionService", "False");

        }

        public string ParseXML(XmlNode aElement, string aName, string aValue)
        {
            string res = string.Empty;
            if (aElement != null)
                foreach (XmlNode item in aElement.ChildNodes)
                {
                    if (item.Attributes != null)
                    {
                        foreach (XmlAttribute attr in item.Attributes)
                        {
                            if (attr.Value.Equals(aName))
                            {
                                res = item.InnerText;
                                if (!string.IsNullOrEmpty(aValue))
                                    item.InnerXml = string.Format("\r\n<value>{0}</value>\r\n", aValue);
                                return res;
                            }
                        }
                    }

                    res = ParseXML(item, aName, aValue);

                    if (!string.IsNullOrEmpty(res))
                        return res;
                }

            return res;
        }


        public override void Uninstall(IDictionary savedState)
        {

            var aCommand1 = new CommandParam
            {
                CommandString = string.Format(@"rename ""{0}.config"" ""{1}_{2}.config""",
                        FullName, Path.GetFileName(FullName), DateTime.Now.ToString("yyyyMMdd_HHmm")),
                TimeWait = 0
            };
            ExecuteCommandAsync(aCommand1);

            base.Uninstall(savedState);
            Logger.Trace("FederalScheduleService Uninstall");
        }



        public void ExecuteCommandSync(object command)
        {
            try
            {
                var aCommand = ((CommandParam)command);
                aCommand.CommandString = string.Format("/c ping -n {0} 127.0.0.1 > NUL & {1}", aCommand.TimeWait, aCommand.CommandString);

                Logger.Trace("ExecuteCommand: {0}", aCommand.CommandString);

                // create the ProcessStartInfo using "cmd" as the program to be run,
                // and "/c " as the parameters.
                // Incidentally, /c tells cmd that we want it to execute the command that follows,
                // and then exit.
                var procStartInfo = new System.Diagnostics.ProcessStartInfo("cmd", aCommand.CommandString)
                {
                    /* The following commands are needed to redirect the standard output.*/
                    /* This means that it will be redirected to the Process.StandardOutput StreamReader.*/
                    RedirectStandardOutput = true,
                    UseShellExecute = false,
                    /* Do not create the black window.*/
                    CreateNoWindow = true
                };
                // Now we create a process, assign its ProcessStartInfo and start it
                using (var proc = new System.Diagnostics.Process { StartInfo = procStartInfo })
                {
                    proc.Start();
                    // Get the output into a string
                    string result = proc.StandardOutput.ReadToEnd();

                    // Display the command output.
                    Logger.Trace(string.Format("result={0}", result));
                }
            }
            catch (Exception e)
            {
                Logger.Error(e);
            }

        }

        /// <summary>
        /// Execute the command Asynchronously.
        /// </summary>
        /// <param name="command">string command.</param>
        public void ExecuteCommandAsync(object command)
        {
            try
            {
                //Asynchronously start the Thread to process the Execute command request.
                //Thread objThread = new Thread(new ParameterizedThreadStart(ExecuteCommandSync))
                var objThread = new Thread(ExecuteCommandSync)
                {
                    /*Make the thread as background thread.*/
                    IsBackground = true,
                    /*Set the Priority of the thread.*/
                    Priority = ThreadPriority.Normal
                };
                //Start the thread.
                objThread.Start(command);
            }
            catch (ThreadStartException objException)
            {
                Logger.Error(objException);
            }
            catch (ThreadAbortException objException)
            {
                Logger.Error(objException);
            }
            catch (Exception objException)
            {
                Logger.Error(objException);
            }
        }
    }
}
