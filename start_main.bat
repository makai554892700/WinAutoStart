@echo off
echo "start......goto dir."
cd C:\WinAutoStart
:start
echo "start......run"
call java -jar app.jar
echo "end......"
goto start