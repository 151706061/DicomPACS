SELECT  current_query,
 --  pg_terminate_backend(act.procpid),
   *
FROM pg_stat_activity act
where 1=1
--and waiting = true
  and  procpid <> pg_backend_pid()