@echo off
cls
echo ============================================================
echo       IMAGE ENTITY EXTRACTION
echo       Processing 242 HVAC Images
echo ============================================================
echo.

REM Install requirements silently
pip install pandas openpyxl pillow google-generativeai openai python-dotenv --quiet --disable-pip-version-check 2>nul

REM Run the extraction
python unconstrained_extraction_improved.py

echo.
if %errorlevel% equ 0 (
    echo SUCCESS! Check output_improved folder.
    start "" "output_improved\narrative_analysis.xlsx"
) else (
    echo Error occurred. Check logs.
)

pause