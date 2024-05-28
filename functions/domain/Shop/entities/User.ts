class Point {
  constructor(private value: number) {}
}

class User {
  coupons: Array<string>;
  availableCoupons: Array<string>;
  points: Point;
  constructor(coupons, availableCoupons, points) {
    this.coupons = coupons;
    this.availableCoupons = availableCoupons;
    this.points = new Point(points);
  }
}
