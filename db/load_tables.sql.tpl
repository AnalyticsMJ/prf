USE prf;

-- load pessoa
LOAD DATA LOCAL INFILE '{%data_dir%}/tabelaPessoa.csv'
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



-- load veiculo
LOAD DATA LOCAL INFILE '{%data_dir%}/veiculo.csv'
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


-- corveiculo nao existe

-- load localbr
LOAD DATA LOCAL INFILE '{%data_dir%}/localbr.csv'
INTO TABLE localbr 
FIELDS TERMINATED BY ';'
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

-- marcadeveiculo nao existe

-- load mucipio

LOAD DATA LOCAL INFILE '{%data_dir%}/municipio.csv'
INTO TABLE municipio 
FIELDS TERMINATED BY ';'
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
;

-- load ocorrenciaveiculo
LOAD DATA LOCAL INFILE '{%data_dir%}/ocorrenciaveiculo.csv' 
INTO TABLE ocorrenciaveiculo 
FIELDS TERMINATED BY '|' 
OPTIONALLY ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 LINES ;

-- load tipoacidente
LOAD DATA LOCAL INFILE '{%data_dir%}/tipoAcidente.csv' 
INTO TABLE tipoacidente 
character set latin1
FIELDS TERMINATED BY ';'   
IGNORE 1 LINES 
(ttacodigo,ttadescricao,ttaatualiza,@ttarelacidente,ttaativo)
SET
ttarelacidente = nullif(@ttarelacidente,'(null)');

-- load tipoapreensao
LOAD DATA LOCAL INFILE '{%data_dir%}/tipoApreensao.csv' 
INTO TABLE tipoapreensao 
character set latin1
FIELDS TERMINATED BY ';'   
IGNORE 1 LINES ;

-- load tipoareaespecial
LOAD DATA LOCAL INFILE '{%data_dir%}/tipoAreaEspecial.csv' 
INTO TABLE tipoareaespecial 
character set latin1
FIELDS TERMINATED BY ';'   
IGNORE 1 LINES ;

-- load tipodetencao
LOAD DATA LOCAL INFILE '{%data_dir%}/tipodetencao.csv' 
INTO TABLE tipodetencao 
character set latin1
FIELDS TERMINATED BY ';'   
IGNORE 1 LINES 
(ttdcodigo,ttddescricao,ttdatualiza,@ttdrelacidente)
SET
ttdrelacidente = nullif(@ttdrelacidente,'(null)');

-- load tipodocumento
LOAD DATA LOCAL INFILE '{%data_dir%}/tipodocumento.csv' 
INTO TABLE tipodocumento 
character set latin1
FIELDS TERMINATED BY ';'   
IGNORE 1 LINES 
(ttocodigo,ttodescricao,ttoatualiza,@ttorelapreensao,@ttorelrecuperacao)
SET
ttorelapreensao = nullif(@ttorelapreensao,'(null)'),
ttorelrecuperacao = nullif(@ttorelrecuperacao,'(null)');

-- load tipoenvolvido
LOAD DATA LOCAL INFILE '{%data_dir%}/tipoenvolvido.csv' 
INTO TABLE tipoenvolvido 
character set latin1
FIELDS TERMINATED BY ';'   
IGNORE 1 LINES ;


-- load tiporeceptor
LOAD DATA LOCAL INFILE '{%data_dir%}/tiporeceptor.csv' 
INTO TABLE tiporeceptor 
character set latin1
FIELDS TERMINATED BY ';'   
IGNORE 1 LINES 
(ttrcodigo,ttrdescricao,ttratualiza,@ttrdelegacia)
SET
ttrdelegacia = nullif(@ttrdelegacia,'(null)');


-- load tipoveiculo
LOAD DATA LOCAL INFILE '{%data_dir%}/tipoveiculo.csv' 
INTO TABLE tipoveiculo 
character set latin1
FIELDS TERMINATED BY ';'   
IGNORE 1 LINES 
(tvvcodigo,tvvdescricao,tvvatualiza,@tvvrelacidente,tvvativo)
SET 
tvvrelacidente = nullif(@tvvrelacidente,'(null)');


-- load uf
LOAD DATA LOCAL INFILE '{%data_dir%}/uf.csv' 
INTO TABLE uf 
character set latin1
FIELDS TERMINATED BY ';'   
IGNORE 1 LINES ;


-- load tipounidadeoperacional
LOAD DATA LOCAL INFILE '{%data_dir%}/tipounidadeoperacional.csv' 
INTO TABLE tipounidadeoperacional 
character set latin1
FIELDS TERMINATED BY ';'   
IGNORE 1 LINES ;


-- load uf_estatistica
LOAD DATA LOCAL INFILE '{%data_dir%}/uf_stat.csv' 
INTO TABLE ufestatistica
FIELDS TERMINATED BY ';'   
IGNORE 1 LINES ;



-- load estadofisico
LOAD DATA LOCAL INFILE '{%data_dir%}/estadofisico.csv' 
INTO TABLE estadofisico
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'   
IGNORE 1 LINES ;


-- load rodovias_br
LOAD DATA LOCAL INFILE '{%data_dir%}/rodovias_br.csv' 
INTO TABLE rodovias
character set latin1
FIELDS TERMINATED BY ','   
IGNORE 1 LINES ;
