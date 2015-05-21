SELECT * FROM  AccountTaxRecord a CROSS APPLY dbo.tvf_PropertySummary(a.UNIQUEID);

--------------------------------------------------

USE [RPAD]
GO
/****** Object:  UserDefinedFunction [dbo].[tvf_PropertySummary]    Script Date: 4/24/2015 11:05:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER FUNCTION [dbo].[tvf_PropertySummary](@uniqueID VARCHAR(17))
RETURNS TABLE
AS RETURN
(
	 SELECT
  UNIQUEID,
  TMK,
  OWN1,
  OWNSEQ,
 -- CUR_TOT_VAL,
  dbo.util_TaxRecAmountMoneyStr(CUR_TOT_VAL) CUR_TOT_VALStr,
	ISNULL(case when [ADRPRE]  IN ('-','.','`') THEN null ELSE ADRPRE END,'') +
	CASE WHEN CASE WHEN [ADRPRE]  IN ('-','.','`') THEN null ELSE ADRPRE END + [ADRNO] IS NOT NULL THEN '-' ELSE '' END +
	ISNULL([ADRNO],'') + 
	ISNULL([ADRADD],'') +
	CASE WHEN CASE WHEN [ADRPRE]  IN ('-','.','`') THEN '' ELSE ADRPRE END + [ADRNO] IS NOT NULL THEN '' ELSE '' END +
	CASE WHEN [ADRDIR] IS NOT NULL THEN ADRDIR + ' ' ELSE ' ' END +
	ISNULL([ADRSTR],'') +
	CASE WHEN ADRSUF IS NOT NULL THEN ' ' + ADRSUF ELSE '' END +
	CASE WHEN ADRSUF2 IS NOT NULL THEN ' ' + ADRSUF2 ELSE '' END +
	CASE WHEN [UNITDESC] + [UNITNO] IS NOT NULL THEN ' ' ELSE '' END +
	CASE WHEN [UNITDESC] IS NOT NULL THEN ' ' + [UNITDESC] ELSE '' END + 
	CASE WHEN [UNITDESC] + [UNITNO] IS NOT NULL THEN ' ' ELSE '' END +
	CASE WHEN [UNITNO] IS NOT NULL THEN [UNITNO] ELSE '' END AddrLine1,
	ISNULL([PROPERTY_CITY],'') +
	CASE WHEN  [PROPERTY_CITY] + [PROPERTY_STATE] IS NOT NULL THEN ', ' ELSE '' END +
	ISNULL([PROPERTY_STATE],'') +
	CASE WHEN  [PROPERTY_STATE] + [PROPERTY_ZIP] IS NOT NULL THEN ', ' ELSE '' END +
	ISNULL([PROPERTY_ZIP],'') AddrLine2
  FROM vProperty
  WHERE UNIQUEID = @uniqueID
)

--------------------------------------------------------------

USE [RPAD]
GO

/****** Object:  Table [dbo].[AccountTaxRecord]    Script Date: 4/24/2015 11:06:34 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[AccountTaxRecord](
	[TaxRecordID] [int] IDENTITY(1,1) NOT NULL,
	[AccountID] [int] NULL,
	[ServiceT] [varchar](20) NULL DEFAULT ('NA'),
	[VerificationT] [varchar](20) NULL DEFAULT ('NA'),
	[ApprovalStatusT] [varchar](20) NULL DEFAULT ('QUEUE'),
	[OptInFlag] [bit] NULL,
	[UNIQUEID] [varchar](17) NULL,
	[PARID] [varchar](12) NULL,
	[OWN1] [varchar](40) NULL,
	[OWNSEQ] [smallint] NULL,
	[SSN4] [varchar](4) NULL,
	[ID_UNIQUE_ID] [varchar](17) NULL,
	[ID_PARID] [varchar](12) NULL,
	[ID_SSN] [varchar](12) NULL,
	[ID_DOB] [varchar](8) NULL,
	[ID_LicenseNumber] [varchar](20) NULL,
	[NewOwnerFirstName] [varchar](20) NULL,
	[NewOwnerMI] [varchar](1) NULL,
	[NewOwnerLastName] [varchar](40) NULL,
	[CanFileAppeal] [bit] NULL DEFAULT ((1)),
	[CanFileExemption] [bit] NULL DEFAULT ((0)),
	[CanRemoveExemptionCOS] [bit] NULL DEFAULT ((0)),
	[CanChangeMailingAddressCOS] [bit] NULL DEFAULT ((0)),
	[CanModifyCareOfAddresseeCOS] [bit] NULL DEFAULT ((0)),
	[Notes] [nvarchar](max) NULL,
	[CreateDT] [datetime] NULL DEFAULT (getdate()),
	[SubmitDT] [datetime] NULL,
	[PendingDT] [datetime] NULL,
	[ProcessDT] [datetime] NULL,
	[IsActive] [bit] NULL DEFAULT ((0)),
	[ActivationNotificationSentDT] [datetime] NULL,
	[DeletetionStatusCode] [varchar](20) NULL,
	[DeletionNotificationSentDT] [datetime] NULL,
	[OriginPropertyBatchID] [int] NULL,
	[VerifyPropertyBatchID] [int] NULL,
	[LastVerificationDT] [datetime] NULL,
	[MergeStatus] [varchar](20) NULL,
	[legacyID] [int] NULL,
	[SourceCode] [varchar](20) NULL,
	[SuperKey]  AS ([UNIQUEID]+[OWN1]),
PRIMARY KEY CLUSTERED 
(
	[TaxRecordID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[AccountTaxRecord]  WITH CHECK ADD  CONSTRAINT [FK_AccountTaxRecord_Account] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([AccountID])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[AccountTaxRecord] CHECK CONSTRAINT [FK_AccountTaxRecord_Account]
GO

ALTER TABLE [dbo].[AccountTaxRecord]  WITH CHECK ADD CHECK  (([dbo].[VarDefHasValue]('APPROVAL_STATUS_T',[ApprovalStatusT])=(1)))
GO

ALTER TABLE [dbo].[AccountTaxRecord]  WITH CHECK ADD CHECK  (([dbo].[VarDefHasValue]('SERVICE_T',[ServiceT])=(1)))
GO

ALTER TABLE [dbo].[AccountTaxRecord]  WITH CHECK ADD CHECK  (([dbo].[VarDefHasValue]('VERIFICATION_T',[VerificationT])=(1)))
GO




