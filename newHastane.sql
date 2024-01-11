----------------------------------TABLOLAR-----------------------------------
create table Poliklinik(
   poliklinikId INT not null,
   poliklinikAd VARCHAR(25)  not null,
   primary key (poliklinikId),
   
);

create table Doktor(
   doktorId INT not null,
   tckn INT not null,
   poliklinikNo INT not null,
   doktorAd VARCHAR(20) not null,
   doktorSoyad VARCHAR(25) not null,
   uzmanlikAlani VARCHAR(max) not null,
   primary key (doktorId),
   foreign key (poliklinikNo) references Poliklinik(poliklinikId) on delete cascade
   
);

create table Hasta(
	  hastaTCKN INT not null,
	  hastaAd VARCHAR(15),
	  hastaSoyad VARCHAR(15),
	  cinsiyet VARCHAR(15),
	  dogumTarihi DATE,
	  medeniDurum VARCHAR(15),
	  egitimDurum VARCHAR(15),
	  meslek VARCHAR(15),
	  kanGrubu VARCHAR(15),
	  rhFaktoru VARCHAR(7),
	  telNo VARCHAR(12),
	  adres VARCHAR(max),
	  kayitTarihi DATE,
	  primary key (hastaTCKN),
	  
);

create table Randevu(
      
	  tarih DATE not null,
	  saat TIME not null,
	  rhastaTCKN INT not null,
	  RDID INT not null,
	  RPID INT not null,
	  foreign key (rhastaTCKN) references Hasta(hastaTCKN) on delete cascade,
	  foreign key (RDID) references Doktor(doktorId) on delete cascade,
	  foreign key (RPID) references Poliklinik(poliklinikId)
	  


);

create table Muayene(
	 mhastaTCKN INT not null,
	 MDID INT not null,
	 tani VARCHAR(30) not null,
	 recete VARCHAR(20) not null,
	 foreign key (mhastaTCKN) references Hasta(hastaTCKN) on delete cascade,
	 foreign key (MDID) references Doktor(doktorId) on delete cascade,

);


----------------------------------TEMEL ÝÞLEM KODLARI-----------------------------------

insert into Poliklinik(poliklinikId,poliklinikAd)
values(1,'dahiliye');

insert into Poliklinik(poliklinikId,poliklinikAd)
values(2,'kadýn ve doðum hast.');

insert into Doktor(doktorId,tckn,poliklinikNo,doktorAd,doktorSoyad,uzmanlikAlani)
values(1,12134,1,'ali','öztürk','dahiliye uzmaný');
insert into Doktor(doktorId,tckn,poliklinikNo,doktorAd,doktorSoyad,uzmanlikAlani)
values(2,121434,2,'doðuþcan','daðdandeviren','kadýn doðum uzmaný');

insert into Hasta(hastaTCKN,hastaAd,hastaSoyad,cinsiyet,dogumTarihi,medeniDurum,egitimDurum,meslek,kanGrubu,rhFaktoru,telNo,adres,kayitTarihi)
values(2323267,'serif','kazak','erkek','20240101','evli','lise','oyuncu','0','rh+','05695943','beylikdüzü/istanbul',GETDATE());

insert into Hasta(hastaTCKN,hastaAd,hastaSoyad,cinsiyet,dogumTarihi,medeniDurum,egitimDurum,meslek,kanGrubu,rhFaktoru,telNo,adres,kayitTarihi)
values(2323247,'sekvan','terek','erkek','20230101','bekar','lisans','serbest meslek','ab','rh+','05695943','beylikdüzü/istanbul',GETDATE());

insert into Randevu(tarih,saat,rhastaTCKN,RDID,RPID)
values('2024-01-01','09:30:00',2323267,1,1);

insert into Randevu(tarih,saat,rhastaTCKN,RDID,RPID)
values('2024-01-01','09:30:00',2323267,2,2);


insert into Muayene(mhastaTCKN,MDID,tani,recete)
values(2323267,1,'kronik akut','XMYZ3IOT');


update Doktor
set tckn=13345
where doktorId=1

delete Poliklinik
where poliklinikId=1

delete Doktor
where doktorId=2

delete Hasta
where hastaTCKN=2323267

delete Randevu
where rhastaTCKN=2323267

delete Muayene
where mhastaTCKN=2323267



