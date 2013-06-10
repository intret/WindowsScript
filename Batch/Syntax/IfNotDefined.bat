@echo off

if not defined myStr echo Not defined my string.
set myStr=h
if defined myStr echo defined myStr.

pause