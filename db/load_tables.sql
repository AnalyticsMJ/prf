-- load veiculo
LOAD DATA LOCAL INFILE 'C:/Users/Rafael/Documents/GitHub/prf/data/veiculo/veiculo.csv'
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

SELECT * FROM veiculo WHERE veiid = 2685160;

-- load pessoa
LOAD DATA LOCAL INFILE 'C:/Users/Rafael/Documents/GitHub/prf/data/pessoa/pessoa_1_Semestre_2007.csv'
INTO TABLE pessoa 
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(pesid,@dummy,pesnaturalidade,pesnacionalidade,pessexo,pesteccodigo,pestgicodigo,pesmunicipio,pestopcodigo,pesmunicipioori,pespaisori,
 pesmunicipiodest,pespaisdest,pesveiid,pesestadofisico,pescinto,pescapacete,peshabilitado,pessocorrido,pesdormindo,pesalcool,
 peskmpercorre,peshorapercorre,@dummy,@dummy,@dummy,pesdatahabil,pesdatavalidade,pesidade,pesaltura,pespeso,@dummy,
 @dummy,pessinal,peslesao,pestcccodigo,pestctcodigo,pestclcodigo,pesoenid);

