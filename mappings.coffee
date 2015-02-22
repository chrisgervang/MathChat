defaulftMath = {
  "63": "i"
}

shiftMath = {

}

ctrlAltMath = {

}

ctrlAltShiftMath = {

}

defaultEnglish = {

}

shiftEnglish = {

}

optable =
  Integral:
    MathML:"""
          <msubsup>
            <mo>&Integral;</mo>
            <mrow>
              <mo>&EmptyVerySmallSquare;</mo>
            </mrow>
            <mrow>
              <mo>&EmptyVerySmallSquare;</mo>
            </mrow>
          </msubsup>
          """
  Tilde:
    MathML:"<mo>~</mo>"
  NotEqual:
    MathML:"<mo>&NotEqual;</mo>"
  parallel:
    MathML:"<mo>&parallel;</mo>"
  Percent:
    MathML:"<mo>%</mo>"
  SquareRoot:
    MathML:"""
          <msqrt>
            <mo>&square;</mo>
          </msqrt>
          """
  PlusMinus:
    MathML:"<mo>&PlusMinus;</mo>"
  times:
    MathML:"<mo>&times;</mo>"
  minus:
    MathML:"<mo>-</mo>"
  equals:
    MathML:"<mo>=</mo>"
  log:
    MathML:"<mo>log</mo>"
  epsilon:
    MathML:"<mo>&epsilon;</mo>"
  Union:
    MathML:"""
            <munderover>
              <mo>&Union;</mo>
              <mrow>
                <mo>&EmptyVerySmallSquare;</mo>
              </mrow>
              <mrow>
                <mo>&EmptyVerySmallSquare;</mo>
              </mrow>
            </munderover>
          """
  dx:
    MathML:"<mo>d<mi>x</mi></mo>"
  Product:
    MathML:"""
          <munderover>
            <mo>&Product;</mo>
            <mrow>
              <mo>&EmptyVerySmallSquare;</mo>
            </mrow>
            <mrow>
              <mo>&EmptyVerySmallSquare;</mo>
            </mrow>
          </munderover>
          """
  leftBracket:
    MathML:"<mo>[</mo>"
  rightBracket:
    MathML:"<mo>]</mo>"
  logicalAnd:
    MathML:"<mo>&and;</mo>"
  toggleKeyboard:
    MathML:"<mo>&#9000;</mo>"
  Sum:
    MathML:"""
          <munderover>
            <mo>&Sum;</mo>
            <mrow>
              <mo>&EmptyVerySmallSquare;</mo>
            </mrow>
            <mrow>
              <mo>&EmptyVerySmallSquare;</mo>
            </mrow>
          </munderover>
          """
  Delta:
    MathML:"<mo>&Delta;</mo>"
  MathFunction:
    MathML:"<mo>&#x192;</mo>"
  sin:
    MathML:"<mo>sin</mo>"
  cos:
    MathML:"<mo>cos</mo>"
  tan:
    MathML:"<mo>tan</mo>"
  lambda:
    MathML:"<mo>&lambda;</mo>"
  pi:
    MathML:"<mo>&pi;</mo>"
  leftShift:
    MathML:"<mo>&#8679;</mo>"
  langle:
    MathML:"<mo>&langle;</mo>"
  superScript:
    MathML:"""
            <msup>
              <mo>sup</mo>
              <mrow>
                <mo>x</mo>
              </mrow>
            </msup>
          """
    ForAll:
      MathML:"<mo>&ForAll;</mo>"
    Exists:
      MathML:"<mo>&Exists;</mo>"
    in:
      MathML:"<mo>&in;</mo>"
    lessThan:
      MathML:"<mo><</mo>"
    greaterThan:
      MathML:"<mo>></mo>"
    divide:
      MathML:"<mo>&divide;</mo>"
    rightShift:
      MathML:"<mo>&#8679;</mo>"
    leftCtrl:
      MathML:"<mo>ctrl</mo>"
    leftAlt:
      MathML:"<mo>alt</mo>"
    leftSuper:
      MathML:"<mo>&#8984;</mo>"
    backspace:
      MathML:"<mo>&#9003;</mo>"
    rightAlt:
      MathML:"<mo>alt</mo>"
    rightCtrl:
      MathML:"<mo>ctrl</mo>"
    rarr:
      MathML:"<mo>&rarr;</mo>"
    larr:
      MathML:"<mo>&larr;</mo>"
    uarr:
      MathML:"<mo>&uarr;</mo>"
    darr:
      MathML:"<mo>&darr;</mo>"







mapping =
  "defaultMath":
    "`": "Tilde"
    "1": "NotEqual"
    "2": ""
    "3": "parallel"
    "4": ""
    "5": "percent"
    "6": "SquareRoot"
    "7": "PlusMinus"
    "8": "times"
    "9": ""
    "0": ""
    "-": "minus"
    "=": "=" # backspace omitted
    "backspace": "backspace"
    ,
    "tab": ""
    "q": ""
    "w": "log"
    "e": "epsilon"
    "r": ""
    "t": ""
    "y": ""
    "u": "Union"
    "i": "integral"
    "o": "dx"
    "p": "Product"
    "[": "leftBracket"
    "]": "rightBracket"
    "\\": "logicalAnd"
    ,
    "capsLock": "toggleKeyboards"
    "a": "ForAll"
    "s": "Sum"
    "d": "Delta"
    "f": "MathFunction"
    "g": ""
    "h": "sin"
    "j": "cos"
    "k": "tan"
    "l": "lambda"
    ";": "pi"
    "\'": "" # enter ommited
    ,
    "leftShift": "leftShift"
    "z": "langle"
    "x": "superScript"
    "c": "in"
    "v": ""
    "b": ""
    "n": ""
    "m": ""
    ",": "lessThan"
    ".": "greaterThan"
    "/": "divide"
    "rightShift": "rightShift"
    ,
    "leftCtrl": "leftCtrl"
    "leftSuper": "leftSuper"
    "leftAlt": "leftAlt"
    "space": ""
    "rightAlt": "rightAlt"
    "rightSuper": "rightSuper"
    "leftArrow": "larr"
    "upArrow": "uarr"
    "downArrow": "darr"
    "rightArrow": "rarr"
