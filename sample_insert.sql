USE [RPAD]
GO

INSERT INTO [dbo].[VarDef]

           ([VarGroupName]
           ,[CompanyID]
           ,[VarName]
           ,[VarValue]
           ,[VarValue2]
           ,[VarDesc]
           ,[UIOrder]
           ,[RankValue]
           ,[CreateDT]
           ,[ModifyDT]
           ,[ModifyBy]
           ,[Version]
           ,[ActiveDT]
           ,[InActiveDT]
           ,[databaseName]
           ,[objectName]
           ,[columnName]
           ,[VarValue3]
           ,[propertyName]
           ,[isSelectable]
           ,[IsDefault])
     VALUES
           ('ORGINALFILE_T'
           ,0
           ,'blah6'
           ,'BLAH6'
           ,NULL
           ,NULL
           ,0
           ,0
           ,GETDATE()
           ,GETDATE()
           ,'max'
           ,NULL
           ,GETDATE()
           ,DATEADD(year,1, '2014-07-4')
           ,NULL
           ,NULL
           ,NULL
           ,NULL
           ,NULL
           ,1
           ,0)
GO


