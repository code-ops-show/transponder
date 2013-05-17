onload = function(){
  mocha.checkLeaks();
  mocha.globals(['jQuery']);
  var runner = mocha.run();

  // runner.on('test end', function(test){
  //   console.log(test.fullTitle());
  // });
};
