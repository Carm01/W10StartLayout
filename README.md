# Windows 10 Start Menu Layout
Windows 10 start menu layouts that will remove EDGE from the task-bar. Chrome, Firefox, and IE are added IF installed.
Office apps are also placed on start menu if installed ( might have to rename if O365 ).
To implement this change you can simply place ( download ) the following files:
- setupStartLayout.cmd
- Internet Explorer.lnk
- DefaultLayouts.xml

Simply run the file `setupStartLayout.cmd` as administrator.
_If you wish to modify the file in any way using Notepad++ is highly recommended, and see the notes below._


## Script details
Let's examine the start menu setup and configuration for all users. In the script it simply places the files to make the start menu default for all users.
 
- The new xml start menu configuration must be called: _LayoutModification.xml_, and there should not be any other .xml files in there. 
- Start menu TILES are read only once during profile create.
- If you noticed I added a shortcut to IE in there. The reason I moved it there is because the default location is within a users profile, so, per profile basis it is referenced. Moving to a global location ensures that if the xml file is read before the per user shortcut is created then there will be no icon for IE.

- This xml sets the defaults to be placed on the task-bar. 
  - I have removed EDGE b/c it simply sucks right now. 
  - I added Firefox and Chrome as well as File explorer( standard ).
  - Task-bar layout for the task-bar function: `PinListPlacement="Replace"` are read every login, and will always replace if the user removed.
  

- To export the current start menu layout you can run the following elevated power-shell command:
  
  `Export-StartLayout -Path "$env:UserProfile\Desktop\StartLayout.xml"`

This will create a .xml on the desktop that you can use to create your own start-menu layout. Use the template I provided to make any changes. The start menu is only read once during create, and is customizable per user basis. the Task-bar piece is not. 
