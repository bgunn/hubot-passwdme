# hubot-passwdme

A hubot script to generate passwords using the passwd.me API

See [`src/passwdme.coffee`](src/passwdme.coffee) for full documentation.

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

Assuming your hubot instance is called hubot, you can instruct it to generate passwords as follows:

```
hubot pw <lenght> <type> <charset> <seperator>
```
