using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;

namespace PacsWCFLib
{
    public class DataRepository
    {
        #region Справочники и их соответствия

        public static DateTime GetCurrentTimestamp()
        {
            return SQL.GetCurrentTimestamp();
        }

        public static string GetTableOidBySyn(string company_syn, string table_syn)
        {
            return SQL.GetTableOidBySyn(company_syn, table_syn);
        }

        public static string SetMatchEown(string table_their, string table_our, string code_their, string code_our, string value_our)
        {
            return SQL.SetMatchEown(table_their, table_our, code_their, code_our, value_our);
        }

        #endregion

        public static List<Lpu> GetLpuList()
        {
            Logger.Trace("GetLpuListFS");

            DataSet dataSet = SQL.GetLpuListFS();

            var lpuList = (from DataRow row in dataSet.Tables[0].Rows
                           select new Lpu
                           {
                               Oid = row["oid_our"].ToString(),
                               OidTheir = row["oid_their"].ToString(),
                               Token = row["token"].ToString(),
                               Name = row["name_our"].ToString(),
                               NameTheir = row["name_their"].ToString(),
                           }).ToList();

            return lpuList;
        }

        #region Назначения на инструментальные исследования
        public static List<Presc> GetPrescListToUpdate(Lpu lpu, DateTime datetime_on)
        {
            Logger.Trace("GetPrescListToUpdate: lpu=[{0}], datetime_on=[{1}]", lpu, datetime_on.ToString());

            DataSet ds = SQL.GetPrescListToUpdate(lpu, datetime_on);

            return (from DataRow row in ds.Tables[0].Rows
                    select new Presc
                    {
                        Oid = row["oid"].ToString(),
                        OidTheir = !string.IsNullOrEmpty(row["oid_their"].ToString()) ? Convert.ToInt64(row["oid_their"]) : 0,
                        Lpu = lpu,
                        Surname = row["lastname"].ToString(),
                        Name = row["firstname"].ToString(),
                        Patronymic = row["middlename"].ToString(),
                        Snils = row["snils"].ToString(),
                        PostTheirList = row["post_their_list"].ToString().Split(new[] { ',' }, StringSplitOptions.RemoveEmptyEntries).Select(x => Int64.Parse(x)).ToList(),
                        SpecTheirList = row["spec_their_list"].ToString().Split(new[] { ',' }, StringSplitOptions.RemoveEmptyEntries).Select(x => Int64.Parse(x)).ToList(),
                        BufferOids = !string.IsNullOrEmpty(row["buff_oids"].ToString()) ?
                            row["buff_oids"].ToString().Split(new[] { ',' }, StringSplitOptions.RemoveEmptyEntries).ToList()
                            : new List<string>()
                    }).ToList();
        }
        #endregion
    }
}
