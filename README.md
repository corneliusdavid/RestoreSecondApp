# RestoreSecondApp

If you have a suite of Delphi VCL apps with a main one that calls others, sometimes the secondary apps get minimized. The button on your main form needs to restore it instead of launching a second instance of the app. You'd think this would be simple but can be complicated if your secondary app has modal windows, especially if they are minimized, too.

The answer is to use *Windows Messages*. Modern versions of Delphi have a great component to make this simple: `TApplicationEvents`.  Just create an event handler for the `OnMessage` event and handle a custom Windows message sent from the primary application. If you are using an old version of Delphi that doesn't have the TApplicationEvents component, you need to write a procedure that knows how to respond to Windows Messages.

This need to be done in all forms that might be open when you need to restore the secondary app from the primary one. **Program2** in this repository has two forms; `TApplicationEvents` is used in the main form and a custom Windows Message procedure is used in the second form so you can see how to implement it either way. The primary app, **Program1**, simply calls `PostMessage` which Program2 uses.

If you don't have to deal with modal windows, you could simply call `ShowWindow` and `SetForegroundWindow` from Program1 and be done with it. That option is also available in Program1 for you to test and see how Program2 responds in different scenarios.

Written in Delphi 10.3 (but a friend easily back-ported it to Delphi 2007 by deleting the `.dproj` files and changing the unit names).
