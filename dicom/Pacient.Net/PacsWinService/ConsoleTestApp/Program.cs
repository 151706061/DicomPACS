using ConsoleApplication1.Properties;
using PacsWCFLib;
using System.Configuration;
using System;


namespace ConsoleApplication1
{
    class Program
    {
        static void Main(string[] args)
        {
            SQL.ConnectionString = ConfigurationManager.AppSettings["ConsoleConnectionString"].ToString(); //"Provider=PostgreSQL; Unicode=true; host=192.168.1.11; Database=webtalonXtula; user=asu; password=asu";
            var threadCount = Settings.Default.ThreadCount;

           var lpu = "2370b2cd-c7ec-432b-aed5-93e074ee45a9";

            var datetimebegin = DateTime.Now;

            MainActivityRer.UpdatePrescs(1, datetimebegin);
        }
    }
}