describe 'Keyboard', ->

  after -> @reset()
  before ->

    data =

      customKeyboard:
        math: [
          ['Tilde', 'NotEqual', 'blank', 'parallel', 'blank', 'percent', 'SquareRoot', 'PlusMinus', 'times', 'blank', 'blank', 'minus', 'equals', 'backspace'],
          ['blank', 'blank', 'log', 'epsilon', 'blank', 'blank', 'blank', 'Union', 'integral', 'dx', 'Product', 'leftBracket', 'rightBracket', 'logicalAnd'],
          ['toggleKeyboards', 'ForAll', 'Sum', 'Delta', 'MathFunction', 'blank', 'sin', 'cos', 'tan', 'lambda', 'pi', 'blank'],
          ['leftShift', 'langle', 'superScript', 'in', 'blank', 'blank', 'blank', 'blank', 'lessThan', 'greaterThan', 'divide', 'rightShift'],
          ['leftCtrl', 'leftSuper', 'leftAlt', 'blank', 'rightAlt', 'rightSuper', 'larr', 'uarr', 'darr', 'rarr']
        ]

        shift: [
          ['approx', 'Not', 'TildeFullEqual', 'nparallel', 'blank', 'blank', 'AnyRoot', 'blank', 'blank', 'openParen', 'closeParen', 'blank', 'plus', 'backspace'],
          ['blank', 'emptyset', 'ln', 'eulersConst', 'blank', 'blank', 'blank', 'Intersection', 'DoubleIntegral', 'dtheta', 'CircleTimes', 'leftCurly', 'rightCurly', 'logicalOr'],
          ['toggleKeyboards', 'blank', 'CirclePlus', 'PartialD', 'Infinity', 'blank', 'csc', 'sec', 'cot', 'blank', 'range', 'blank'],
          ['leftShift', 'blank', 'blank', 'blank', 'blank', 'blank', 'blank', 'blank', 'lessThanOrEqual', 'greaterThanOrEqual', 'fraction', 'rightShift'],
          ['leftCtrl', 'leftSuper', 'leftAlt', 'blank', 'rightAlt', 'rightSuper', 'larr', 'uarr', 'darr', 'rarr']
        ]

        controlAlt: [

        ]

        controlAltShift: [
          
        ]


    @load 'keyboard', size: '800, auto', align: 'center, bottom', background: 0.1, args: { data:data }
