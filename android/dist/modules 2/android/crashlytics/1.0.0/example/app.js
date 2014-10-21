var crashlytics = require('crashlytics');
crashlytics.startWithAPIKey('insert_crashlytics_api_key');
crashlytics.setDebugMode(true);
Ti.API.info("module is => " + crashlytics);

// Set some variables to send along with the next crash
crashlytics.setIntValue([3, 'bb']);
crashlytics.setObjectValue(['ff', 'bb']);
crashlytics.setBoolValue([true, 'bb']);
crashlytics.setFloatValue([0.1, 'bb']);

// Create a crash button
var button = Ti.UI.createButton({title: 'click to crash!!'});

button.addEventListener('click',function(e)
{
	Titanium.API.info("You clicked the button");
	crashlytics.setObjectValue([crashlytics, 'module name']);
	crashlytics.crash();
});

win.add(button);

// open a single window
var win = Ti.UI.createWindow({
  backgroundColor:'white'
});

win.open();

