console.log("---- Début exercice 2.2.1 Calculs rapides ----")

function factorielle(inputNumber){
let outputNumber = inputNumber;

	if (inputNumber < 0){
		console.log("Merci d'entrer un chiffre positif ");
	}

	else if (inputNumber === 0 || inputNumber === 1){
	console.log("La factorielle est 1");
	}

	while (inputNumber > 1){
			inputNumber--;
			outputNumber = outputNumber * inputNumber;
	}

console.log(`Le résultat est ${outputNumber}`)
}

let num = prompt("De quel nombre veux-tu calculer la factorielle ?")
factorielle(num)

console.log("---- Fin de l'exercice 2.2.1 Calculs rapides ----")