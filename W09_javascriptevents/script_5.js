 console.log("---- Début exercice 2.3.2 Bibliothécaire ----")
var books = [
{ title: 'Gatsby le magnifique', id: 133712, rented: 39 },
{ title: 'A la recherche du temps,perdu', id: 237634, rented: 28 },
{ title: 'Orgueil & Préjugés', id: 873495, rented: 67 },
{ title: 'Les frères Karamazov', id: 450911, rented: 55 },
{ title: 'Dans les forêts de Sibérie', id: 8376365, rented: 15 },
{ title: 'Pourquoi j\'ai mangé mon père', id: 450911, rented: 45 },
{ title: 'Et on tuera tous les affreux', id: 67565, rented: 36 },
{ title: 'Le meilleur des mondes', id: 88847, rented: 58 },
{ title: 'La disparition', id: 364445, rented: 33 },
{ title: 'La lune seule le sait', id: 63541, rented: 43 },
{ title: 'Voyage au centre de la Terre', id: 4656388, rented: 38 },
{ title: 'Guerre et Paix', id: 748147, rented: 19 }
];


// QUESTION 1 //////////////////////////////////////////
console.log("Est-ce que tous les livres ont été au moins empruntés une fois ?")

let rent = books.filter(book => (book.rented < 1));

if (rent.length < 1){
	console.log("Oui")
}
else{
	console.log(`Non, ${rent.length} n'ont jamais été empruntés`)
}


// QUESTION 2 //////////////////////////////////////////

console.log("Quel est livre le plus emprunté ?")


function compare(a, b) {
  // Use toUpperCase() to ignore character casing
  const bookA = a.rented;
  const bookB = b.rented;

  let comparison = 0;
  if (bookA > bookB) {
  	comparison = 1;
  } else if (bookA < bookB) {
  	comparison = -1;
  }
  return comparison;
}

console.log(books.sort(compare)[books.length-1])



// QUESTION 3 //////////////////////////////////////////

console.log("Quel est le livre le moins emprunté ?")
console.log(books.sort(compare)[0])


// QUESTION 4 //////////////////////////////////////////

console.log("Trouve le livre avec l'ID: 873495") ;

console.log(books.filter(book => (book.id == 873495)));

// QUESTION 5 //////////////////////////////////////////
console.log("Supprime le livre avec l'ID: 133712") ;

books = books.filter(book => (book.id != 133712));



// QUESTION 6 //////////////////////////////////////////
console.log("Trie les livres par ordre alphabétique (sans celui avec l'ID 133712 car il est supprimé).")


function comparealph(a, b) {
  // Use toUpperCase() to ignore character casing
  const bookA = a.title;
  const bookB = b.title;

  let comparison = 0;
  if (bookA > bookB) {
  	comparison = 1;
  } else if (bookA < bookB) {
  	comparison = -1;
  }
  return comparison;
}

console.log(books.sort(comparealph))



console.log("---- Fin exercice 2.3.1 Bibliothécaire ----")
