function decrypt(arn){
	let arnarray = arn.match(/.{3}/g);

	let decryptedarray = []
	
	arnarray.forEach(arn =>{


		if (arn === "UCU" || arn === "UCC" || arn === "UCA" || arn === "UCG" || arn === "AGU" || arn ==="AGC"){
			arn = "Sérine";
			decryptedarray.push(arn);
		}
		else if (arn === "CCU" || arn === "CCC" || arn === "CCA" || arn === "CCG"){
			arn = "Proline";
			decryptedarray.push(arn);
		}
		else if (arn ==="UUA" || arn === "UUG"){
			arn = "Leucine";
			decryptedarray.push(arn);
		}
		else if (arn === "UUU" || arn ==="UUC"){
			arn = "Phénylalanine";
			decryptedarray.push(arn);
		}
		else if (arn === "CGU" || arn === "CGC" || arn === "CGA" || arn === "CGG" || arn === "AGA" || arn === "AGG"){
			arn = "Arginine";
			decryptedarray.push(arn);
		}
		else if (arn === "UAU" || arn === "UAC"){
			arn = "Tyrosine";
			decryptedarray.push(arn);
		}
		else{
			console.log("Valeur non reconnue")
		}

	})

	console.log(`Voici la traduction : ${decryptedarray.join('-')}`)
};

let arnchoice = prompt("Quel ARN souhaites-tu traduire ? (doit être au format CCGUCGUUGCGCUACAGC)")

decrypt(arnchoice)