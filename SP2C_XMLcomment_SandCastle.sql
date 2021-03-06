USE [RPAD]
GO
/****** Object:  StoredProcedure [dbo].[SP2C_XMLcomment_SandCastle]    Script Date: 4/24/2015 1:40:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dbo].[SP2C_XMLcomment_SandCastle]
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
		PRINT '///     <br>' + @p + '</br>' 
	END

	FETCH NEXT FROM c INTO @p, @dt, @size, @newt
	SELECT @row_count = @row_count + 1
END

CLOSE c
DEALLOCATE c
END

