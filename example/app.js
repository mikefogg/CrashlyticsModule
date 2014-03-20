// This is a test harness for your module
// You should do something interesting in this harness
// to test out the module and to provide instructions
// to users on how to use it by example.


// open a single window
var win = Ti.UI.createWindow({
	backgroundColor:'white'
});

win.open();

var crashlytics = require('crashlytics');
crashlytics.startWithAPIKey('ea9d6823a6f5af9ee61a8d931431e6f197ac339c');

Ti.API.info("module is => " + crashlytics);

var button = Ti.UI.createButton({title: 'click to crash!!'});

crashlytics.setIntValue([3, 'bb']);
crashlytics.setObjectValue(['ff', 'bb']);
crashlytics.setBoolValue([true, 'bb']);
crashlytics.setFloatValue([0.1, 'bb']);

button.addEventListener('click',function(e)
{
	Titanium.API.info("You clicked the button");
	crashlytics.setObjectValue([crashlytics, 'module name']);
	crashlytics.crash();
});

win.add(button);


