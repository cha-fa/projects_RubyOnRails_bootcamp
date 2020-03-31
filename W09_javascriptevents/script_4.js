console.log("---- Début exercice 2.3.1 Startup nation ----")

const entrepreneurs = [
{ first: 'Steve', last: 'Jobs', year: 1955 },
{ first: 'Oprah', last: 'Winfrey', year: 1954 },
{ first: 'Bill', last: 'Gates', year: 1955 },
{ first: 'Sheryl', last: 'Sandberg', year: 1969 },
{ first: 'Mark', last: 'Zuckerberg', year: 1984 },
{ first: 'Beyonce', last: 'Knowles', year: 1981 },
{ first: 'Jeff', last: 'Bezos', year: 1964 },
{ first: 'Diane', last: 'Hendricks', year: 1947 },
{ first: 'Elon', last: 'Musk', year: 1971 },
{ first: 'Marissa', last: 'Mayer', year: 1975 },
{ first: 'Walt', last: 'Disney', year: 1901 },
{ first: 'Larry', last: 'Page', year: 1973 },
{ first: 'Jack', last: 'Dorsey', year: 1976 },
{ first: 'Evan', last: 'Spiegel', year: 1990 },
{ first: 'Brian', last: 'Chesky', year: 1981 },
{ first: 'Travis', last: 'Kalanick', year: 1976 },
{ first: 'Marc', last: 'Andreessen', year: 1971 },
{ first: 'Peter', last: 'Thiel', year: 1967 }
];

// QUESTION 1 /////////////////////////////////////////////////////////
console.log("Les entrepreneurs qui sont nés dans les années 70 :");

entrepreneurs.forEach((entrepreneur) => {
	if (entrepreneur.year >= 1970 && entrepreneur.year < 1980){
		console.log(entrepreneur);
	}

});


// QUESTION 2 /////////////////////////////////////////////////////////
console.log("Array qui contient le prénom et le nom des entrepreneurs :");

let array = [
{ first: 'Steve', last: 'Jobs', year: 1955 },
{ first: 'Oprah', last: 'Winfrey', year: 1954 },
{ first: 'Bill', last: 'Gates', year: 1955 },
{ first: 'Sheryl', last: 'Sandberg', year: 1969 },
{ first: 'Mark', last: 'Zuckerberg', year: 1984 },
{ first: 'Beyonce', last: 'Knowles', year: 1981 },
{ first: 'Jeff', last: 'Bezos', year: 1964 },
{ first: 'Diane', last: 'Hendricks', year: 1947 },
{ first: 'Elon', last: 'Musk', year: 1971 },
{ first: 'Marissa', last: 'Mayer', year: 1975 },
{ first: 'Walt', last: 'Disney', year: 1901 },
{ first: 'Larry', last: 'Page', year: 1973 },
{ first: 'Jack', last: 'Dorsey', year: 1976 },
{ first: 'Evan', last: 'Spiegel', year: 1990 },
{ first: 'Brian', last: 'Chesky', year: 1981 },
{ first: 'Travis', last: 'Kalanick', year: 1976 },
{ first: 'Marc', last: 'Andreessen', year: 1971 },
{ first: 'Peter', last: 'Thiel', year: 1967 }
];

array.forEach((entrepreneur) =>{
	delete entrepreneur.year
});

console.log(array)

// QUESTION 3 /////////////////////////////////////////////////////////
console.log("Quel âge aurait chaque inventeur aujourd'hui ?")
b = 2020 - 1990
entrepreneurs.forEach((entrepreneur) =>{
let age = (2020 - entrepreneur.year);
console.log(`${entrepreneur.first} ${entrepreneur.last} aurait ${age} ans.`)

});


// QUESTION 4 /////////////////////////////////////////////////////////
console.log("Trie les entrepreneurs par ordre alphabétique du nom de famille.")

function compare(a, b) {
  // Use toUpperCase() to ignore character casing
  const entrepreneurA = a.last.toUpperCase();
  const entrepreneurB = b.last.toUpperCase();

  let comparison = 0;
  if (entrepreneurA > entrepreneurB) {
    comparison = 1;
  } else if (entrepreneurA < entrepreneurB) {
    comparison = -1;
  }
  return comparison;
}

console.log(entrepreneurs.sort(compare));

console.log("---- Fin exercice 2.3.1 Startup nation ----")
