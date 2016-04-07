using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Text;
using System.Threading;
using DataAccessUni;
using System.Linq;

namespace PacsWCFLib
{
    public class SQL
    {
        private static readonly Dictionary<int, DataAccessMulti> DataAccessForDifferentThreads;
        private static DataAccessMulti _dataAccessMulti;

        #region Конструктор и системные функции
        public static DataAccessMulti GetDataAccess()
        {
            if (_dataAccessMulti == null)
            {
                _dataAccessMulti = new DataAccessMulti()
                    {
                        ConnectionString = ConnectionString //_connectionString
                    };
            }

            return _dataAccessMulti;
        }

        public static string ConnectionString;
        
        static SQL()
        {
            DataAccessForDifferentThreads = new Dictionary<int, DataAccessMulti>();
        }

        //public static int DaysForward = 21;     //не может быть меньше 7

        public static bool CheckConnectDataBase()
        {
            lock (GetDataAccess())
            {
                SQL.GetDataAccess().ExecuteProc("select 1");
                return true;
            }
        }

        public static DateTime GetCurrentTimestamp()
        {
            string sqlString = @"select CURRENT_TIMESTAMP as datetime";

            var ht = new Hashtable();

            lock (GetDataAccess())
            {
                DataRow dr = GetDataAccess().GetFirstRow(sqlString, ht);
                return dr != null ? (!string.IsNullOrEmpty(dr["datetime"].ToString()) ? Convert.ToDateTime(dr["datetime"]) : DateTime.Now) : DateTime.Now;
            }
        }

        public static void DoLog(string function_name, string lpu, string oid, string session_oid, string log_text)
        {
            string sqlString = @"
            INSERT INTO 
              mir.web_service_log_rer
            (
              oid,
              lpu,
              func_name,
              call_date,
              oid_object,
              log_text,
              session_oid
            )
            VALUES (
              mir.guid_generate(),
              :lpu,
              :func_name,
              CURRENT_TIMESTAMP,
              :oid_object,
              :log_text,
              :session_oid
            )";

            var ht = new Hashtable();
            GetDataAccess().AddParameter(ht, "lpu", lpu, DataAccessType.VarChar);
            GetDataAccess().AddParameter(ht, "func_name", function_name, DataAccessType.VarChar);
            GetDataAccess().AddParameter(ht, "oid_object", oid, DataAccessType.VarChar);
            GetDataAccess().AddParameter(ht, "log_text", log_text, DataAccessType.VarChar);
            GetDataAccess().AddParameter(ht, "session_oid", session_oid, DataAccessType.VarChar);

            lock (GetDataAccess())
            {
                GetDataAccess().ExecuteProc(sqlString, ht);
            }
        }

        public static string GetHostPortByLpu(string lpu)
        {
            string sqlString = @"
            select th.code
              from mir.eown ow
             inner join mir.etheir th
                on th.oid = ow.etheir_id
               and th.etable_id = mir.etable_get_by_syn('RER2', 'TOKEN')
             where ow.code = :lpu
               and ow.etable_id = mir.etable_get_by_syn('MEDOTRADE', 'LPU')";

            var ht = new Hashtable();
            GetDataAccess().AddParameter(ht, "lpu", lpu, DataAccessType.VarChar);

            lock (GetDataAccess())
            {
                DataRow dr = GetDataAccess().GetFirstRow(sqlString, ht);
                return dr != null ? dr["code"].ToString() : string.Empty;
            }
        }
        #endregion

        #region Справочники
        public static string GetTableOidBySyn(string company_syn, string table_syn)
        {
            string sqlString = @"select mir.etable_get_by_syn(:pcompany_syn, :ptable_syn) as oid";

            var ht = new Hashtable();
            GetDataAccess().AddParameter(ht, "pcompany_syn", company_syn, DataAccessType.VarChar);
            GetDataAccess().AddParameter(ht, "ptable_syn", table_syn, DataAccessType.VarChar);

            lock (GetDataAccess())
            {
                DataRow dr = GetDataAccess().GetFirstRow(sqlString, ht);
                return dr != null ? dr["oid"].ToStringSafe() : null;
            }
        }

        public static string SetTheir(string table, string code, string value)
        {
            string sqlString = @"select mir.etheir_set(:ptable, :pcode, :pvalue) as oid";

            var ht = new Hashtable();
            GetDataAccess().AddParameter(ht, "ptable", table, DataAccessType.VarChar);
            GetDataAccess().AddParameter(ht, "pcode", code, DataAccessType.VarChar);
            GetDataAccess().AddParameter(ht, "pvalue", !string.IsNullOrEmpty(value) ? (value.Length > 255 ? value.Substring(0, 255) : value) : value, DataAccessType.VarChar);

            lock (GetDataAccess())
            {
                DataRow dr = GetDataAccess().GetFirstRow(sqlString, ht);
                return dr != null ? dr["oid"].ToStringSafe() : null;           
            }
        }

        public static void SetTheirTheir(string their, string their_parent)
        {
            string sqlString = @"select mir.etheir_etheir_set(:ptheir, :ptheir_parent)";

            var ht = new Hashtable();
            GetDataAccess().AddParameter(ht, "ptheir", their, DataAccessType.VarChar);
            GetDataAccess().AddParameter(ht, "ptheir_parent", their_parent, DataAccessType.VarChar);

            lock (GetDataAccess())
            {
                GetDataAccess().ExecuteProc(sqlString, ht);
            }
        }

        public static string SetMatchEown(string table_their, string table_our, string code_their, string code_our, string value_our)
        {
            string sqlString = @"select mir.eown_set_match(:ptable_their, :ptable_our, :pcode_their, :pcode_our, :pvalue_our) as oid;";

            var ht = new Hashtable();
            GetDataAccess().AddParameter(ht, "ptable_their", table_their, DataAccessType.VarChar);
            GetDataAccess().AddParameter(ht, "ptable_our", table_our, DataAccessType.VarChar);
            GetDataAccess().AddParameter(ht, "pcode_their", code_their, DataAccessType.VarChar);
            GetDataAccess().AddParameter(ht, "pcode_our", code_our, DataAccessType.VarChar);
            GetDataAccess().AddParameter(ht, "pvalue_our", value_our, DataAccessType.VarChar);

            lock (GetDataAccess())
            {
                DataRow dr = GetDataAccess().GetFirstRow(sqlString, ht);
                return dr != null ? dr["oid"].ToStringSafe() : null;
            }
        }

        public static string GetTheirCodeByOwnCode(string table_their, string table_own, string code_own)
        {
            string sqlString = @"select mir.etheir_get_code_by_own_code(:ptable_their, :ptable_own, :pcode_own) as code";

            var ht = new Hashtable();
            GetDataAccess().AddParameter(ht, "ptable_their", table_their, DataAccessType.VarChar);
            GetDataAccess().AddParameter(ht, "ptable_own", table_own, DataAccessType.VarChar);
            GetDataAccess().AddParameter(ht, "pcode_own", code_own, DataAccessType.VarChar);

            lock (GetDataAccess())
            {
                DataRow dr = GetDataAccess().GetFirstRow(sqlString, ht);
                return dr != null ? dr["code"].ToStringSafe() : null;
            }
        }
        #endregion

        #region ЛПУ
        public static DataSet GetLpuListFS(List<string> lpuList = null)
        {
            var ht = new Hashtable();
            string lpulist = string.Empty;

            if (lpuList != null)
            {
                string lpu = string.Empty;
                foreach (string item in lpuList)
                {
                    if (!string.IsNullOrEmpty(item.Trim()))
                    {
                        if (lpu.Length > 0)
                            lpu += ",";
                        lpu += string.Format("{0}", item.Trim().Quote());
                    }
                }

                if (lpu.Length > 0)
                    lpulist += string.Format("where c.oid in ({0})", lpu);

            }

            string sQuerry = string.Format(@"                  
            select th.code as oid_their,
                   ow.code as oid_our,
                   th.code as token,
                   th.value as name_their,
                   c.shortname as name_our
              from mir.etheir th
             inner join mir.eown ow
                on ow.etheir_id = th.oid
               and ow.etable_id = mir.etable_get_by_syn('MEDOTRADE', 'LPU')
             inner join mir.company c
                on c.oid = ow.code
             where th.etable_id = mir.etable_get_by_syn('RER2', 'TOKEN') {0}", lpulist);

            lock (GetDataAccess())
            {
                return GetDataAccess().GetDataSet(sQuerry, ht);
            }
        }


        #endregion
        
        #region Врачи

        public static DataSet GetPrescListToUpdate(Lpu lpu, DateTime datetime_on)
        {
            const string sQuerry = @"
              select distinct s.oid,
                     th.code as oid_their,
                     p.lastname,
                     p.firstname,
                     p.middlename,
                     replace(replace(p.snils, '-', ''), ' ', '') as snils,
                     string_agg( thp.code, ',' ) over ( partition by s.oid order by lpad(thp.code, 10, '0') 
                                      rows between unbounded preceding and unbounded following ) as post_their_list,
                     string_agg( thss.code, ',' ) over ( partition by s.oid order by lpad(thss.code, 10, '0') 
                                      rows between unbounded preceding and unbounded following ) as spec_their_list,
                     string_agg( buff.oid, ',' ) over ( partition by s.oid order by buff.regist_date 
                                      rows between unbounded preceding and unbounded following ) as buff_oids
                from mir.sysuser s
               inner join mir.people p
                  on p.oid = s.oid
                 and p.snils is not null
               inner join mir.sotr sot
                  on sot.sysuser = s.oid
               inner join mir.otdel o
                  on o.oid = sot.otdel
               inner join mir.sotr_sertificatespeciality sss
                  on sss.sotr = sot.oid   

                left join mir.eown ow
                  on ow.code = s.oid
                 and ow.etable_id = mir.etable_get_by_syn('MEDOTRADE', 'SYSUSER')
                left join mir.etheir th
                  on th.oid = ow.etheir_id
                 and th.etable_id = mir.etable_get_by_syn('RER2', 'DOCTOR')

               inner join mir.eown owss
                  on owss.code = sss.sertificatespeciality
                 and owss.etable_id = mir.etable_get_by_syn('MEDOTRADE', 'SERTIFICATESPECIALITY')
               inner join mir.etheir thss
                  on thss.oid = owss.etheir_id
                 and thss.etable_id = mir.etable_get_by_syn('RER2', 'SPEC')
                 
               inner join mir.eown owp
                  on owp.code = sot.post
                 and owp.etable_id = mir.etable_get_by_syn('MEDOTRADE', 'POST')
               inner join mir.etheir thp
                  on thp.oid = owp.etheir_id
                 and thp.etable_id = mir.etable_get_by_syn('RER2', 'POST') 
                 
               inner join mir.web_buffer_transfer_rer buff
                  on buff.key_field_value = sot.oid
                 and buff.upload_date is null
                 and buff.lpu = o.lpu
                 and buff.table_name = 'SOTR'
                 and buff.action = 'UPDATE'
                 and buff.regist_date < :datetime_on
                 
               where o.lpu = :lpu";

            var ht = new Hashtable();
            GetDataAccess().AddParameter(ht, "lpu", lpu.Oid, DataAccessType.VarChar);
            GetDataAccess().AddParameter(ht, "datetime_on", datetime_on, DataAccessType.TimeStamp);


            lock (GetDataAccess())
            {
                return GetDataAccess().GetDataSet(sQuerry, ht);
            }
        }

        #endregion
        


        #region Всякое


        public static void CleanBuffers()
        {
            string sQuerry =
            @"BEGIN

            DELETE FROM MIR.FER_BUFFER FB
            WHERE FB.SCHEDULE_STARTON < sysdate -7;

            DELETE FROM MIR.FER_RESOURCE_RULE FRR
            WHERE FRR.END_DATE < sysdate - 7;

            DELETE FROM MIR.FER_RESOURCE_SLOT FRS
            where FRS.START_DATE < sysdate - 7;

            END;";

            lock (GetDataAccess())
            {
                GetDataAccess().ExecuteProc(sQuerry);
            }
        }

        public static void UpdateBuffer(Lpu lpu, DateTime startTime, List<string> actions, List<string> buff_oids)
        {
            var ht = new Hashtable();
            string oids_action = string.Empty;
            if (actions != null)
            {
                oids_action = string.Join(",", actions);
            }

            string oids = string.Empty;

            if (buff_oids != null)
            {
                oids = string.Join<string>(",", buff_oids);
            }

            const string sQuerry = @"
            update mir.web_buffer_transfer_rer btr
               set upload_date = CURRENT_TIMESTAMP
             where btr.lpu = :lpu
               and btr.action in ( select unnest( string_to_array(:actions, ',') ) )
               and btr.regist_date < :start_date
               and btr.schedule_starton < date_trunc('week', CURRENT_DATE) + interval '21 day'
               and btr.oid in ( select unnest( string_to_array(:oids, ',') ) )";

            GetDataAccess().AddParameter(ht, "lpu", lpu.Oid, DataAccessType.VarChar);
            GetDataAccess().AddParameter(ht, "actions", oids_action, DataAccessType.VarChar);
            GetDataAccess().AddParameter(ht, "start_date", startTime, DataAccessType.TimeStamp);
            GetDataAccess().AddParameter(ht, "oids", oids, DataAccessType.VarChar);

            lock (GetDataAccess())
            {
                GetDataAccess().ExecuteProc(sQuerry, ht);
            }
        }

        #endregion

    }
}