
CREATE FUNCTION functionValidarEmail(@email varchar(max))
RETURNS BIT
AS BEGIN
 
    DECLARE @Retorno BIT = 0
 
    SELECT @Retorno = 1
    WHERE @email NOT LIKE '%[^a-z,0-9,@,.,_,-]%'
    AND @email LIKE '%_@_%_.__%'
    AND @email NOT LIKE '%_@@_%_.__%'
 
    RETURN @Retorno
 
END