IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.ROUTINES
	WHERE SPECIFIC_NAME = N'AccountTaxRecord_insert')
		DROP PROCEDURE AccountTaxRecord_insert;
GO
 
CREATE PROCEDURE AccountTaxRecord_insert
	 @AccountID int = NULL
	,@ServiceT varchar(20) = NULL
	,@VerificationT varchar(20) = NULL
	,@ApprovalStatusT varchar(20) = NULL
	,@OptInFlag bit = NULL
	,@UNIQUEID varchar(17) = NULL
	,@PARID varchar(12) = NULL
	,@OWN1 varchar(40) = NULL
	,@OWNSEQ smallint = NULL
	,@SSN4 varchar(4) = NULL
	,@ID_UNIQUE_ID varchar(17) = NULL
	,@ID_PARID varchar(12) = NULL
	,@ID_SSN varchar(12) = NULL
	,@ID_DOB varchar(8) = NULL
	,@ID_LicenseNumber varchar(20) = NULL
	,@NewOwnerFirstName varchar(20) = NULL
	,@NewOwnerMI varchar(1) = NULL
	,@NewOwnerLastName varchar(40) = NULL
	,@CanFileAppeal bit = NULL
	,@CanFileExemption bit = NULL
	,@CanRemoveExemptionCOS bit = NULL
	,@CanChangeMailingAddressCOS bit = NULL
	,@CanModifyCareOfAddresseeCOS bit = NULL
	,@Notes nvarchar = NULL
	,@SubmitDT datetime = NULL
	,@PendingDT datetime = NULL
	,@ProcessDT datetime = NULL
	,@IsActive bit = NULL
	,@ActivationNotificationSentDT datetime = NULL
	,@DeletetionStatusCode varchar(20) = NULL
	,@DeletionNotificationSentDT datetime = NULL
	,@OriginPropertyBatchID int = NULL
	,@VerifyPropertyBatchID int = NULL
	,@LastVerificationDT datetime = NULL
	,@MergeStatus varchar(20) = NULL
	,@legacyID int = NULL
	,@SourceCode varchar(20) = NULL
ASBEGIN
DECLARE @newid int;
 
INSERT AccountTaxRecord (
	 AccountID
	,ServiceT
	,VerificationT
	,ApprovalStatusT
	,OptInFlag
	,UNIQUEID
	,PARID
	,OWN1
	,OWNSEQ
	,SSN4
	,ID_UNIQUE_ID
	,ID_PARID
	,ID_SSN
	,ID_DOB
	,ID_LicenseNumber
	,NewOwnerFirstName
	,NewOwnerMI
	,NewOwnerLastName
	,CanFileAppeal
	,CanFileExemption
	,CanRemoveExemptionCOS
	,CanChangeMailingAddressCOS
	,CanModifyCareOfAddresseeCOS
	,Notes
	,CreateDT
	,SubmitDT
	,PendingDT
	,ProcessDT
	,IsActive
	,ActivationNotificationSentDT
	,DeletetionStatusCode
	,DeletionNotificationSentDT
	,OriginPropertyBatchID
	,VerifyPropertyBatchID
	,LastVerificationDT
	,MergeStatus
	,legacyID
	,SourceCode
)
VALUES (
	 @AccountID
	,@ServiceT
	,@VerificationT
	,@ApprovalStatusT
	,@OptInFlag
	,@UNIQUEID
	,@PARID
	,@OWN1
	,@OWNSEQ
	,@SSN4
	,@ID_UNIQUE_ID
	,@ID_PARID
	,@ID_SSN
	,@ID_DOB
	,@ID_LicenseNumber
	,@NewOwnerFirstName
	,@NewOwnerMI
	,@NewOwnerLastName
	,@CanFileAppeal
	,@CanFileExemption
	,@CanRemoveExemptionCOS
	,@CanChangeMailingAddressCOS
	,@CanModifyCareOfAddresseeCOS
	,@Notes
	,GETDATE()
	,@SubmitDT
	,@PendingDT
	,@ProcessDT
	,@IsActive
	,@ActivationNotificationSentDT
	,@DeletetionStatusCode
	,@DeletionNotificationSentDT
	,@OriginPropertyBatchID
	,@VerifyPropertyBatchID
	,@LastVerificationDT
	,@MergeStatus
	,@legacyID
	,@SourceCode
);
SELECT @newid = @@IDENTITY;
RETURN @newid;
 
END
GO
-------------------------------------------------------------------------------
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.ROUTINES
	WHERE SPECIFIC_NAME = N'AccountTaxRecord_update')
		DROP PROCEDURE AccountTaxRecord_update;
GO
 
CREATE PROCEDURE AccountTaxRecord_update
	 @TaxRecordID int
	,@AccountID int = NULL
	,@ServiceT varchar(20) = NULL
	,@VerificationT varchar(20) = NULL
	,@ApprovalStatusT varchar(20) = NULL
	,@OptInFlag bit = NULL
	,@UNIQUEID varchar(17) = NULL
	,@PARID varchar(12) = NULL
	,@OWN1 varchar(40) = NULL
	,@OWNSEQ smallint = NULL
	,@SSN4 varchar(4) = NULL
	,@ID_UNIQUE_ID varchar(17) = NULL
	,@ID_PARID varchar(12) = NULL
	,@ID_SSN varchar(12) = NULL
	,@ID_DOB varchar(8) = NULL
	,@ID_LicenseNumber varchar(20) = NULL
	,@NewOwnerFirstName varchar(20) = NULL
	,@NewOwnerMI varchar(1) = NULL
	,@NewOwnerLastName varchar(40) = NULL
	,@CanFileAppeal bit = NULL
	,@CanFileExemption bit = NULL
	,@CanRemoveExemptionCOS bit = NULL
	,@CanChangeMailingAddressCOS bit = NULL
	,@CanModifyCareOfAddresseeCOS bit = NULL
	,@Notes nvarchar = NULL
	,@SubmitDT datetime = NULL
	,@PendingDT datetime = NULL
	,@ProcessDT datetime = NULL
	,@IsActive bit = NULL
	,@ActivationNotificationSentDT datetime = NULL
	,@DeletetionStatusCode varchar(20) = NULL
	,@DeletionNotificationSentDT datetime = NULL
	,@OriginPropertyBatchID int = NULL
	,@VerifyPropertyBatchID int = NULL
	,@LastVerificationDT datetime = NULL
	,@MergeStatus varchar(20) = NULL
	,@legacyID int = NULL
	,@SourceCode varchar(20) = NULL
ASBEGIN
UPDATE AccountTaxRecord SET
	 AccountID = @AccountID
	,ServiceT = @ServiceT
	,VerificationT = @VerificationT
	,ApprovalStatusT = @ApprovalStatusT
	,OptInFlag = @OptInFlag
	,UNIQUEID = @UNIQUEID
	,PARID = @PARID
	,OWN1 = @OWN1
	,OWNSEQ = @OWNSEQ
	,SSN4 = @SSN4
	,ID_UNIQUE_ID = @ID_UNIQUE_ID
	,ID_PARID = @ID_PARID
	,ID_SSN = @ID_SSN
	,ID_DOB = @ID_DOB
	,ID_LicenseNumber = @ID_LicenseNumber
	,NewOwnerFirstName = @NewOwnerFirstName
	,NewOwnerMI = @NewOwnerMI
	,NewOwnerLastName = @NewOwnerLastName
	,CanFileAppeal = @CanFileAppeal
	,CanFileExemption = @CanFileExemption
	,CanRemoveExemptionCOS = @CanRemoveExemptionCOS
	,CanChangeMailingAddressCOS = @CanChangeMailingAddressCOS
	,CanModifyCareOfAddresseeCOS = @CanModifyCareOfAddresseeCOS
	,Notes = @Notes
	,SubmitDT = @SubmitDT
	,PendingDT = @PendingDT
	,ProcessDT = @ProcessDT
	,IsActive = @IsActive
	,ActivationNotificationSentDT = @ActivationNotificationSentDT
	,DeletetionStatusCode = @DeletetionStatusCode
	,DeletionNotificationSentDT = @DeletionNotificationSentDT
	,OriginPropertyBatchID = @OriginPropertyBatchID
	,VerifyPropertyBatchID = @VerifyPropertyBatchID
	,LastVerificationDT = @LastVerificationDT
	,MergeStatus = @MergeStatus
	,legacyID = @legacyID
	,SourceCode = @SourceCode
WHERE TaxRecordID = @TaxRecordID;
 
END
GO
-------------------------------------------------------------------------------
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.ROUTINES
	WHERE SPECIFIC_NAME = N'AccountTaxRecord_delete')
		DROP PROCEDURE AccountTaxRecord_delete;
GO
 
CREATE PROCEDURE AccountTaxRecord_delete
	@TaxRecordID int
	,@softDelete bit = 1
ASBEGIN
IF @softDelete = 0
BEGIN
	DELETE AccountTaxRecord WHERE TaxRecordID = @TaxRecordID;
END
ELSE
BEGIN
	UPDATE AccountTaxRecord SET isActive = 0 WHERE TaxRecordID = @TaxRecordID;
END
 
END
GO
-------------------------------------------------------------------------------
