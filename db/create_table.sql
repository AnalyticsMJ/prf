DROP DATABASE prf;
CREATE DATABASE prf;
USE prf;

CREATE TABLE veiculo (
  veiid INT AUTO_INCREMENT PRIMARY KEY,
  veiano CHAR(4),
  veitmvcodigo INT,
  veiqtdocupantes INT,
  veitevcodigo INT,
  veitcvcodigo INT,
  veitvvcodigo INT,
  veimunicipio CHAR(5),
  veitcecodigo INT,
  veimunorigem CHAR(5),
  veipaisorigem INT,
  veimundestino CHAR(5),
  veipaisdestino INT,
  veitttcodigo INT,
  veitipoproprietario CHAR(1),
  veiproprietario INT,
  veioenid INT,
  veisequencial INT
);

CREATE TABLE pessoa (
  pesid INT AUTO_INCREMENT PRIMARY KEY,
  pesexpedidor CHAR(10),
  pesufexpedidora CHAR(2),
  pesnaturalidade CHAR(5),
  pesnacionalidade INT,
  pessexo CHAR(1),
  pesteccodigo INT,
  pestgicodigo INT,
  pesmunicipio CHAR(5),
  pestopcodigo INT,
  pesmunicipioori CHAR(5),
  pespaisori INT,
  pesmunicipiodest CHAR(5),
  pespaisdest INT,
  pesveiid INT, -- foreign key (veiculo)
  pesestadofisico SMALLINT,
  pescinto char(1),
  pescapacete CHAR(1),
  peshabilitado CHAR(1),
  pessocorrido CHAR(1),
  pesdormindo CHAR(1),
  pesalcool CHAR(1),
  peskmpercorre DECIMAL(5,1),
  peshorapercorre CHAR(4),
  pesdatahabil DATE,
  pesdatavalidade DATE,
  pesidade INT,
  pesaltura DECIMAL(3,2),
  pespeso INT,
  pessinal CHAR(1),
  peslesao CHAR(1),
  pestcccodigo INT,
  pestctcodigo INT,
  pestclcodigo INT,
  pesoenid INT
);
CREATE TABLE ocorrencia (
  ocoid INT AUTO_INCREMENT PRIMARY KEY, 
  ocolocal INT, 
  ocostatus CHAR(1), 
  ocomunicipio CHAR(5), 
  ocosentido CHAR(1), 
  ocodataocorrencia DATETIME, -- year to second
  ocodataregistro DATETIME, 
  ocotipo CHAR(2), 
  ococomid INT, 
  ocoidorigem INT, 
  ococpfretif CHAR(11), 
  ocodatafim DATETIME, 
  ocoresolucao_monta CHAR(10)
);

CREATE TABLE tipoenvolvido (
  ttecodigo INT AUTO_INCREMENT PRIMARY KEY,
  tteatualiza CHAR(1),
  tteativo CHAR(1)	
);

CREATE TABLE tipoacidente (
  ttacodigo INT AUTO_INCREMENT PRIMARY KEY,
  ttaatualiza CHAR(1),
  ttarelacidente CHAR(1), 
  ttaativo CHAR(1)	
);

CREATE TABLE tipoveiculo (
  tvvcodigo INT AUTO_INCREMENT PRIMARY KEY,
  tvvatualiza CHAR(1),
  tvvrelacidente CHAR(1),
  tvvativo CHAR(1)		
);

CREATE TABLE municipio (
  tmucodigo CHAR(5) PRIMARY KEY,
  tmuuf CHAR(2),
  tmuatualiza CHAR(1)
);

CREATE TABLE localbr (
  lbrid INT AUTO_INCREMENT PRIMARY KEY, 
  lbruf CHAR(2), 
  lbrbr CHAR(3), 
  lbrkm CHAR(5), 
  lbrlatitude CHAR(20), 
  lbrlongitude CHAR(20), 
  lbrpnvid INT, 
  lbratualiza CHAR(1)
);

CREATE TABLE uf (
  tufuf CHAR(2) PRIMARY KEY, 
  tufdenominacao VARCHAR(60)
);

CREATE TABLE tipoareaespecial (
  taecodigo INT AUTO_INCREMENT PRIMARY KEY, 
  taeatualiza CHAR(1)
);

CREATE TABLE tipoapreensao (
  ttpcodigo INT AUTO_INCREMENT PRIMARY KEY, 
  ttpatualiza CHAR(1)
);

CREATE TABLE tipodetencao (
  ttdcodigo INT AUTO_INCREMENT PRIMARY KEY, 
  ttdatualiza CHAR(1),
  ttdrelacidente CHAR(1)
);

CREATE TABLE tiporeceptor (
	ttrcodigo INT AUTO_INCREMENT PRIMARY KEY,
	ttratualiza CHAR(1), 
	ttrdelegacia CHAR(1)
);

CREATE TABLE tipodocumento (
  ttocodigo INT AUTO_INCREMENT PRIMARY KEY,
  ttoatualiza CHAR(1), 
  ttorelapreensao CHAR(1),
  ttorelrecuperacao CHAR(1)
);

CREATE TABLE tipounidadeoperacional (
	ttucodigo INT AUTO_INCREMENT PRIMARY KEY, 
	ttuatualiza CHAR(1)
);

CREATE TABLE unidadeoperacional (
  uniid INT AUTO_INCREMENT PRIMARY KEY, 
  uniunidade CHAR(6), 
  unilotacao CHAR(9), 
  unisigla CHAR(15), 
  unittucodigo INT, -- foreign key (tipounidadeoperacional)
  uniunidaderesponsavel INT, 
  unidenominacao VARCHAR(80), 
  unimunicipio CHAR(5), 
  unilatitude CHAR(10), 
  unilongitude CHAR(10), 
  unihelicoptero CHAR(1)
);

CREATE TABLE ocorrenciaveiculo (
  ocvid INT AUTO_INCREMENT PRIMARY KEY, 
  ocvocoid INT, -- foreign key (ocorrencia)
  ocvveiid INT -- foreign key (veiculo)

);

CREATE TABLE ocorrenciapessoa (
  opeid INT AUTO_INCREMENT PRIMARY KEY, 
  opeocoid INT, -- foreign key (ocorrencia)
  opepesid INT, -- foreign key (pessoa)
  opeportevalidade DATE, 
  opettecodigo INT, -- foreign key (tipoenvolvido)
  opeestrangeiro CHAR(1), 
  opeanexo CHAR(1), 
  opecondalegadas CHAR(1)
);

CREATE TABLE ocorrenciaacidente (
  oacocoid INT PRIMARY KEY, -- foreign key (ocorrencia)
  oacttacodigo INT, -- foreign key (tipoacidente)
  oactcacodigo INT, 
  oacdano CHAR(1), 
  oacdanoterc CHAR(1), 
  oacdanoamb CHAR(1), 
  oaclatitude CHAR(20), 
  oaclongitude CHAR(20), 
  oacrefera VARCHAR(60), 
  oacreferb VARCHAR(60), 
  oacdistab DECIMAL(5,1), 
  oacdistac DECIMAL(5,1), 
  oacdistbc DECIMAL(5,1), 
  oacmodelopista CHAR(2), 
  oacsentido1 VARCHAR(40), 
  oacsentido2 VARCHAR(40), 
  oacqtdfaixa1 INT, 
  oacqtdfaixa2 INT, 
  oacacostamento1 CHAR(1), 
  oacacostamento2 CHAR(1), 
  oacimagemlen INT, 
  oacimagem INT, 
  oacdescdanopat VARCHAR(255), 
  oacdescdanoterc VARCHAR(255), 
  oacdescdanoamb VARCHAR(255), 
  oaccanteiro CHAR(1), 
  oaclinhacentral INT, 
  oacorientpista CHAR(1), 
  oacgirafundo CHAR(1), 
  oacversaocroqui CHAR(1), 
  oacsitio INT
);