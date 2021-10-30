@echo off

REM Author: Aditya raj
REM Purpose: To simplify testing websites locally. It attempts the following-
REM              1. start python HTTP server in current folder at localhost:8000
REM              2. open localhost:8000 in guest profile of edge browser
REM              3. wait for browser to be closed
REM              4. and then terminate the python HTTP server.
REM Usage: save the batch file in a folder and add that folder to the path
REM        execute the batch file from your project folder to launch your site 


echo web-dev-utilities: server.bat
echo.


echo starting python HTTP sever..
REM "python_http_server" is window title
start /min "python_http_server" python -m http.server || pause && exit


echo launching browser and waiting for browser to be closed.. 
REM /W waits for browser to be closed
start /W msedge --guest "http://localhost:8000"

echo browser closed, terminating python http server..
REM kills the process with "python_http_server" as window title
taskkill /FI "WindowTitle eq python_http_server*" /T /F



