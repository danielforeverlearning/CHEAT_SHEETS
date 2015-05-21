SELECT COUNT(*), COUNT(DISTINCT realFileName) FROM [dbo].[AttachFiles]

SELECT realFileName, COUNT(*) my_row_count FROM [dbo].[AttachFiles] GROUP BY realFileName HAVING COUNT(*) > 1 ORDER BY my_row_count DESC

SELECT contract_id, realFileName, COUNT(*) my_row_count FROM [dbo].[AttachFiles] GROUP BY realFileName, contract_id HAVING COUNT(*) > 0 ORDER BY my_row_count DESC

SELECT realFileName, COUNT(*) my_row_count INTO XX FROM [dbo].[AttachFiles] GROUP BY realFileName HAVING COUNT(*) > 1 ORDER BY my_row_count DESC

SELECT * FROM [dbo].[AttachFiles] WHERE realFileName IN (SELECT realFileName FROM XX)