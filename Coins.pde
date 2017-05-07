class Coins {
  ArrayList<Coin> store;
  
  Coins (ArrayList<Coin> coins) {
    store = coins;
  }
  
  Coin removeCoin(int index) {
    return store.remove(index);
  }
}