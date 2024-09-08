@echo off
setlocal EnableDelayedExpansion

echo "The following command terminates the "npm start" process using its PID"
echo "(written to ".pidfile"), all of which were conducted when "deliver.sh""
echo "was executed."
set "-x"
SET _INTERPOLATION_0=
FOR /f "delims=" %%a in ('cat .pidfile') DO (SET "_INTERPOLATION_0=!_INTERPOLATION_0! %%a")
kill "!_INTERPOLATION_0:~1!"