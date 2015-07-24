# Description:
#   A hubot script to generates a unique, secure password using the passwd.me API
#
# Dependencies:
#   "querystring": ""
#
# Configuration:
#   None
#
# Commands:
#   hubot pw 15 - generate a 15 character random mixedcasealphanumeric password
#   hubot pw 48 pronounceable - generates a 48 character pronounceable password
#
# Notes:
#   Available options with default values listed first. Options can be supplied in any order.
#
#   Type:      random, pronounceable
#   Length:    12, 8 - 64
#   Charset:   mixedcasealphanumeric, numeric, lowercasealpha, uppercasealpha,
#              mixedcasealpha, lowercasealphanumeric, uppercasealphanumeric
#   Separator: hyphen, period, exclamation, question ( Only used if type = pronounceable )
#
# Author:
#   Billy Gunn <billy@arckinteractive.com>
#

querystring = require("querystring");

module.exports = (robot) ->

  robot.respond /pw(.*)/i, (res) ->

    # Set allowable options for type, charset, and seperator

    types = ["pronounceable"]

    charsets = [
      "numeric",
      "lowercasealpha",
      "uppercasealpha",
      "mixedcasealpha",
      "lowercasealphanumeric",
      "uppercasealphanumeric"
    ]

    seperators = ["period", "exclamation", "question" ]

    # Set the default parameters
    params =
      type:      'random'
      length:    12
      charset:   'MIXEDCASEALPHANUMERIC'
      separator: 'hyphen'

    # Parse user supplied options
    if res.match?

      options = (res.match[1].replace /^\s+|\s+$/g, "").split " "

      for v, i in options

        # Test each option to see if it is a number and within the length range
        length = parseInt( v, 10 );
        if typeof length == 'number' and 8 <= length <= 64
            params.length = length

        # Check to see if we received an alternate charset
        if v in charsets
          params.charset = v

        # Check to see if we received an alternate type
        if v in types
          params.type = v

        # Check to see if we received an alternate seperator
        if v in seperators
          params.separator = v

    data = querystring.stringify(params)

    robot.http("https://passwd.me/api/1.0/get_password.json?" + data)
      .header('Accept', 'application/json')
      .get() (err, response, body) ->

        if err
          res.reply "I encountered an error :( #{err}"
          return

        if response.statusCode isnt 200
          res.reply "I received an invalid response :("
          return

        # Parse the body string
        result = JSON.parse body

        res.reply "#{result.password}"
