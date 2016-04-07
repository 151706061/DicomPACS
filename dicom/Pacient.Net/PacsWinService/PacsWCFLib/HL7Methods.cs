using System;
using Iberis.HL7;

namespace PacsWCFLib
{
    public class HL7Methods
    {
        public static Message CreateMessage(Presc presc)
        {
            var message = new Message();
            message.Segments.Add(new Segment(message, "MSH"));
            message.Segments.Add(new Segment(message, "PID"));
            message.Segments.Add(new Segment(message, "PV1"));
            message.Segments.Add(new Segment(message, "ORC"));
            message.Segments.Add(new Segment(message, "OBR"));
            Initialize(message, "ORM^O01");
            FillORM(message, presc);
            return message;
        }

        private static void Initialize(Message message, string type)
        {
            message["MSH"][3] = "MedotradeHIS";
            message["MSH"][4] = "HL7Broker";
            message["MSH"][5] = "FutuRIS";
            message["MSH"][6] = "HL7Service";
            message["MSH"][7] = StringConverter.FromDateTime(DateTime.Now);
            message["MSH"][9] = type;
            message["MSH"][10] = Guid.NewGuid().ToString("N").Remove(20).ToUpper();
            message["MSH"][11] = "P";
            message["MSH"][12] = "2.3";
        }

        private static void FillORM(Message message, Presc presc)
        {
            message["PID"][3] = "1234";                                                     // Patient ID
            message["PID"][5, 1] = "Пациентов";                                             // Patient name
            message["PID"][5, 2] = "Иван";
            message["PID"][7] = StringConverter.FromDateTime(new DateTime(2000, 1, 25));    // Patient DOB
            message["PID"][8] = "M";                                                        // Patient sex

            message["PV1"][8, 2] = "Лекарь";                                                // Physician name
            message["PV1"][8, 3] = "Николай";

            message["ORC"][1] = "NW";                                                       // New order
            message["ORC"][5] = "SC";                                                       // Status changed

            message["OBR"][4] = "Общее CT-исследование";                                    // Study description
            message["OBR"][7] = StringConverter.FromDateTime(DateTime.Today.AddHours(8));   // Study date/time
            message["OBR"][18] = "78482374";                                                // Order ID
            message["OBR"][24] = "CT";                                                      // Modality
        }
    }
}
