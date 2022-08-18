--https://docs.microsoft.com/de-de/sql/t-sql/statements/alter-database-scoped-configuration-transact-sql?view=sql-server-ver15


--L�schen des Prozedurcaches.
--Festlegen des MAXDOP-Parameters auf einen beliebigen Wert (1,2, ...) f�r die prim�re Datenbank, basierend auf dem, was am besten f�r diese bestimmte Datenbank ist, und Festlegen eines anderen Werts (z. B. 0) f�r alle verwendeten sekund�ren Datenbanken (z. B. f�r Berichtsabfragen).
--Festlegen des Kardinalit�tssch�tzungsmodells f�r den Abfrageoptimierer unabh�ngig von der Datenbank auf den Kompatibilit�tsgrad.
--Aktivieren oder Deaktivieren der Parameterermittlung auf Datenbankebene.
--Aktivieren oder Deaktivieren der Abfrageoptimierungs-Hotfixes auf Datenbankebene.
--Aktivieren oder Deaktivieren des Identit�tscache auf Datenbankebene.
--Aktivieren oder Deaktivieren eines Stubs des kompilierten Plans, der bei der erstmaligen Kompilierung eines Batches im Cache gespeichert werden soll.
--Aktivieren oder Deaktivieren von Sammlungen von Ausf�hrungsstatistiken f�r nativ kompilierte Transact-SQL-Module.
--Aktivieren oder Deaktivieren von �online by default�-Optionen (Standardm��ig online) f�r DDL-Anweisungen, die die ONLINE =-Syntax unterst�tzen.
--Aktivieren oder Deaktivieren von �resumable by default�-Optionen (Standardm��ig fortsetzbar) f�r DDL-Anweisungen, die die RESUMABLE =-Syntax unterst�tzen.
--Aktivieren oder Deaktivieren der Features der intelligenten Abfrageverarbeitung
--Aktivieren oder Deaktivieren des beschleunigten Erzwingens des Plans.
--Aktivieren oder Deaktivieren der Funktion f�r automatisches L�schen von globalen tempor�ren Tabellen
--Aktivieren oder Deaktivieren der einfachen Profilerstellungsinfrastruktur f�r Abfragen
--Aktivieren oder Deaktivieren der neuen String or binary data would be truncated-Fehlermeldung
--Aktivieren oder Deaktivieren des letzten tats�chlichen Ausf�hrungsplans in sys.dm_exec_query_plan_stats
--Geben Sie die Anzahl der Minuten an, in denen ein angehaltener fortsetzbarer Indexvorgang angehalten wird, bevor er von der Datenbank-Engine automatisch abgebrochen wird.
--Aktivieren oder Deaktivieren des Wartens auf Sperren mit niedriger Priorit�t f�r asynchrone Statistikupdates.


-- Syntax for SQL Server, Azure SQL Database and Azure SQL Managed Instance
/*
ALTER DATABASE SCOPED CONFIGURATION
{
    { [ FOR SECONDARY] SET <set_options>}
}
| CLEAR PROCEDURE_CACHE [plan_handle]
| SET < set_options >
[;]

< set_options > ::=
{
    MAXDOP = { <value> | PRIMARY}
    | LEGACY_CARDINALITY_ESTIMATION = { ON | OFF | PRIMARY}
    | PARAMETER_SNIFFING = { ON | OFF | PRIMARY}
    | QUERY_OPTIMIZER_HOTFIXES = { ON | OFF | PRIMARY}
    | IDENTITY_CACHE = { ON | OFF }
    | INTERLEAVED_EXECUTION_TVF = { ON | OFF }
    | BATCH_MODE_MEMORY_GRANT_FEEDBACK = { ON | OFF }
    | BATCH_MODE_ADAPTIVE_JOINS = { ON | OFF }
    | TSQL_SCALAR_UDF_INLINING = { ON | OFF }
    | ELEVATE_ONLINE = { OFF | WHEN_SUPPORTED | FAIL_UNSUPPORTED }
    | ELEVATE_RESUMABLE = { OFF | WHEN_SUPPORTED | FAIL_UNSUPPORTED }
    | OPTIMIZE_FOR_AD_HOC_WORKLOADS = { ON | OFF }
    | XTP_PROCEDURE_EXECUTION_STATISTICS = { ON | OFF }
    | XTP_QUERY_EXECUTION_STATISTICS = { ON | OFF }
    | ROW_MODE_MEMORY_GRANT_FEEDBACK = { ON | OFF }
    | BATCH_MODE_ON_ROWSTORE = { ON | OFF }
    | DEFERRED_COMPILATION_TV = { ON | OFF }
    | ACCELERATED_PLAN_FORCING = { ON | OFF }
    | GLOBAL_TEMPORARY_TABLE_AUTO_DROP = { ON | OFF }
    | LIGHTWEIGHT_QUERY_PROFILING = { ON | OFF }
    | VERBOSE_TRUNCATION_WARNINGS = { ON | OFF }
    | LAST_QUERY_PLAN_STATS = { ON | OFF }
    | PAUSED_RESUMABLE_INDEX_ABORT_DURATION_MINUTES = <time>
    | ISOLATE_SECURITY_POLICY_CARDINALITY  = { ON | OFF }
    | EXEC_QUERY_STATS_FOR_SCALAR_FUNCTIONS = { ON | OFF }
    | ASYNC_STATS_UPDATE_WAIT_AT_LOW_PRIORITY = { ON | OFF }
}
*/