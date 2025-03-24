/*
  -----------------------------------------------------------------------------
  SCRIPT SUMMARY:
  -----------------------------------------------------------------------------
  This script performs the following actions in the SQL Server environment:

  1. **Switches to the 'master' database**: Ensures that operations are performed on the system database.

  2. **Checks if the 'DataWarehouse' database exists**: If it exists, the script:
     - Alters the 'DataWarehouse' database to set it to SINGLE_USER mode (disallows other users from connecting).
     - Drops the 'DataWarehouse' database.

  3. **Creates a new 'DataWarehouse' database**: Establishes a fresh database named 'DataWarehouse' in the current environment.

  4. **Switches the context to the newly created 'DataWarehouse' database**: Ensures subsequent operations are applied to the 'DataWarehouse' database.

  5. **Creates schemas for Data Warehouse architecture**:
     - **Bronze Schema**: \for raw, untransformed data.
     - **Silver Schema**: for cleaned and processed data.
     - **Gold Schema**: for analytics-ready, aggregated, or business intelligence data.

  -----------------------------------------------------------------------------
  USAGE:
  - This script is useful when setting up a fresh 'DataWarehouse' database and organizing the architecture layers (Bronze, Silver, Gold).
  - It is particularly helpful in implementing a data pipeline in a Data Warehouse system where each schema represents different stages of data processing.
  -----------------------------------------------------------------------------

  WARNING: 
  - Running this script will drop the entire 'DataWarehouse' database if exists.
  - All data in the database will be permanently deleted. Proceed with caution and ensure you have proper backups before running this script.
*/  


USE master; 
GO -- Execution Separator
  
-- DROP and RECREATE the 'DataWarehouse' database
IF EXISTS (SELECT 1 FROM sys.database WHERE name = 'DataWarehouse')
BEGIN 
  ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
  DROP DATABASE DataWarehouse;
END; 
GO -- Seperator

-- CREATE DATABASE:
CREATE DATABASE DataWarehouse;

-- SWITCH TO NEW CREATED DATABASE:
USE DataWarehouse;

-- CREATE SCHEMAS FOR THE ARCHITECTURE (Bronze, Silver, Gold) layers.

-- 1: Broze Schema:
CREATE SCHEMA bronze;

-- 2: Silver Schema:
CREATE SCHEMA silver;

-- 3: Gold Schema:
CREATE SCHEMA gold;
