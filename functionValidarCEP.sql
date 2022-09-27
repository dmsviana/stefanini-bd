CREATE FUNCTION function_validar_cep(@cep CHAR(8))
RETURNS BIT
AS 
BEGIN
	DECLARE @count INT
	DECLARE @caractere CHAR
    DECLARE @tamanho INT

	SELECT @tamanho = LEN(@cep)
	SELECT @count = 8

    IF (@tamanho < 8)
        RETURN 0
        
    WHILE (@count > 0)
    BEGIN
         SELECT @caractere = LEFT(@cep,1)

        IF CHARINDEX(@caractere,'0123456789') = 0
        BEGIN
            RETURN 0
            BREAK
        END
        
        SET @cep = STUFF(@cep,1,1,'')
		SET @count = @count - 1
    END
    
    RETURN 1
END