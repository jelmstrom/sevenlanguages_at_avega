-module(shopping_list).
-export([calculateTotal/1]).

calculateTotal(ShoppingList) -> [{Item, Quantity*Price} || {Item, Quantity, Price} <- ShoppingList].
