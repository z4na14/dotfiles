1. Enable styling in `about:config`

toolkit.legacyUserProfileCustomizations.stylesheets -> True

2. Symlink the user.js and chrome folder into the firefox
and thunderbird profiles

> In thunderbird, the config is available in Settings -> General at the bottom

- ~/.thunderbird
- ~/.config/mozilla/firefox

ln user.js
ln -s chrome
