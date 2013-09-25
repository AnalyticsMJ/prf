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


-- load ocorrenciapessoa
LOAD DATA LOCAL INFILE '/Users/roliveir/projects/prf/temp/brbrasil_1_semestre_2007/ocorrenciaPessoa_1_Semestre_2007.csv'
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
opeanexo = nullif(@opeanexo,'(null)')
;


-- load ocorrenciaacidente
LOAD DATA LOCAL INFILE '/Users/roliveir/projects/prf/temp/brbrasil_1_semestre_2007/ocorrenciaacidente_1_Semestre_2007.csv'
INTO TABLE ocorrenciaacidente
CHARACTER SET latin1
FIELDS TERMINATED BY ';'
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(oacocoid,oacttacodigo,oactcacodigo,oacdano,@oacdanoterc,@oacdanoamb,
 oaclatitude,oaclongitude,@oacdistab,@oacdistac,@oacdistbc,@oacmodelopista,
 oacsentido1,oacsentido2,@oacqtdfaixa1,@oacqtdfaixa2,@oacacostamento1,
 @oacacostamento2,@oaccanteiro,@oaclinhacentral,@oacorientpista,
 @oacgirafundo,oacversaocroqui,@oacsitio)
SET
oacdistab = nullif(@oacdistab,'(null)'),
oacdistac = nullif(@oacdistac,'(null)'),
oacdistbc = nullif(@oacdistbc,'(null)'),
oaclinhacentral = nullif(@oaclinhacentral,'(null)'),
oacsitio = nullif(@oacsitio,'(null)'),
oaccanteiro = nullif(@oaccanteiro,'(null)'),
oacorientpista = nullif(@oacorientpista,'(null)'),
oacgirafundo = nullif(@oacgirafundo,'(null)'),
oacqtdfaixa1 = nullif(@oacqtdfaixa1,'(null)'),
oacqtdfaixa2 = nullif(@oacqtdfaixa2,'(null)'),
oacacostamento1 = nullif(@oacacostamento1,'(null)'),
oacacostamento2 = nullif(@oacacostamento2,'(null)'),
oacdanoterc = nullif(@oacdanoterc,'(null)'),
oacdanoamb = nullif(@oacdanoamb,'(null)'),
oacmodelopista = nullif(@oacmodelopista,'(null)')
;


-- corveiculo nao existe

-- load localbr
LOAD DATA LOCAL INFILE '/Users/rcavalca/projects/prf/temp/localbr.csv'
INTO TABLE localbr 
FIELDS TERMINATED BY ';'
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

-- marcadeveiculo nao existe

-- load mucipio

LOAD DATA LOCAL INFILE '/Users/rcavalca/projects/prf/temp/municipio.csv'
INTO TABLE municipio 
FIELDS TERMINATED BY ';'
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
;

-- load ocorrenciaveiculo
LOAD DATA LOCAL INFILE '/Users/rcavalca/projects/prf/temp/ocorrenciaveiculo.csv' 
INTO TABLE ocorrenciaveiculo 
FIELDS TERMINATED BY '|' 
OPTIONALLY ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 LINES ;

-- load tipoacidente
LOAD DATA LOCAL INFILE '/Users/rcavalca/projects/prf/temp/tipoAcidente.csv' 
INTO TABLE tipoacidente 
character set latin1
FIELDS TERMINATED BY ';'   
IGNORE 1 LINES 
(ttacodigo,ttadescricao,ttaatualiza,@ttarelacidente,ttaativo)
SET
ttarelacidente = nullif(@ttarelacidente,'(null)');

-- load tipoapreensao
LOAD DATA LOCAL INFILE '/Users/rcavalca/projects/prf/temp/tipoApreensao.csv' 
INTO TABLE tipoapreensao 
character set latin1
FIELDS TERMINATED BY ';'   
IGNORE 1 LINES ;

-- load tipoareaespecial
LOAD DATA LOCAL INFILE '/Users/rcavalca/projects/prf/temp/tipoAreaEspecial.csv' 
INTO TABLE tipoareaespecial 
character set latin1
FIELDS TERMINATED BY ';'   
IGNORE 1 LINES ;

-- load tipodetencao
LOAD DATA LOCAL INFILE '/Users/rcavalca/projects/prf/temp/tipodetencao.csv' 
INTO TABLE tipodetencao 
character set latin1
FIELDS TERMINATED BY ';'   
IGNORE 1 LINES 
(ttdcodigo,ttddescricao,ttdatualiza,@ttdrelacidente)
SET
ttdrelacidente = nullif(@ttdrelacidente,'(null)');

-- load tipodocumento
LOAD DATA LOCAL INFILE '/Users/rcavalca/projects/prf/temp/tipodocumento.csv' 
INTO TABLE tipodocumento 
character set latin1
FIELDS TERMINATED BY ';'   
IGNORE 1 LINES 
(ttocodigo,ttodescricao,ttoatualiza,@ttorelapreensao,@ttorelrecuperacao)
SET
ttorelapreensao = nullif(@ttorelapreensao,'(null)'),
ttorelrecuperacao = nullif(@ttorelrecuperacao,'(null)');

-- load tipoenvolvido
LOAD DATA LOCAL INFILE '/Users/rcavalca/projects/prf/temp/tipoenvolvido.csv' 
INTO TABLE tipoenvolvido 
character set latin1
FIELDS TERMINATED BY ';'   
IGNORE 1 LINES ;


-- load tiporeceptor
LOAD DATA LOCAL INFILE '/Users/rcavalca/projects/prf/temp/tiporeceptor.csv' 
INTO TABLE tiporeceptor 
character set latin1
FIELDS TERMINATED BY ';'   
IGNORE 1 LINES 
(ttrcodigo,ttrdescricao,ttratualiza,@ttrdelegacia)
SET
ttrdelegacia = nullif(@ttrdelegacia,'(null)');


-- load tipoveiculo
LOAD DATA LOCAL INFILE '/Users/rcavalca/projects/prf/temp/tipoveiculo.csv' 
INTO TABLE tipoveiculo 
character set latin1
FIELDS TERMINATED BY ';'   
IGNORE 1 LINES 
(tvvcodigo,tvvdescricao,tvvatualiza,@tvvrelacidente,tvvativo)
SET 
tvvrelacidente = nullif(@tvvrelacidente,'(null)');


-- load uf
LOAD DATA LOCAL INFILE '/Users/rcavalca/projects/prf/temp/uf.csv' 
INTO TABLE uf 
character set latin1
FIELDS TERMINATED BY ';'   
IGNORE 1 LINES ;


-- load tipounidadeoperacional
LOAD DATA LOCAL INFILE '/Users/rcavalca/projects/prf/temp/tipounidadeoperacional.csv' 
INTO TABLE tipounidadeoperacional 
character set latin1
FIELDS TERMINATED BY ';'   
IGNORE 1 LINES ;
