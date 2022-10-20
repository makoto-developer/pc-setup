function getPrimeNumbers(number) {
  let primeNumberList = [];
  for (let i=2; i<=number; i++) {
    let flug = 0;

    for(let j=2; j*j<=i; j++) {
      if (i % j == 0) {
        flug = 1;
        break;
      }
    }
    if (flug == 0) {
      primeNumberList.push(i);
    }
  }
  return primeNumberList;
}

let r = getPrimeNumbers(100)

console.log(r)
