using System;
using System.IO;
using System.Runtime.Serialization;
using System.Xml;
using Iberis.HL7;
using Iberis.HL7.Net;

namespace PacsWCFLib
{
    class PacsInteraction
    {
        public static string endpointHostDefault = "localhost";
        public static int endpointPortDefault = 8003;

        #region Общие
        public static HostPort GetHostPortForLpu(string lpu, string host = null, int port = 0)
        {
            if (string.IsNullOrEmpty(host) || (port <= 0))
            {
                host = endpointHostDefault;
                port = endpointPortDefault;

                string hostport  = SQL.GetHostPortByLpu(lpu);

                string[] hostandport = hostport.Split(new string[] {":"}, StringSplitOptions.RemoveEmptyEntries);

                if (hostandport.Length > 0)
                {
                    if (!String.IsNullOrEmpty(hostandport[0]))
                    {
                        host = hostandport[0];
                    }
                }

                if (hostandport.Length > 1)
                {
                    int portNum;
                    if (Int32.TryParse(hostandport[1], out portNum))
                    {
                        port = portNum;
                    }
                }
            }

            return new HostPort()
            {
                Host = host,
                Port = port
            };
        }

        public static bool CheckConnect(string host = null, int port = 0)
        {
            if (string.IsNullOrEmpty(host) || (port <= 0))
            {
                host = endpointHostDefault;
                port = endpointPortDefault;
            }

            string session = Guid.NewGuid().ToString();
            try
            {
                using (var client = new HL7Client())
                {
                    client.Connect(host, port);
                    client.Close();
                    return true;
                }
            }
            catch (Exception e)
            {
                Logger.ErrorSoap(e);
                SQL.DoLog("CheckConnect", null, null, session, e.Message);
            }

            return false;
        }

        public static string SerializeObject<T>(T objectToSerialize)
        {
            using (var output = new StringWriter())
            using (var writer = new XmlTextWriter(output) { Formatting = Formatting.Indented })
            {
                new DataContractSerializer(typeof(T)).WriteObject(writer, objectToSerialize);
                return output.GetStringBuilder().ToString();
            }
        }

        #endregion

        public static bool SendOrder(Presc presc)
        {
            string session = Guid.NewGuid().ToString();
            SQL.DoLog("SendOrder", presc.Lpu.Oid, presc.Oid.ToString(), session, presc.ToString());
            Logger.Trace("SendOrder: Presc=[{0}]", presc);

            try
            {
                Message message = HL7Methods.CreateMessage(presc);
                HostPort hp = GetHostPortForLpu(presc.Lpu.Oid);

                using (var client = new HL7Client())
                {
                    client.Connect(hp.Host, hp.Port);
                    var ackMessage = client.SendMessage(message.ToString());

                    return true;
                }
            }
            catch (Exception e)
            {
                Logger.ErrorSoap(e);
                SQL.DoLog("SendOrder", presc.Lpu.Oid, presc.Oid.ToString(), session, e.Message);
            }

            return false;
        }

    }
}