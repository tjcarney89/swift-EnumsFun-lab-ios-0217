# Enums: War Lab 

![NameOfPerson](http://i.imgur.com/dJ83HcZ.png?1)  

> Our differences are only skin deep, but our sames go down to the bone. -[Marge Simpson](https://en.wikipedia.org/wiki/Marge_Simpson)

## Overview

In this lab, you'll implement a simple game of War as an iPhone app. 

## War!

War: A game loved by children all over the world. No, not the thing with armies and navies and airplanes—the [card game](https://en.wikipedia.org/wiki/War_\(card_game\))! If you're not familiar with the game, it's pretty simple: Two players face off with each other. Each start the game with half of a shuffled deck. They each flip one card over at a time. Whoever has the highest card wins both cards. Cards increase in value from 2 to Ace. Suits don't matter. If the cards are the same value, then each player flips over another card, and also adds a face-down card. Whoever wins takes all the cards. If the face-up cards are again the same value, then this process repeats until one player wins. The game ends when one player runs out of cards.

In this lab, you'll implement a simple game of war as an iPhone app. You'll get a feel for enums, and also how to work with classes that you create. (In this lab, you won't implement the tie breaker phase of the game, in order to keep the lab simple.)

But first, a note about enums and raw values.

## Enums and Raw Values

The enums you use in this lab will be a bit different than ones you have seen before. If you've already looked at the source code, you may have noticed that the enums used in this lab _inherit_ from other classes, namely `Int` (in the case of the `Rank` enum) and `String` (in the case of the `Suit` enum). Why is this the case?

Often times, you want enums to have an associated value. Doing so can make it easier to create an enum. For example, the `Rank` enum has values to represent cards 2 through 10 from a standard deck of playing cards, as well as face cards. It would be nice to create an instance of `Rank` using a simple value like `2`; at the same time, though, it's important to use an enum, so that invalid ranks (such as "15") cannot be created.

In Swift, it's easy to create an enum that can serve both goals. By inheriting from `Int`, the `Rank` enum can have values that are associated with `Int`s, but are still discrete values themselves. Rank enum values are said to have associated _raw values_. You can use these raw values to create a new enum, and you can also use a `Rank` instance's `rawValue` property to get the raw value associated with it.

Raw values make it easy to create new enums from other values. Consider again the definition of the `Rank` enum:

```swift
enum Rank: Int {
    case two = 2, three, four, five, six, seven, eight, nine, ten, jack, queen, king, ace
```

You can easily create a new `Rank` instance from any `Int` value. Here's how you can create one from `5`:

```swift
let rank: Rank? = Rank(rawValue: 5)
// rank == Rank.five
```

In other words, the `Rank` enum (and all enums with associated raw values) have an initializer with a `rawValue` parameter.

One caveat: This initializer returns an _optional_ `Rank` value. Why? Not all raw values are acceptable. For example, this code would return `nil`, because there is no `Rank` case that is associated with the value `100`.

```swift
let rank: Rank? = Rank(rawValue: 100)
// rank == nil
```

You can also get a raw value by calling the `rawValue` property on a `Rank` instance:

```swift
let rank = Rank(rawValue: 4)!
print("rank raw value is \(rank.rawValue)")
// prints "rank raw value is 4"
```

The same concepts apply to `Suit`, although `Suit`'s raw values are `String`s, not `Int`s.

## Directions

An Xcode project for this lab has been started for you: `EnumsFun.xcworkspace`. In this lab, you'll be creating an iOS game that will allow you to play the card game War against an AI (insofar as War requires any intelligence at all). A basic UI has been laid out for you, and some IB outlets and actions have been hooked up, but you'll be responsible for implementing the classes required to run the game. These classes will make use of a few enums, so you'll get to see those in action, too.

The project includes unit tests. To run them, select **Test** from the **Product** menu in Xcode, or press <kbd>Command</kbd>-U. When you have correctly implemented all the classes, all the unit tests will pass. You can also test your game periodically by building and running the app in the simulator.

Let's get started!

### `Card.swift`

First, open up `Card.swift` in Xcode's code editor. `Cards.swift` contains two enums, `Rank` and `Suit`, and a class, `Card`. Here's what you must do to finish implementing these enums and classes:

1. Add a `String` property to `Rank` called `stringValue`. This should return a string representing the value of the card: the numbered value for numbered cards, or "J", "Q", "K", or "A" for face cards.
2. Add a property called `suit` of type `Suit` to the `Card` class.
3. Add a property called `rank` of type `Rank` to the `Card` class.
4. Add a _computed_ property called `description` of type `String` to `Card`. It should return a string representing the suit and rank of the card, in the format "&lt;rank&gt;&lt;suit&gt;".
5. Create an initializer for `Card` that accepts both a rank and a suit and sets the appropriate properties. These parameters should be called `rank` and `suit`.

### `Deck.swift`

Next, open up `Deck.swift`. You'll find a class in this file called `Deck` that represents a deck of cards.

1. Add a property called `cards` of type `[Card]` to `Deck`.
2. Create a new initializer than creates a deck of playing cards. This should be an array of 52 `Card` instances of the appropriate rank and suit. (Hint: You can use a couple of for loops to do this -- remember how to create `Rank` and `Suit` enums from raw values!) Assign this to the `cards` property. Make sure the deck is shuffled! (Hint: You can call `shuffle()` on an `Array` to shuffle the contents. This method was provided to you.)
3. Add a method called `split()`. This method should split the set of the cards in half and return a two-element tuple consisting of each half of the deck (i.e., the return type is `([Card], [Card])`. (Hint: An `Array` method called `split()` has been written for you in the `Array.swift` file.)

### `Hand.swift`

Next, open up `Hand.swift`. This file contains a class called `Hand` that represents a single player's hand.

1. Add a property called `cards` of type `[Card]` to `Hand`.
2. Add a _computed_ property called `size` that returns the current size of the hand.
3. Create an initializer that takes an array of `Card`s called `cards` as a parameter. This array should be assigned to the `cards` property.
4. Create a method called `flip()`. This method should return an optional `Card` (`Card?`). It should return the top card from the hand, or `nil` if the deck is empty. This card should also be _removed_ from the hand.
5. Create a method called `give(card:)`. This method should take one parameter, `card`, of type `Card`, and add it to the _bottom_ of the hand.
6. Create a method called `lose(card:)`. This method should take one parameter, `card`, of type `Card`, and remove that card from the hand.

### `Player.swift`

Next, open up `Player.swift`. This file contains a class called `Player` that represents one participant in the game of war.

1. Add a property called `name` of type `String` to `Player`.
2. Add a property called `hand` of type `Hand` to `Player`. (Note: For testing purposes, this property _must_ be a variable.)
3. Create an initializer that takes two parameters: `name` of type `String` and `hand` of type `Hand`. This initializer should set the equivalent properties.
4. Create a function called `hasCards()` that returns a `Bool` indicating if the player has cards left in their hand or not.
5. Create a function called `flip()` that returns a `Card?`. If the player has cards, it should return the top card of their hand; otherwise, it should return `nil`.
6. Implement `give(card:)` and `lose(card:)` as described in `Hand.swift`, above. They should do the same thing.

(Hint: `flip()`, `give(card:)`, and `lose(card:)` will probably make use of the same methods defined on the `Hand` class.)

### `GameEngine.swift`

Next, open up `GameEngine.swift`. There is a `GameEngine` class defined in this file that implements the logic for a game of War.

1. Add a property called `player1` of type `Player` to `GameEngine`.
2. Add a property called `player2` of type `Player`.
3. Add a property called `deck` of type `Deck`.
4. Create an initializer for `GameEngine` that takes two `Player` parameters called `player1` and `player2`, both of type `String`, representing the _names_ of the game's players. This initializer should create a deck of cards and split it in half, then create two `Player` instances and assign them to the appropriate property.
5. Implement a method called `playOneTurn()` that returns a three-element tuple of type `(Player, Card?, Card?)`, representing the winning player of this turn, the card that `player1` flipped over, and the card that `player2` flipped over. This method should flip cards for each player. Remember, the player with the highest card wins!
6. Implement a method called `award(cards:to:)`. This methods first parameter is called `cards` of type [`Card`]. The second parameter should be called `player` of type `Player`. It should give the `player` all of the `cards`. (Hint: Don't forget about the `give(card:)` method you implemented on the `Player` class.)
7. Implement a method called `gameOver()` that returns `true` when the game is over. (The game is over when either player has run out of cards.)

### `ViewController.swift`

Finally, you'll have to implement the `ViewController` class. The IB outlets and actions have already been set up for you. The `flipCard(_:)` action should play one turn of War and update all the labels on the screen with the flipped cards, as well as the winner and loser of the round. It should also keep a running tally of the total number of cards left in each player's deck. The exact implementation of this class is open to you, but you should make use of the IB outlets and actions that have already been created.

## Extra Credit

If you found this lab easy, then try modifying your code to implement tie breakers. It's harder than it looks!

<a href='https://learn.co/lessons/EnumsLab' data-visibility='hidden'>View this lesson on Learn.co</a>

<p class='util--hide'>View <a href='https://learn.co/lessons/swift-EnumsFun-lab'>Enums War Lab</a> on Learn.co and start learning to code for free.</p>
