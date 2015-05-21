USE [RPAD]
GO


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SP2C_StoredProcParam]
	@sp_name varchar(100) = 0
AS
BEGIN

	DECLARE c CURSOR FOR
		SELECT 
		PARAMETER_NAME,
		DATA_TYPE,
		CAST(CHARACTER_MAXIMUM_LENGTH AS varchar(10)),
		DbType
	FROM 
		INFORMATION_SCHEMA.PARAMETERS t 
	RIGHT OUTER JOIN 
		SSParamBuilder s 
	ON t.DATA_TYPE = s.t
	WHERE 
		SPECIFIC_NAME = @sp_name

OPEN c

DECLARE @p nvarchar(128) , @dt nvarchar(128),	@size varchar(10),
		@row_count smallint, @newt	varchar(100) , @pname varchar(100)

FETCH NEXT FROM c INTO @p, @dt, @size, @newt

SELECT @row_count = 1
WHILE @@FETCH_STATUS = 0 
BEGIN

IF( 1 = 1)
BEGIN
	IF @row_count = 1 
	BEGIN
		PRINT 'using (DBMgr db = new DBMgr(connectionString))'
        PRINT '{'
            PRINT CHAR(9) + 'try'
            PRINT CHAR(9) + '{'
				PRINT CHAR(9) + CHAR(9) + 'StoredProcParams pp = new StoredProcParams();'
	END
	
	PRINT CHAR(9) + CHAR(9) + 'pp.AddParam("' + @p + '", SqlDbType.' + @newt + ', data.' + REPLACE(@p, '@', '') + ');' 


--PRINT @p + '=' + @p
END

--PRINT 'string ' + @p + ','
	FETCH NEXT FROM c INTO @p, @dt, @size, @newt
	SELECT @row_count = @row_count + 1
END

PRINT ''
PRINT CHAR(9) + '}'
PRINT CHAR(9) + 'catch (Exception ex) { throw ex;}'
PRINT CHAR(9) + 'finally'
PRINT CHAR(9) + '{'
PRINT CHAR(9) + '}'
PRINT '}'

CLOSE c
DEALLOCATE c
END

GO


