USE prf;

-- load veiculo
LOAD DATA LOCAL INFILE '/Users/roliveir/projects/prf/temp/veiculo.csv'
INTO TABLE veiculo 
FIELDS TERMINATED BY '|'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(veiid, veiano, @veitmvcodigo, @veiqtdocupantes, @veitevcodigo, @veitcvcodigo, @veitvvcodigo, @dummy, veimunicipio, @veitcecodigo,
 veimunorigem, @veipaisorigem, veimundestino, @veipaisdestino, veitttcodigo, veitipoproprietario, @veiproprietario, @veioenid, @veisequencial, @dummy)
SET 
veioenid = nullif(@veioenid,''),
veiqtdocupantes = nullif(@veiqtdocupantes,''),
veitevcodigo = nullif(@veitevcodigo,''),
veitvvcodigo = nullif(@veitvvcodigo,''),
veitcecodigo = nullif(@veitcecodigo,''),
veitcecodigo = nullif(@veitcecodigo,''),
veipaisdestino = nullif(@veipaisdestino,''),
veisequencial = nullif(@veisequencial,''),
veitmvcodigo = nullif(@veitmvcodigo,''),
veitcvcodigo = nullif(@veitcvcodigo,''),
veipaisorigem = nullif(@veipaisorigem,'');

-- load pessoa
LOAD DATA LOCAL INFILE '/Users/roliveir/projects/prf/temp/brbrasil_1_semestre_2007/pessoa_1_Semestre_2007.csv'
INTO TABLE pessoa 
FIELDS TERMINATED BY ';'
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(pesid,@dummy,pesnaturalidade,@pesnacionalidade,@pessexo,@pesteccodigo,@pestgicodigo,pesmunicipio,@pestopcodigo,pesmunicipioori,@pespaisori,
 pesmunicipiodest,@pespaisdest,@pesveiid,@pesestadofisico,@pescinto,@pescapacete,@peshabilitado,pessocorrido,pesdormindo,@pesalcool,
 @peskmpercorre,@peshorapercorre,@dummy,@dummy,@dummy,@pesdatahabil,@pesdatavalidade,@pesidade,@pesaltura,@pespeso,@dummy,
 @dummy,@pessinal,@peslesao,@pestcccodigo,@pestctcodigo,@pestclcodigo,@pesoenid)
SET
pesnacionalidade = nullif(@pesnacionalidade,'(null)'),
pessexo = nullif(@pessexo,'(null)'),
pesteccodigo = nullif(@pesteccodigo,'(null)'),
pestgicodigo = nullif(@pestgicodigo,'(null)'),
pestopcodigo = nullif(@pestopcodigo,'(null)'),
pespaisori = nullif(@pespaisori,'(null)'),
pespaisdest = nullif(@pespaisdest,'(null)'),
pesveiid = nullif(@pesveiid,'(null)'),
pesestadofisico = nullif(@pesestadofisico,'(null)'),
pescinto = nullif(@pescinto,'(null)'),
pescapacete = nullif(@pescapacete,'(null)'),
peshabilitado = nullif(@peshabilitado,'(null)'),
pesalcool = nullif(@pesalcool,'(null)'),
peshorapercorre= nullif(@peshorapercorre,'(null)'),
peskmpercorre = nullif(@peskmpercorre,'(null)'),
pesdatahabil = nullif(@pesdatahabil,'(null)'),
pesdatavalidade = nullif(@pesdatavalidade,'(null)'),
pesidade = nullif(@pesidade,'(null)'),
pesaltura = nullif(@pesaltura,'(null)'),
pespeso = nullif(@pespeso,'(null)'),
pessinal = nullif(@pessinal,'(null)'),
peslesao = nullif(@peslesao,'(null)'),
pestcccodigo = nullif(@pestcccodigo,'(null)'),
pestctcodigo = nullif(@pestctcodigo,'(null)'),
pestclcodigo = nullif(@pestclcodigo,'(null)'),
pesoenid = nullif(@pesoenid,'(null)');

-- load ocorrencia
LOAD DATA LOCAL INFILE '/Users/roliveir/projects/prf/temp/brbrasil_1_semestre_2007/ocorrencia_1_Semestre_2007.csv'
INTO TABLE ocorrencia 
FIELDS TERMINATED BY ';'
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(ocoid,ocolocal,ocostatus,@ocomunicipio,ocosentido,ocodataocorrencia,ocodataregistro,ocotipo,ococomid,@ocoidorigem,ocodatafim)
SET
ocoidorigem = nullif(@ocoidorigem,'(null)'),
ocomunicipio = nullif(@ocomunicipio,'(null)');



