-- load pessoa
LOAD DATA LOCAL INFILE '{%data_dir%}/brbrasil_{%sem%}_semestre_{%ano%}/pessoa_{%sem%}_Semestre_{%ano%}.csv'
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
LOAD DATA LOCAL INFILE '{%data_dir%}/brbrasil_{%sem%}_semestre_{%ano%}/ocorrencia_{%sem%}_Semestre_{%ano%}.csv'
INTO TABLE ocorrencia 
FIELDS TERMINATED BY ';'
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(ocoid,ocolocal,ocostatus,@ocomunicipio,ocosentido,ocodataocorrencia,ocodataregistro,ocotipo,ococomid,@ocoidorigem,ocodatafim)
SET
ocoidorigem = nullif(@ocoidorigem,'(null)'),
ocomunicipio = nullif(@ocomunicipio,'(null)');


-- load ocorrenciapessoa
LOAD DATA LOCAL INFILE '{%data_dir%}/brbrasil_{%sem%}_semestre_{%ano%}/ocorrenciaPessoa_{%sem%}_Semestre_{%ano%}.csv'
INTO TABLE ocorrenciapessoa
CHARACTER SET latin1
FIELDS TERMINATED BY ';'
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(opeid,opeocoid,opepesid,@dummy,@opeportevalidade,
 @opettecodigo,@dummy,@opeestrangeiro,@opeanexo,@opecondalegadas)
SET
opeportevalidade = nullif(@opeportevalidade,'(null)'),
opecondalegadas = nullif(@opecondalegadas,'(null)'),
opeestrangeiro = nullif(@opeestrangeiro,'(null)'),
opettecodigo = nullif(@opettecodigo,'(null)'),
opeanexo = nullif(@opeanexo,'(null)');

-- load ocorrenciaacidente
LOAD DATA LOCAL INFILE '{%data_dir%}/brbrasil_{%sem%}_semestre_{%ano%}/ocorrenciaacidente_{%sem%}_Semestre_{%ano%}.csv'
INTO TABLE ocorrenciaacidente
CHARACTER SET latin1
FIELDS TERMINATED BY ';'
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(oacocoid,oacttacodigo,oactcacodigo,oacdano,@oacdanoterc,@oacdanoamb,
 oaclatitude,oaclongitude,@oacdistab,@oacdistac,@oacdistbc,@oacmodelopista,
 oacsentido1,oacsentido2,@oacqtdfaixa1,@oacqtdfaixa2,@oacacostamento1,
 @oacacostamento2,@dummy,@dummy,@oacorientpista,
 @dummy,oacversaocroqui,@oacsitio)
SET
oacdistab = nullif(@oacdistab,'(null)'),
oacdistac = nullif(@oacdistac,'(null)'),
oacdistbc = nullif(@oacdistbc,'(null)'),
oacsitio = nullif(@oacsitio,'(null)'),
oacorientpista = nullif(@oacorientpista,'(null)'),
oacqtdfaixa1 = nullif(@oacqtdfaixa1,'(null)'),
oacqtdfaixa2 = nullif(@oacqtdfaixa2,'(null)'),
oacacostamento1 = nullif(@oacacostamento1,'(null)'),
oacacostamento2 = nullif(@oacacostamento2,'(null)'),
oacdanoterc = nullif(@oacdanoterc,'(null)'),
oacdanoamb = nullif(@oacdanoamb,'(null)'),
oacmodelopista = nullif(@oacmodelopista,'(null)');
