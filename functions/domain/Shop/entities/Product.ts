class ValueObject {
  value: string;
  error;

  constructor(value) {
    this.value = value;
  }

  validate() {
    throw new Error("Not implementd");
  }
}

class ProductName extends ValueObject {}

class Product {
  private name: string;
  private owner: string;
  private description: string;
  private price: Price;

  constructor(name: string, owner: string, price: number, description: string) {
    this.name = name;
    this.price = new Price(price);
    this.description = description;
    this.owner = owner;
  }
}
