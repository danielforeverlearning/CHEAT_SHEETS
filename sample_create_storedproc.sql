IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.ROUTINES
	WHERE SPECIFIC_NAME = N'AdminUser_insert')
		DROP PROCEDURE AdminUser_insert;
GO
 
CREATE PROCEDURE AdminUser_insert
	 @UserName varchar(30)
	,@UserPwd varchar(100)
	,@FirstName varchar(20)
	,@LastName varchar(20)
	,@Phone varchar(20) = NULL
	,@Title varchar(50) = NULL
	,@MailingAddress varchar(100) = NULL
	,@EmailAddress varchar(50)
	,@UserRole varchar(20)
	,@ActiveFl bit
	,@LockFl bit
	,@LastLoginDT datetime = NULL
	,@LoginCount int = NULL
ASBEGIN
DECLARE @newid int;
 
INSERT AdminUser (
	 UserName
	,UserPwd
	,FirstName
	,LastName
	,Phone
	,Title
	,MailingAddress
	,EmailAddress
	,UserRole
	,ActiveFl
	,CreateDT
	,ModifyDT
	,LockFl
	,LastLoginDT
	,LoginCount
)
VALUES (
	 @UserName
	,@UserPwd
	,@FirstName
	,@LastName
	,@Phone
	,@Title
	,@MailingAddress
	,@EmailAddress
	,@UserRole
	,@ActiveFl
	,GETDATE()
	,GETDATE()
	,@LockFl
	,@LastLoginDT
	,@LoginCount
);
SELECT @newid = @@IDENTITY;
RETURN @newid;
 
END
GO
-------------------------------------------------------------------------------
