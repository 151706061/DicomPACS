using System.ServiceProcess;

namespace PacsService
{
    static class Program
    {
        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        static void Main()
        {
            var servicesToRun = new ServiceBase[] 
                { 
                    new PacsHL7Service() 
                };

            ServiceBase.Run(servicesToRun);
        }
    }
}
