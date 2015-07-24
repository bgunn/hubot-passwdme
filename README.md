# hubot-passwdme

A hubot script to generate passwords using the passwd.me API

See [`src/passwdme.coffee`](src/passwdme.coffee) for full documentation.

## Motivation

As an IT guy I am constantly visiting 3rd party sites to generate passwords for a wide variety of reasons. Having recently switched to Slack for our team collaboration I thought a Hubot script to generate passwords would be a nice addition.

## Installation

In your hubot directory, run:

`npm install hubot-passwdme --save`

Then add **hubot-passwdme** to your `external-scripts.json`:

```json
[
  "hubot-passwdme"
]
```

## Usage

Assuming your hubot instance is called hubot, you can instruct it to generate passwords as follows. Options can be provided in any order.

```
hubot pw <lenght> <type> <charset> <seperator>
hubot pw 15
hubot pwd 24 pronounceable period
```

**Options:** 

- lenght    : The length of the password between 8 and 64 characters (defaults to 12)
- Type      : random or pronounceable (defaults to random)
- charset   : mixedcasealphanumeric, numeric, lowercasealpha, uppercasealpha, mixedcasealpha, lowercasealphanumeric, uppercasealphanumeric (defaults to mixedcasealphanumeric)
- seperator : hyphen, period, exclamation, question ( Only used if type = pronounceable )
