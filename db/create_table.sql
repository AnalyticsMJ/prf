create table veiculo {
  veiid INT AUTO_INCREMENT PRIMARY KEY
  ,veiano CHAR(4)
  ,veitmvcodigo INT
  ,veiqtdocupantes INT 
  ,veitevcodigo INT 
  ,veitcvcodigo INT 
  ,veitvvcodigo INT
  ,veim unicipio CHAR(5)
  ,veitcecodigo INT 
  ,veim unorigem CHAR(5) 
  ,veipaisorigem INT 
  ,veimundestino CHAR(5) 
  ,veipaisdestino INT 
  ,veitttcodigo INT 
  ,veitipoproprietario CHAR(1) 
  ,veiproprietario INT 
  ,veioenid INT 
  ,veisequencial INT
}
 
create table tipoenvolvido {
  ttecodigo INT AUTO_INCREMENT PRIMARY KEY
  ,tteatualiza CHAR(1)
  ,tteativo CHAR(1)	
}

create table tipoacidente{
  ttacodigo INT AUTO_INCREMENT PRIMARY KEY
  ,ttaatualiza CHAR(1)
  ,ttarelacidente CHAR(1) 
  ,ttaativo CHAR(1)	
}

create table tipoveiculo{
  tvvcodigo int auto_increment primary key
  ,tvvatualiza CHAR(1)
  ,tvvrelacidente CHAR(1)
  ,tvvativo CHAR(1)		
}

create table pessoa {
	pesid int auto_increment primary key
	,pesexpedidor      CHAR(10)
	,pesufexpedidora   CHAR(2) 
	,pesnaturalidade   CHAR(5) 
	,pesnacionalidade  INT 
	,pessexo           CHAR(1) 
	,pesteccodigo      INT
	,pestgicodigo      INT
	,pesmunicipio      CHAR(5)
	,pestopcodigo      INT
	,pesmunicipioori   CHAR(5)
	,pespaisori        INT
	,pesmunicipiodest  CHAR(5)
	,pespaisdest       INT
	,pesveiid          INT
	,pesestadofisico   smallint
    ,pescinto          char(1)
	,pescapacete       CHAR(1) 
	,peshabilitado     CHAR(1) 
	,pessocorrido      CHAR(1) 
	,pesdormindo       CHAR(1) 
	,pesalcool         CHAR(1) 
	,peskmpercorre     DECIMAL(5,1)
	,peshorapercorre   CHAR(4) 
	,pesdatahabil      DATE
	,pesdatavalidade   DATE
	,pesidade          INT
	,pesaltura         DECIMAL(3,2)
	,pespeso           INT
	,pessinal          CHAR(1) 
	,peslesao          CHAR(1)
	,pestcccodigo      INT
	,pestctcodigo      INT
	,pestclcodigo      INT
	,pesoenid          INT
}
