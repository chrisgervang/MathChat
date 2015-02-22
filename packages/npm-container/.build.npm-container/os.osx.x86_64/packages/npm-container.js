(function () {

/////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                             //
// packages/npm-container/index.js                                                             //
//                                                                                             //
/////////////////////////////////////////////////////////////////////////////////////////////////
                                                                                               //
  Meteor.npmRequire = function(moduleName) {                                             // 85 // 1
    var module = Npm.require(moduleName);                                                // 86 // 2
    return module;                                                                       // 87 // 3
  };                                                                                     // 88 // 4
                                                                                         // 89 // 5
  Meteor.require = function(moduleName) {                                                // 90 // 6
    console.warn('Meteor.require is deprecated. Please use Meteor.npmRequire instead!'); // 91 // 7
    return Meteor.npmRequire(moduleName);                                                // 92 // 8
  };                                                                                     // 93 // 9
/////////////////////////////////////////////////////////////////////////////////////////////////

}).call(this);
