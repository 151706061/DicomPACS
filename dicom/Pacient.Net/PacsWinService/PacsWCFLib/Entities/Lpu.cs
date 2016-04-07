using System;

namespace PacsWCFLib
{
    public class Lpu
    {
        public string Oid { get; set; }
        public string OidTheir { get; set; }
        public string Token { get; set; }
        public string Name { get; set; }
        public string NameTheir { get; set; }

        public string ComplexName()
        {
            return string.Format("{0} ({1})", Name, NameTheir);
        }

        public override string ToString()
        {
            return String.Format("Oid=[{0}] [{1}], Token=[{2}] CompName=[{3}]", 
                Oid, OidTheir, Token, ComplexName());
        }
    }
}
