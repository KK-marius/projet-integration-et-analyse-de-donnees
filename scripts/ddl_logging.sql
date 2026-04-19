CREATE TABLE logging.log_alimentation (
    log_id               INT IDENTITY(1,1) PRIMARY KEY,
    proc_name			 NVARCHAR(255),
    layer_name           NVARCHAR(50),
    table_name           NVARCHAR(255),
    log_status           NVARCHAR(50),
    log_message          NVARCHAR(4000),
    rows_inserted        INT NULL,
    start_time           DATETIME2,
    end_time             DATETIME2 NULL,
    duration_seconds     INT NULL,
    error_num			 INT NULL,
    error_stat           INT NULL,
    error_lin            INT NULL,
    created_at           DATETIME2 DEFAULT GETDATE()
);
GO