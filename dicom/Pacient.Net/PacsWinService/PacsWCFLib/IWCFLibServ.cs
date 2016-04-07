using System.Collections.Generic;
using System.ServiceModel;

namespace FSWCFLib
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "IService1" in both code and config file together.
    [ServiceContract]
    public interface IWCFLibServ
    {
        string GetCurrentPlace(string token, bool prefix = false);
        bool UpdatePlaceByTokens(bool prefix = false);

        [OperationContract]
        bool UpdateGuides();

        [OperationContract]
        bool UpdateSchedules(bool onlyedited , List<string> LPUList, bool onlyinsite );
        
        bool UpdateSchedulesPeople(List<string> LPUList = null);

        [OperationContract]
        //bool DeleteSchedules(out int updatedcount);
        bool DeleteSchedules(List<string> updatedLPU);

        //[OperationContract]
        //bool UpdateLastChanges();

        [OperationContract]
        void SetConnectionString(string aValue);
        [OperationContract]
        string GetConnectionString();

        string GetConnectionSocketString(bool withProxy = false);

        bool CheckConnectSocket();

        bool CheckConnectDataBase();

        void ClearOldLogs(int DaysOlder);
    }
}
