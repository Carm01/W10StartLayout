# w10startLayout
Windows 10 start menu layouts that will remove EDGE from the taskbar. Chrome, Firefox, and IE are added IF installed.
Office apps are also placed on start menu if installed ( might have to rename if O365 )

++++++++++++++ADDITIONAL NOTES+++++++++++++++++++++++++++++++++

Let's examine the start menu setup and configuration for all users. In script 3, this simply places the files to make the start menu default for all users. The new xml start menu configuration must be called: LayoutModification.xml, and there cannot be any other .xml files in there. If you noticed I added a shortcut to IE in there. The reason I did this is that shortcut for IE lives in a location that already exists, and is not dependant on looking in the current user profile in the location of:
C:\Users\%username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Accessories
IE shortcut per user profile. 
So what you say it's there, why should i move it to another location? 
The reason is in my testing is that IE will sometimes appear on the start menu and sometimes will not. This is because when a profile is initially created, that part of the xml file is read only once, and if that link is NOT created in the profile BEFORE the xml file is read, it will never see it. That is why this shortcut got moved and has consistently showed up from there on.

Also, this xml sets the defaults to be placed on the taskbar. I have removed EDGE b/c it simply sucks right now. I added Firefox and Chrome as well as File explorer. 
There is a note here which I find puzzling is that even though the start menu portion is read only once during profile create, it looks like the taskbar piece could be read every time a user logs on so the minor nuisance is that if a user removes IE, it will come back during the next login. Users can add additional items and they stick. 
Users also can modify their start menu layout as well and it will stick.
