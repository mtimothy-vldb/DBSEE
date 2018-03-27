/*********************************************************************/
/* Author      : VLDB                                                */
/* Date        : 07/02/2017                                          */
/* Version     : 1                                                   */
/* Description : Generate CSV to report on nopi tables within        */
/*               the Teradata System                                 */
/*********************************************************************/
/* 1 - export target table to CSV                                    */
/*********************************************************************/

-- export location now set in controlling shell

.set recordmode off
.set separator '|'
.set width 2000
.set titledashes off
.set null as ''

select t1.databasename as database_name
      ,t1.tablename    as table_name
      ,case 
            when t1.tablekind like 'O' then 'NOPI'
            when t1.tablekind like 'T' then 'PI'
       end as table_type
      ,t2.total_perm as total_perm
from   dbc.tables t1
inner join 
      (select databasename
                 ,tablename
                 ,sum(currentperm) as total_perm
       from   dbc.tablesizev
       group by 1,2) t2
on     t1.databasename = t2.databasename
and    t1.tablename    = t2.tablename
where  t1.tablekind in ('O','T')
;
.if errorcode <> 0 then .quit errorcode

.logoff
.exit
