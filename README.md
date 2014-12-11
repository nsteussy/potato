potato
======

HOW TO SET UP THE PROJECT IN ECLIPSE:

It's a little difficult to explain how to setup. However - once it's up and running it's simple to work with. You'll need:
Eclipse
Spring Tool Suite (you can get as an eclipse plugin, or you can download the entire version of eclipse dedicated to it)
Apache Tomcat 7 (http://tomcat.apache.org/download-70.cgi)
Ivy (eclipse plugin)
Github (eclipse plugin)

After those are all installed, you'll prolly need to restart eclipse. Fork the repository: https://github.com/ddmills/potato. Once you have those things installed and working, go to 
Eclipse ->
file ->
import ->
project from git ->
Clone uri ->
enter info + follow steps

The root folder is called "CyShop" - i dunno why, but don't try to change it or it'll probably break.

To get the server working:
window ->
show view ->
"servers" (a panel should come up labelled "servers") ->
right click in pane -> 
new-> 
server ->
tomcat v7 ->
server runtime environment (add) ->
browse to installed directory of tomcat 7 ->
finish ->
finish

Now there should be a "tomcat v7.0 Server at localhost" in your servers pane. 
Right click the server ->
add and remove -> 
push "CyShop" to the right side ->
finish

With Ivy installed there is a button in your toolbar labelled "Resolve All" to the left of the green "run" button. It has green and yellow arrows going in circles. That button should hopefully fix problems, try to click every time it before running. You can also right click on the server in the pane, and do "clean tomcat work directory", you can also right click the "CyShop" listed under the server and do "Clean Module Work Directory" - these will sometimes fix errors.

Once the server is running and the app is attached, the project will be on your localhost at: http://localhost:8080/FlashPotato/controller/main/view/

Um good luck. It can be a frustrating process.
