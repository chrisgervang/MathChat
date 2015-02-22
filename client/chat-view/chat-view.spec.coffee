describe 'Chat View', ->

  after -> @reset()
  before ->

    data =

      customKeyboard:
        default: [
          ['blank', 'blank', 'blank', 'blank', 'blank', 'blank', 'blank', 'blank', 'blank', 'blank', 'blank', 'blank', 'blank', 'blank']
          ['blank', 'blank', 'blank', 'blank', 'blank', 'blank', 'blank', 'blank', 'blank', 'blank', 'blank', 'blank', 'blank', 'blank'],
          ['blank', 'blank', 'blank', 'blank', 'blank', 'blank', 'blank', 'blank', 'blank', 'blank', 'blank', 'blank', 'blank'],
          ['blank', 'blank', 'blank', 'blank', 'blank', 'blank', 'blank', 'blank', 'blank', 'blank', 'blank', 'blank'],
          ['blank', 'blank', 'blank', 'blank', 'blank', 'blank', 'blank', 'blank', 'blank', 'blank', 'blank']
        ]

        math: [
          ['Tilde', 'NotEqual', 'blank', 'parallel', 'blank', 'percent', 'SquareRoot', 'PlusMinus', 'times', 'blank', 'blank', 'minus', 'equals', 'backspace'],
          ['blank', 'blank', 'log', 'epsilon', 'blank', 'blank', 'blank', 'Union', 'integral', 'dx', 'Product', 'leftBracket', 'rightBracket', 'logicalAnd'],
          ['toggleKeyboard', 'ForAll', 'Sum', 'Delta', 'MathFunction', 'blank', 'sin', 'cos', 'tan', 'lambda', 'pi', 'blank', 'enter'],
          ['leftShift', 'langle', 'superScript', 'in', 'blank', 'blank', 'blank', 'blank', 'lessThan', 'greaterThan', 'divide', 'rightShift'],
          ['blank', 'leftCtrl', 'leftAlt', 'leftSuper', 'blank', 'leftSuper', 'rightAlt', 'larr', 'uarr', 'darr', 'rarr']
        ]

        shift: [
          ['approx', 'Not', 'TildeFullEqual', 'nparallel', 'blank', 'blank', 'AnyRoot', 'blank', 'blank', 'openParen', 'closeParen', 'blank', 'plus', 'backspace'],
          ['blank', 'emptyset', 'ln', 'eulersConst', 'blank', 'blank', 'blank', 'Intersection', 'DoubleIntegral', 'dtheta', 'CircleTimes', 'leftCurly', 'rightCurly', 'logicalOr'],
          ['toggleKeyboard', 'blank', 'CirclePlus', 'PartialD', 'Infinity', 'blank', 'csc', 'sec', 'cot', 'blank', 'range', 'blank', 'enter'],
          ['leftShift', 'blank', 'blank', 'blank', 'blank', 'blank', 'blank', 'blank', 'lessThanOrEqual', 'greaterThanOrEqual', 'fraction', 'rightShift'],
          ['blank', 'leftCtrl', 'leftAlt', 'leftSuper', 'blank', 'leftSuper', 'rightAlt', 'larr', 'uarr', 'darr', 'rarr']
        ]

        controlAlt: [

        ]

        controlAltShift: [

        ]

    @load 'chat-view', size: '800, auto', align: 'center, middle', background: 0.1, args: { data:data }
