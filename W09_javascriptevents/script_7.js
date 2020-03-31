// Tu vas coder un script script_7.js qui va fonctionner de la façon suivante : 
// pour s'adresser au bot, un fenêtre de prompt va s'ouvrir.
// L'utilisateur pourra y saisir sa phrase et le bot répondra via une impression en console.

// Les règles de conversations du bot sont les suivantes (rangées par priorité - si deux règles sont vraies, 
//seule la plus haute dans la liste s'applique) :

//     Si on lui pose une question (= la phrase finie par "?"), le bot répond "Ouais Ouais..." ;
//     Si on lui hurle trop dessus (= la phrase est 100% en majuscules), le bot répond "Pwa, calme-toi..." ;
//     Si la phrase que tu prononces contient le mot "Fortnite", le bot répond "on s' fait une partie soum-soum ?" ;
//     Si on lui envoie un message vide, le bot répond "t'es en PLS ?" ;
//     Pour tout autre phrase que tu lui envoies, le bot répond "balek." ;


do {
	var phrase = prompt("Parle moi! (ou crie STOP pour arrêter)") 


	switch (true){
		case phrase[phrase.length - 1] === "?":
		console.log("Ouais Ouais...");
		break;

		case phrase === phrase.toUpperCase() && phrase.length >1:
		console.log("Pwa, calme-toi...");
		break;

		case /Fortnite/gi.test(phrase):
		console.log("On s'fait une partie soum-soum ?");
		break;

		case !phrase:
		console.log("T'es en PLS?");
		break;

		default:
		console.log("balek.");
	
	}
} while (phrase !=="STOP")

