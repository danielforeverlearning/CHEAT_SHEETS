SELECT * FROM [RPAD].[dbo].[VarDef] ORDER BY VarGroupName;

SELECT * FROM [RPAD].[dbo].[AdminUser] order by UserID

SELECT * FROM [RPAD].[dbo].[Account] order by AccountID

SELECT * FROM [RPAD].[dbo].[Account] WHERE LoginName LIKE 'mlee%'

SELECT * FROM [RPAD].[dbo].[AccountTaxRecord]

SELECT * FROM [RPAD].[dbo].[AccountTaxRecord] WHERE AccountID = 1

SELECT * FROM [RPAD].[dbo].[FileAttachments]



DECLARE @retval int;
EXEC @retval = [RPAD].[dbo].[Account_CandRPanel] 'mlee@some.com';
PRINT @retval;

PRINT '-- *********  FIX THIS ******************'

EXEC [dbo].[ss_GenSP] 'AdminUser','UserName','INSERT'
EXEC [dbo].[ss_GenSP] 'AdminUser','UserName','UPDATE'
EXEC [dbo].[ss_GenSP] 'AdminUser','UserName','DELETE'

EXEC [dbo].[ss_GenSP] 'Account','AccountID','INSERT'
EXEC [dbo].[ss_GenSP] 'Account','AccountID','UPDATE'
EXEC [dbo].[ss_GenSP] 'Account','AccountID','DELETE'

EXEC [dbo].[SP2C_StoredProcParam] 'Account_insert'


EXEC [dbo].[ss_GenSP] 'AccountTaxRecord','TaxRecordID','INSERT'
EXEC [dbo].[ss_GenSP] 'AccountTaxRecord','TaxRecordID','UPDATE'
EXEC [dbo].[ss_GenSP] 'AccountTaxRecord','TaxRecordID','DELETE'

EXEC [dbo].[SP2C_StoredProcParam] 'AccountTaxRecord_insert'
EXEC [dbo].[SP2C_XMLcomment_SandCastle] 'AccountTaxRecord_insert'
EXEC [dbo].[SP2C_StoredProcParam] 'AccountTaxRecord_update'
EXEC [dbo].[SP2C_XMLcomment_SandCastle] 'AccountTaxRecord_update'
EXEC [dbo].[SP2C_StoredProcParam] 'AccountTaxRecord_delete'
EXEC [dbo].[SP2C_XMLcomment_SandCastle] 'AccountTaxRecord_delete'

EXEC [dbo].[ss_GenSP] 'FileAttachments','FileAttachmentID','INSERT'
EXEC [dbo].[ss_GenSP] 'FileAttachments','FileAttachmentID','UPDATE'
EXEC [dbo].[ss_GenSP] 'FileAttachments','FileAttachmentID','DELETE'

EXEC [dbo].[SP2C_StoredProcParam] 'FileAttachments_insert'
PRINT '------------------------'
EXEC [dbo].[SP2C_XMLcomment_SandCastle] 'FileAttachments_insert'
PRINT '------------------------'
EXEC [dbo].[SP2C_StoredProcParam] 'FileAttachments_update'
PRINT '------------------------'
EXEC [dbo].[SP2C_XMLcomment_SandCastle] 'FileAttachments_update'
PRINT '------------------------'
EXEC [dbo].[SP2C_StoredProcParam] 'FileAttachments_delete'
PRINT '------------------------'
EXEC [dbo].[SP2C_XMLcomment_SandCastle] 'FileAttachments_delete'


SELECT * FROM  vProperty WHERE UNIQUEID = '3303308000000001'
SELECT * FROM  AccountTaxRecord a CROSS APPLY dbo.tvf_PropertySummary(a.UNIQUEID) WHERE AccountID = 1

SELECT  [UNIQUEID],
		[ADRPRE],
		CASE WHEN [ADRPRE]  IN ('-','.','`') THEN null ELSE ADRPRE END aa,
		CASE WHEN [ADRPRE]  IN ('-','.','`') THEN null ELSE ADRPRE END + [ADRNO] bb,
		CASE WHEN (CASE WHEN [ADRPRE] IN ('-','.','`') THEN null ELSE ADRPRE END) + [ADRNO] IS NOT NULL THEN '-' ELSE '' END good_bb
FROM vProperty WHERE [ADRPRE] IN ('-','.','`');