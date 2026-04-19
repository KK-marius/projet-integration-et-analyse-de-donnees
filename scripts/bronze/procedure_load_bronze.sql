USE [DataWarehouse]
GO
/****** Object:  StoredProcedure [bronze].[load_bronze]    Script Date: 4/19/2026 9:01:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER     PROCEDURE [bronze].[load_bronze] 
AS
BEGIN
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	DECLARE @start_time DATETIME2, 
			@end_time DATETIME2, 
			@batch_start_time DATETIME2, 
			@batch_end_time DATETIME2,
			@current_table NVARCHAR(255);

	BEGIN TRY
		SET @batch_start_time = GETDATE();

		/** Début du chargement de la couche Bronze **/
		INSERT INTO logging.log_alimentation (
			proc_name, layer_name, table_name, log_status, 
			log_message, start_time
		) 
		VALUES (
			OBJECT_SCHEMA_NAME(@@PROCID) + '' + OBJECT_NAME(@@PROCID), 
			OBJECT_SCHEMA_NAME(@@PROCID), NULL, 'STARTED', 
			'Début du chargement de la couche Bronze',
			@batch_start_time
		);

		BEGIN TRANSACTION;

		PRINT '==========================================================================';
		PRINT 'Chargement de la couche Bronze';
		PRINT '==========================================================================';

		PRINT '--------------------------------------------------------------------------';
		PRINT 'Chargement des tables CRM';
		PRINT '--------------------------------------------------------------------------';

		SET @start_time = GETDATE();
		SET @current_table = 'bronze.crm_cust_info';

		TRUNCATE TABLE bronze.crm_cust_info;
		BULK INSERT bronze.crm_cust_info
		FROM 'D:\Data Projects\Dwh_project\datasets\source_crm\cust_info.csv'
		WITH (FIRSTROW = 2,	FIELDTERMINATOR = ',', TABLOCK);

		/** Log de la table crm_cust_info **/
		INSERT INTO logging.log_alimentation (
			proc_name, layer_name, table_name, log_status, 
			log_message, rows_inserted, start_time, end_time, duration_seconds
		) 
		VALUES (
			OBJECT_SCHEMA_NAME(@@PROCID) + '' + OBJECT_NAME(@@PROCID), 
			OBJECT_SCHEMA_NAME(@@PROCID), @current_table, 'SUCCESS', 
			'Chargement OK', @@ROWCOUNT, @start_time, GETDATE(), 
			DATEDIFF(SECOND, @start_time, GETDATE())
		);

		PRINT '>> ----------------------------------------------------------------------';
		
		SET @start_time = GETDATE();
		SET @current_table = 'bronze.crm_prd_info';
	
		TRUNCATE TABLE bronze.crm_prd_info;                                   
		BULK INSERT bronze.crm_prd_info
		FROM 'D:\Data Projects\Dwh_project\datasets\source_crm\prd_info.csv'
		WITH (FIRSTROW = 2, FIELDTERMINATOR = ',', TABLOCK);

		/** Log de la table crm_prd_info **/
		INSERT INTO logging.log_alimentation (
			proc_name, layer_name, table_name, log_status, 
			log_message, rows_inserted, start_time, end_time, duration_seconds
		) 
		VALUES (
			OBJECT_SCHEMA_NAME(@@PROCID) + '' + OBJECT_NAME(@@PROCID), 
			OBJECT_SCHEMA_NAME(@@PROCID), @current_table, 'SUCCESS', 
			'Chargement OK', @@ROWCOUNT, @start_time, GETDATE(), 
			DATEDIFF(SECOND, @start_time, GETDATE())
		);

		PRINT '>> ----------------------------------------------------------------------';


		SET @start_time = GETDATE();
		SET @current_table = 'bronze.crm_sales_details';
		PRINT '>> Troncature de la table : bronze.crm_sales_details';
		TRUNCATE TABLE bronze.crm_sales_details;

		PRINT '>> Insertion des données dans : bronze.crm_sales_details';
		BULK INSERT bronze.crm_sales_details
		FROM 'D:\Data Projects\Dwh_project\datasets\source_crm\sales_details.csv'
		WITH (FIRSTROW = 2, FIELDTERMINATOR = ',', TABLOCK );

		/** Log de la table crm_sales_details **/
		INSERT INTO logging.log_alimentation (
			proc_name, layer_name, table_name, log_status, 
			log_message, rows_inserted, start_time, end_time, duration_seconds
		) 
		VALUES (
			OBJECT_SCHEMA_NAME(@@PROCID) + '' + OBJECT_NAME(@@PROCID), 
			OBJECT_SCHEMA_NAME(@@PROCID), @current_table, 'SUCCESS', 
			'Chargement OK', @@ROWCOUNT, @start_time, GETDATE(), 
			DATEDIFF(SECOND, @start_time, GETDATE())
		);

		PRINT '>> ----------------------------------------------------------------------';



		PRINT '--------------------------------------------------------------------------';
		PRINT 'Chargement des tables ERP';
		PRINT '--------------------------------------------------------------------------';

		SET @start_time = GETDATE();
		SET @current_table = 'bronze.erp_cust_az12';
		PRINT '>> Troncature de la table : bronze.erp_cust_az12';
		TRUNCATE TABLE bronze.erp_cust_az12;

		PRINT '>> Insertion des données dans : bronze.erp_cust_az12';
		BULK INSERT bronze.erp_cust_az12
		FROM 'D:\Data Projects\Dwh_project\datasets\source_erp\CUST_AZ12.csv'
		WITH (FIRSTROW = 2,	FIELDTERMINATOR = ',', TABLOCK);

		/** Log de la table erp_cust_az12 **/
		INSERT INTO logging.log_alimentation (
			proc_name, layer_name, table_name, log_status, 
			log_message, rows_inserted, start_time, end_time, duration_seconds
		) 
		VALUES (
			OBJECT_SCHEMA_NAME(@@PROCID) + '' + OBJECT_NAME(@@PROCID), 
			OBJECT_SCHEMA_NAME(@@PROCID), @current_table, 'SUCCESS', 
			'Chargement OK', @@ROWCOUNT, @start_time, GETDATE(), 
			DATEDIFF(SECOND, @start_time, GETDATE())
		);

		PRINT '>> ----------------------------------------------------------------------';


		SET @start_time = GETDATE();
		SET @current_table = 'bronze.erp_loc_a101';

		TRUNCATE TABLE bronze.erp_loc_a101;
		BULK INSERT bronze.erp_loc_a101
		FROM 'D:\Data Projects\Dwh_project\datasets\source_erp\LOC_A101.csv'
		WITH (FIRSTROW = 2, FIELDTERMINATOR = ',', TABLOCK);

		/** Log de la table erp_loc_a101 **/
		INSERT INTO logging.log_alimentation (
			proc_name, layer_name, table_name, log_status, 
			log_message, rows_inserted, start_time, end_time, duration_seconds
		) 
		VALUES (
			OBJECT_SCHEMA_NAME(@@PROCID) + '' + OBJECT_NAME(@@PROCID), 
			OBJECT_SCHEMA_NAME(@@PROCID), @current_table, 'SUCCESS', 
			'Chargement OK', @@ROWCOUNT, @start_time, GETDATE(), 
			DATEDIFF(SECOND, @start_time, GETDATE())
		);

		PRINT '>> ----------------------------------------------------------------------';


		SET @start_time = GETDATE();
		SET @current_table = 'bronze.erp_px_cat_g1v2';

		TRUNCATE TABLE bronze.erp_px_cat_g1v2;
		BULK INSERT bronze.erp_px_cat_g1v2
		FROM 'D:\Data Projects\Dwh_project\datasets\source_erp\PX_CAT_G1V2.csv'
		WITH (FIRSTROW = 2, FIELDTERMINATOR = ',', TABLOCK);

		/** Log de la table erp_px_cat_g1v2 **/
		INSERT INTO logging.log_alimentation (
			proc_name, layer_name, table_name, log_status, 
			log_message, rows_inserted, start_time, end_time, duration_seconds
		) 
		VALUES (
			OBJECT_SCHEMA_NAME(@@PROCID) + '' + OBJECT_NAME(@@PROCID), 
			OBJECT_SCHEMA_NAME(@@PROCID), @current_table, 'SUCCESS', 
			'Chargement OK', @@ROWCOUNT, @start_time, GETDATE(), 
			DATEDIFF(SECOND, @start_time, GETDATE())
		);

		PRINT '>> ----------------------------------------------------------------------';

		COMMIT TRANSACTION;
		
		SET @batch_end_time = GETDATE();

		/** Log de traitement global (succès) **/
		INSERT INTO logging.log_alimentation (
			proc_name, layer_name, table_name, log_status, 
			log_message, start_time, end_time, duration_seconds
		)
		VALUES (
			OBJECT_SCHEMA_NAME(@@PROCID) + '' + OBJECT_NAME(@@PROCID), 
			OBJECT_SCHEMA_NAME(@@PROCID), NULL, 'SUCCESS', 
			'Chargement de la couche Bronze terminé avec succès', 
			@batch_start_time, @batch_end_time,
			DATEDIFF(SECOND, @batch_start_time, @batch_end_time)
		);

		PRINT '==========================================================================';
	END TRY

	BEGIN CATCH
		/** Rollback si la transaction est encore active **/
		IF @@TRANCOUNT > 0 
			ROLLBACK TRANSACTION;

		/** log d'erreur **/
		INSERT INTO logging.log_alimentation (proc_name, layer_name, table_name, 
			log_status, log_message, start_time, end_time, 
			duration_seconds, error_num, error_stat, error_lin
		)
		VALUES (
			OBJECT_SCHEMA_NAME(@@PROCID) + '' + OBJECT_NAME(@@PROCID), 
			OBJECT_SCHEMA_NAME(@@PROCID), @current_table, 'FAILED', 
			ERROR_MESSAGE(), @batch_start_time, GETDATE(), 
			DATEDIFF(SECOND, @batch_start_time, GETDATE()), 
			ERROR_NUMBER(), ERROR_STATE(), ERROR_LINE()
		);

		PRINT 'Erreur lors du chargement : ' + ERROR_MESSAGE();

		PRINT '==========================================================================';
	END CATCH
END;
GO