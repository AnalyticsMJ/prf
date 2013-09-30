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
