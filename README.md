![logo](https://vldbsolutions.com/img/VLDB-logo.png)

### Introduction

**VLDB Solutions** are an independent data consultancy based in the UK. We provide expert [Professional Services](https://vldbsolutions.com/services/services.php) to clients and companies across all sectors of business, from finance and leisure, to retail and telecommunications. Our hard-earned, industry-recognised knowledge, accrued over decades of working on data projects, enables us to provide the solution to any [Big Data](https://vldbsolutions.com/glossary.php#bigdata) problem.

Our main area of expertise is high-end, [Massively Parallel Processing (MPP)](https://vldbsolutions.com/glossary.php#mpp) database platforms, especially [Teradata](https://vldbsolutions.com/technology/teradata.php) and [Pivotal Greenplum](https://vldbsolutions.com/technology/greenplum.php). However, our project history includes business functions as diverse as [CRM](https://vldbsolutions.com/glossary.php#crm), [analytics](https://vldbsolutions.com/glossary.php#dataanalytics), customer retention, and financial planning and forecasting — as well as delivering tailored, hands-on technical [training](https://vldbsolutions.com/services/teradata-services/teradata-training.php) — for clients from the UK, Europe, and the USA.

![logo](https://vldbsolutions.com/img/VLDB-DBSee.png)

The team at VLDB have been acquiring and modifying Teradata best practice beliefs since 1989.

DBSee represents the Teradata best practice beliefs that can be checked for programmatically. DBSee consists of a set of SQL scripts developed by VLDB that run against the Teradata data dictionary. Each script can be used to inform a user of the current state of their Teradata system.

### What Does DBSee Check?

DBSee rules cover the following areas:

* permanent space
* data distribution
* indexes
* partitions
* statistics
* compression
* table properties

In all cases, DBSee rules look for opportunities to improve how Teradata is used to align with best practices.

### DBSee Benefits

The key DBSee deliverable is a set of results displayed within your native database client tool, or output as a csv file and imported into Tableau for easy-to-understand visualisations.

There are two possible outcomes from DBSee:

* no best practice violations detected
* evidence-based best practice violations detected

We have yet to find a Teradata system that doesn't fail nearly **all** of the DBSee best practice checks.

The great news is that all best practice violations can be fixed relatively easily. The first step is to uncover them with DBSee.

Fixing best practice violations typically delivers some or all of the following benefits:

* reduced CPU demand
* reduced IO demand
* increase in free space
* reduced query elapse times
* improved best practice knowledge
* smaller ETL batch window

When taken together, best practice improvements can often extend the life of your Teradata system.

![logo](https://vldbsolutions.com/img/VLDB-DBSee-Tables.png)

### Running DBSee

There are a couple of ways in which DBSee can be run against a Teradata system:

* run code via an sql client 
* run as bteq via the command line 

DBSee does **not** access any data held in Teradata outside of the data dictionary (DBC). DBSee does not require any privileges apart from select access to DBC.

The DBSee scripts take between a few seconds to a few minutes each to execute, even against a busy system. 

**[dbsee_permspace.sql]**(https://github.com/VLDB-Solutions/DBSEE/blob/master/dbsee_permspace.sql) -- available space within each database

A general rule is to keep the overall percent used below 65%; typically this ensures that there is enough free space. If you find that the total space used is above the recommended 65%, there are a number of options:

1. Increase the database size from the DBC/owner freespace
1. Explore table size reduction - unused secondary and join indexes, compression, unused columns, wasted space in char datatypes (e.g varchar(1) which uses 5 bytes instead of 1 due to the varchar overhead)
1. Increase disk capacity 

**[dbsee_tablefallback.sql]**(https://github.com/VLDB-Solutions/DBSEE/blob/master/dbsee_tablefallback.sql) -- tables with fallback enabled

This is a check to find any fallback enabled tables; these tables can potentially delay updates. The backup of data is preferred over a fallback, as fallback enabled tables take up extra database space and can cause issues with failed inserts and updates.

**[dbsee_tableindexstats.sql]**(https://github.com/VLDB-Solutions/DBSEE/blob/master/dbsee_tableindexstats.sql) -- tables with missing or old index statistics

**[dbsee_tablemaxpi.sql]**(https://github.com/VLDB-Solutions/DBSEE/blob/master/dbsee_tablemaxpi.sql) -- tables with 5 or more primary index (PI) columns

**[dbsee_tablemultiset.sql]**(https://github.com/VLDB-Solutions/DBSEE/blob/master/dbsee_tablemultiset.sql) -- multiset tables

**[dbsee_tablenopi.sql]**(https://github.com/VLDB-Solutions/DBSEE/blob/master/dbsee_tablenopi.sql) -- NOPI tables

**[dbsee_tablenullablepi.sql]**(https://github.com/VLDB-Solutions/DBSEE/blob/master/dbsee_tablenullablepi.sql) -- tables with nullable primary index (PI) columns

**[dbsee_tablepartitions.sql]**(https://github.com/VLDB-Solutions/DBSEE/blob/master/dbsee_tablepartitions.sql) -- statistics for partitioned tables

**[dbsee_tablepidatatype.sql]**(https://github.com/VLDB-Solutions/DBSEE/blob/master/dbsee_tablepidatatype.sql) -- primary index (PI) datatypes

**[dbsee_tableskew.sql]**(https://github.com/VLDB-Solutions/DBSEE/blob/master/dbsee_tableskew.sql) -- skewed tables

**[dbsee_tablestats.sql]**(https://github.com/VLDB-Solutions/DBSEE/blob/master/dbsee_tablestats.sql) -- tables with missing or old statistics

**[dbsee_tablewidth.sql]**(https://github.com/VLDB-Solutions/DBSEE/blob/master/dbsee_tablewidth.sql) -- number of columns per table

**[dbsee_unused.sql]**(https://github.com/VLDB-Solutions/DBSEE/blob/master/dbsee_unused.sql) -- unused database objects

### Contact VLDB

For questions or support, we can be contacted through the following channels:

* Homepage: [vldbsolutions.com](https://vldbsolutions.com/)  
* Email: contact@vldbsolutions.com
* Twitter: [@vldbsolutions](https://twitter.com/vldbsolutions)

