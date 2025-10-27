# Sales system

Sales system is an app, that allows customers to add product to a basket and shows the total price.

Technologies:

- ruby

## Steps to run it locally

- Open a terminal
- Run `git clone git@github.com:NtwaliHeritier/sales_system.git`
- Run `cd sales_system`
- Run `ruby basket.rb` to run the test case scenarios

## Technical implementation

The app has the following classes:

- Product: This holds details about the product and the fields(name, code, price).
- Catalogue: This displays the list of products available in the shop.
- BasketItem: This is a line in a basket. It contains a product to add to the basket and the quantity we want. In this class we also add the discount for a specific item.
- Basket: This is where all the magic happens. We add items to the basket, compute the total, by adding transport charges when needed.
- Charges: This is a utility super class. It contains child classes; TransportCharges, and BuyOneGetSecondOnHalf; These add transport charges, and adds a discount on specific purchases respectively.
- Normalize: This is a utility module that allow proper display of decimal values.

## Assumptions

The assumption in this app, is that as we are dealing with monetary values, I used big decimal while computing totals, as floats can lose accuracy for trailing values.
