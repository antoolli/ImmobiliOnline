
function Iscritti(username, email, password, nome, cognome, eta, sesso,permessi ){
		this.username=username;
		this.email=email;
		this.password=password;
		this.nome=nome;
		this.cognome=cognome;
		this.eta = eta;
		this.sesso=sesso;
		this.permessi=permessi;
		this.dammiInfo=function (){
			return this.username +" "+ this.email + " " + this.password +" "+ this.nome +" "+ this.cognome +" "+ this.eta +" "+ this.sesso +" "+ this.permessi;
		}
}
//
IscritticonUsername = {
	"antoolli49" : new Iscritti("antoolli49","antoolli49@gmail.com","Antonio2000","Antonio","Oliverio","29/08/2000","M","Acquirente"),
	"mariaBianchi99" : new Iscritti("mariaBianchi99","mariabianchi99@gmail.com","Maria99","Maria","Bianchi","22/11/1999","f","Acquirente")
	
}

function AnnunciInVendita(titolo,descrizione, tipologia, prezzo, metri, latitudine, longitudine){
	this.titolo=titolo;
	this.descrizione=descrizione;
	this.tipologia=tipologia;
	this.prezzo= prezzo;
	this.metri= metri;
	this.latitudine=latitudine;
	this.longitudine= longitudine;
	this.dammiInfo=function(){
		return  this.titolo +" "+ this.descrizione+" "+ this.prezzo+" "+this.metri+ " "+this.latitudine+" "+this.longitudine+" " + this.tipologia;
	}
}

function AnnunciInAffitto(titolo,descrizione,contratto,prezzo,metri,latitudine,longitudine,tipologia){
	this.titolo=titolo;
	this.descrizione=descrizione;
	this.contratto=contratto;
	this.prezzo= prezzo;
	this.metri= metri;
	this.latitudine=latitudine;
	this.longitudine= longitudine;
	this.tipologia=tipologia;
}


function Recensione(idAnnuncio,venditore,recensione,valutazione){
	this.idAnnuncio=idAnnuncio;
	this.venditore=venditore;
	this.recensione=recensione;
	this.valutazione=valutazione;
}

function AnnunciInAffittoId(id,titolo,descrizione,contratto,prezzo,metri,latitudine,longitudine,tipologia){
	this.id=id;
	this.titolo=titolo;
	this.descrizione=descrizione;
	this.contratto=contratto;
	this.prezzo= prezzo;
	this.metri= metri;
	this.latitudine=latitudine;
	this.longitudine= longitudine;
	this.tipologia=tipologia;
}
function AnnunciInVenditaId(id,titolo,descrizione, tipologia, prezzo, metri, latitudine, longitudine){
	this.id=id;
	this.titolo=titolo;
	this.descrizione=descrizione;
	this.tipologia=tipologia;
	this.prezzo= prezzo;
	this.metri= metri;
	this.latitudine=latitudine;
	this.longitudine= longitudine;
	this.dammiInfo=function(){
		return  this.titolo +" "+ this.descrizione+" "+ this.prezzo+" "+this.metri+ " "+this.latitudine+" "+this.longitudine+" " + this.tipologia;
	}

}
function RecensioneId(idAnnuncio,venditore,recensione,valutazione,codiceId){
	this.idAnnuncio=idAnnuncio;
	this.venditore=venditore;
	this.recensione=recensione;
	this.valutazione=valutazione;
	this.codiceId=codiceId;
}

function Asta(idAnnuncio,titolo, scadenza, prezzoBase, venditore){
	this.idAnnuncio= idAnnuncio;
	this.titolo=titolo;
	this.scadenza=scadenza;
	this.prezzoBase=prezzoBase;
	this.venditore=venditore;
	this.dammiInfo=function(){
			return  this.idAnnuncio+" "+this.titolo+" "+this.scadenza+" "+this.prezzoBase +" "+ this.venditore;
	}
}
function AstaId(id,titolo, scadenza, prezzoBase){
	this.id= id;
	this.titolo=titolo;
	this.scadenza=scadenza;
	this.prezzoBase=prezzoBase;
	this.dammiInfo=function(){
			return  this.id+" "+this.titolo+" "+this.scadenza+" "+this.prezzoBase;
	}
}

function Email(toEmail,subject,body){
	this.toEmail=toEmail;
	this.subject=subject;
	this.body=body;
	this.dammiInfo=function(){
		return this.toEmail+" "+ this.subject+" "+ this.body;
	}
}
