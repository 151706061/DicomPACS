using System;
using System.Collections.Generic;
using System.Text;
using System.Xml;

namespace PacsWCFLib
{
    public class Presc
    {
        public string Oid { get; set; }
        public long OidTheir { get; set; }
        public string Surname { get; set; }
        public string Name { get; set; }
        public string Patronymic { get; set; }
        public Lpu Lpu { get; set; }
        public List<long> SpecTheirList { get; set; }
        public List<long> PostTheirList { get; set; }
        public string Snils { get; set; }
        public List<String> BufferOids { get; set; } 


        public override string ToString()
        {
            var stringSpecTheirList = new StringBuilder("");
            if (SpecTheirList != null)
            {
                for (int i = 0; i < SpecTheirList.Count; i++)
                {
                    if (i != 0)
                    {
                        stringSpecTheirList.Append(",");
                    }
                    stringSpecTheirList.AppendFormat("[{0}]", SpecTheirList[i]);
                }
            }

            var stringPostTheirList = new StringBuilder("");
            if (PostTheirList != null)
            {
                for (int i = 0; i < PostTheirList.Count; i++)
                {
                    if (i != 0)
                    {
                        stringPostTheirList.Append(",");
                    }
                    stringPostTheirList.AppendFormat("[{0}]", PostTheirList[i]);
                }
            }

            var stringBufferOids = new StringBuilder("");
            if (BufferOids != null)
            {
                for (int i = 0; i < BufferOids.Count; i++)
                {
                    if (i != 0)
                    {
                        stringBufferOids.Append(",");
                    }
                    stringBufferOids.AppendFormat("[{0}]", BufferOids[i]);
                }
            }

            return String.Format("Lpu=[{0}], Oid=[{1}], OidTheir=[{2}], Name=[{3} {4} {5}], SpecTheirList=[{6}], PostTheirList=[{7}], BufferOids=[{8}]",
                                 Lpu, Oid, OidTheir, Surname, Name, Patronymic, stringSpecTheirList, stringPostTheirList, stringBufferOids);
        }


        public string GenerateXML()
        {
            var xmlDoc = new XmlDocument();

            // делегат для добавления параметров
            var aNodeAdd = new Action<XmlElement, string, string>((rootElement, name, value) =>
            {
                XmlElement item = xmlDoc.CreateElement(name);
                if (!string.IsNullOrEmpty(value))
                    item.InnerText = value;
                rootElement.AppendChild(item);
            });

            // добавление параметров
            XmlElement doctorNode = xmlDoc.CreateElement("doctor");
            xmlDoc.AppendChild(doctorNode);

            if (!String.IsNullOrEmpty(OidTheir.ToString()))
            {
                aNodeAdd(doctorNode, "id", OidTheir.ToString());
            }

            aNodeAdd(doctorNode, "snils", Snils);
            aNodeAdd(doctorNode, "surname", Surname);
            aNodeAdd(doctorNode, "name", Name);
            aNodeAdd(doctorNode, "patronymic", Patronymic);

            XmlElement specIdsNode = xmlDoc.CreateElement("spec_ids");
            doctorNode.AppendChild(specIdsNode);

            foreach (var spec in SpecTheirList)
            {
                aNodeAdd(specIdsNode, "spec_id", spec.ToString());
            }

            XmlElement postIdsNode = xmlDoc.CreateElement("post_ids");
            doctorNode.AppendChild(postIdsNode);

            foreach (var post in PostTheirList)
            {
                aNodeAdd(postIdsNode, "post_id", post.ToString());
            }

            return xmlDoc.InnerXml;
        }
    }
}
