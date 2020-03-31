console.log("---- Début exercice 2.2.2 Pyramides de Mario ----")

function pyramide(num){
	if (num <= 0 || num > 25){
		console.log("Merci de choisir un chiffre compris entre 1 et 25");
		var num = prompt("Salut, bienvenue dans ma super pyramide ! Combien d'étages veux-tu ?");
	}

	console.log(`Voici la pyramide inversée de ${num} étages`)



	let a = "";
	let b = 1
	let d = " "
	while(b < num || num > 0){
		a += "#";
		b++;
		num--;
		e = d.repeat(num);
		console.log(e + a);
	}


}

let number = prompt("Salut, bienvenue dans ma super pyramide ! Combien d'étages veux-tu ?");

pyramide(number);


console.log("---- Fin exercice 2.2.2 Pyramides de Mario ----")
