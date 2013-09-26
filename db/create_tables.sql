DROP DATABASE IF EXISTS prf;
CREATE DATABASE prf;
USE prf;

CREATE TABLE veiculo ( -- cadastro dos dados do veículo
  veiid INT AUTO_INCREMENT PRIMARY KEY,
  veiano CHAR(4),
  veitmvcodigo INT,
  veiqtdocupantes INT,
  veitevcodigo INT,
  veitcvcodigo INT,
  veitvvcodigo INT,
  veimunicipio CHAR(5),
  veitcecodigo INT,
  veidescricao varchar(60),
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

CREATE TABLE pessoa ( -- cadatro da pessoa envolvida na ocorrência
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
  pesveiid INT, -- FK(veiculo)
  pesestadofisico SMALLINT,
  pescinto CHAR(1),
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
-- ALTER TABLE pessoa ADD FOREIGN KEY (pesveiid) REFERENCES veiculo(veiid);

CREATE TABLE ocorrencia ( -- registro de ocorrência confirmada a partir das comunicações recebidas
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

CREATE TABLE tipoenvolvido ( -- Tabela que qualifica os envolvidos em uma ocorrência de crime
  ttecodigo INT AUTO_INCREMENT PRIMARY KEY,
  ttedescricao VARCHAR(30),
  tteatualiza CHAR(1),
  tteativo CHAR(1)	
);

CREATE TABLE tipoacidente ( -- Qualifica os tipos de acidente
  ttacodigo INT AUTO_INCREMENT PRIMARY KEY,
  ttadescricao VARCHAR(50),
  ttaatualiza CHAR(1),
  ttarelacidente CHAR(1), 
  ttaativo CHAR(1)	
);

CREATE TABLE tipoveiculo ( -- Identifica os tipos de veículos 
  tvvcodigo INT AUTO_INCREMENT PRIMARY KEY,
  tvvdescricao varchar(30),  
  tvvatualiza CHAR(1),
  tvvrelacidente CHAR(1),
  tvvativo CHAR(1)		
);

CREATE TABLE municipio ( -- Cadastro do município da ocorrência.
  tmucodigo CHAR(5) PRIMARY KEY,
  tmudenominacao VARCHAR(50),
  tmuuf CHAR(2));

CREATE TABLE localbr ( -- Armazena o local da BR onde aconteceu a ocorrência. 
  lbrid INT AUTO_INCREMENT PRIMARY KEY, 
  lbruf CHAR(2), 
  lbrbr CHAR(3), 
  lbrkm CHAR(5), 
  lbrlatitude CHAR(20), 
  lbrlongitude CHAR(20), 
  lbrpnvid INT, 
  lbratualiza CHAR(1)
);

CREATE TABLE uf ( -- Cadastro da UF onde foi feito a ocorrência. 
  tufuf CHAR(2) PRIMARY KEY, 
  tufdenominacao VARCHAR(60)
);

CREATE TABLE tipoareaespecial ( -- Identifica os tipo de área especiais que existem 
  taecodigo INT AUTO_INCREMENT PRIMARY KEY, 
  taedescricao varchar(30),
  taeatualiza CHAR(1)
);

CREATE TABLE tipoapreensao ( -- Identifica os tipos de apreensão 
  ttpcodigo INT AUTO_INCREMENT PRIMARY KEY, 
  ttpdescricao varchar(30),
  ttpatualiza CHAR(1)
);

CREATE TABLE tipodetencao ( -- Cadastro dos tipos possíveis de detenção
  ttdcodigo INT AUTO_INCREMENT PRIMARY KEY, 
  ttddescricao varchar(30),  
  ttdatualiza CHAR(1),
  ttdrelacidente CHAR(1)
);

CREATE TABLE tiporeceptor ( -- Identifica os tipos de receptores em uma ocorrência encaminhada 
	ttrcodigo INT AUTO_INCREMENT PRIMARY KEY,
	ttrdescricao varchar(50), 
    ttratualiza CHAR(1), 
	ttrdelegacia CHAR(1)
);

CREATE TABLE tipodocumento ( -- Cadastro de tipos de documentos
  ttocodigo INT AUTO_INCREMENT PRIMARY KEY,
  ttodescricao varchar(50),  
  ttoatualiza CHAR(1), 
  ttorelapreensao CHAR(1),
  ttorelrecuperacao CHAR(1)
);

CREATE TABLE tipounidadeoperacional ( -- Qualificação dos tipos das unidades operacionais 
  ttucodigo INT AUTO_INCREMENT PRIMARY KEY, 
  ttudescricao varchar(50),  
  ttuatualiza CHAR(1)
);

CREATE TABLE unidadeoperacional ( -- Qualificação dos tipos das unidades operacionais 
  uniid INT AUTO_INCREMENT PRIMARY KEY, 
  uniunidade CHAR(6), 
  unilotacao CHAR(9), 
  unisigla CHAR(15), 
  unittucodigo INT, -- FK(tipounidadeoperacional)
  uniunidaderesponsavel INT, 
  unidenominacao VARCHAR(80), 
  uniendereco VARCHAR(80), 
  unicep varchar(10), 
  unimunicipio varchar(30), 
  unilatitude CHAR(15), 
  unilongitude CHAR(15)
);
-- ALTER TABLE unidadeoperacional ADD FOREIGN KEY (unittucodigo) REFERENCES tipounidadeoperacional(ttucodigo);

CREATE TABLE ocorrenciaveiculo ( -- Cadastro da ocorrência referente ao veículo da pessoa envolvida
  ocvid INT AUTO_INCREMENT PRIMARY KEY, 
  ocvocoid INT, -- FK(ocorrencia)
  ocvveiid INT -- FK(veiculo)
);
-- ALTER TABLE ocorrenciaveiculo ADD FOREIGN KEY (ocvocoid) REFERENCES ocorrencia(ocoid);
-- ALTER TABLE ocorrenciaveiculo ADD FOREIGN KEY (ocvveiid) REFERENCES veiculo(veiid);

CREATE TABLE ocorrenciapessoa ( -- Cadastro de pessoas envolvidas no acidente.
  opeid INT AUTO_INCREMENT PRIMARY KEY, 
  opeocoid INT, -- FK(ocorrencia)
  opepesid INT, -- FK(pessoa)
  opeportevalidade DATE, 
  opettecodigo INT, -- FK(tipoenvolvido)
  opeestrangeiro CHAR(1), 
  opeanexo CHAR(1), 
  opecondalegadas CHAR(1)
);
-- ALTER TABLE ocorrenciapessoa ADD FOREIGN KEY (opeocoid) REFERENCES ocorrencia(ocoid);
-- ALTER TABLE ocorrenciapessoa ADD FOREIGN KEY (opepesid) REFERENCES pessoa(pesid);
-- ALTER TABLE ocorrenciapessoa ADD FOREIGN KEY (opettecodigo) REFERENCES tipoenvolvido(ttecodigo);

CREATE TABLE ocorrenciaacidente ( -- Cadastro de ocorrência envolvendo veículos. 
  oacocoid INT PRIMARY KEY, -- FK(ocorrencia)
  oacttacodigo INT, -- FK(tipoacidente)
  oactcacodigo INT, 
  oacdano CHAR(1), 
  oacdanoterc CHAR(1), 
  oacdanoamb CHAR(1), 
  oaclatitude CHAR(20), 
  oaclongitude CHAR(20),
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
  oacorientpista CHAR(1),
  oacversaocroqui CHAR(1), 
  oacsitio INT
);
-- ALTER TABLE ocorrenciaacidente ADD FOREIGN KEY (oacocoid) REFERENCES ocorrencia(ocoid);
-- ALTER TABLE ocorrenciaacidente ADD FOREIGN KEY (oacttacodigo) REFERENCES tipoacidente(ttacodigo);
