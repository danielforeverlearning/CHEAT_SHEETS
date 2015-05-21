USE [RPAD]
GO

/****** Object:  StoredProcedure [dbo].[Account_update]    Script Date: 5/1/2015 9:00:04 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

 
CREATE PROCEDURE [dbo].[Account_UpdateName]
	 @LoginName varchar(50) = NULL
	,@NamePrefix varchar(10) = NULL
	,@NameFirst varchar(40) = NULL
	,@NameMiddle varchar(40) = NULL
	,@NameLast varchar(40) = NULL
	,@NameTitle varchar(10) = NULL
AS
BEGIN

UPDATE Account SET
	 NamePrefix = @NamePrefix
	,NameFirst = @NameFirst
	,NameMiddle = @NameMiddle
	,NameLast = @NameLast
	,NameTitle = @NameTitle
WHERE LoginName = @LoginName;
 
END

GO

