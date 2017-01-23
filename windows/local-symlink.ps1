# This script is totally tailored to my machine atm, will refactor in the future
# format: cmd /c mklink link target

#opengl - GLFW
cmd /c mklink /D c:\Users\cchou\dev\deps\opengl\include\GLFW c:\Users\cchou\dev\deps\opengl\glfw-3.2.1\include\GLFW
cmd /c mklink /D c:\Users\cchou\dev\deps\opengl\lib\GLFW C:\Users\cchou\dev\deps\opengl\glfw-3.2.1\build\src\Debug
#opengl - GLEW
cmd /c mklink /D c:\Users\cchou\dev\deps\opengl\include\GL c:\Users\cchou\dev\deps\opengl\glew-2.0.0\include\GL
cmd /c mklink /D c:\Users\cchou\dev\deps\opengl\lib\GL C:\Users\cchou\dev\deps\opengl\glew-2.0.0\build\vc14\lib\Debug

#vscode
cmd /c mklink C:\Users\cchou\AppData\Roaming\Code\User\settings.json c:\users\cchou\machinesetup\vscode\win\settings.json 