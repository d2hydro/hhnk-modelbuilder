mkdir .\code\tmp\models -p
python .\code\modelbuilder\tools\threedi-export\export_threedi.py \code\tmp\models\bwn_$2.sqlite
python .\code\modelbuilder\tools\modelchecker.py \code\tmp\models\bwn_$2.sqlite
rmdir /s /q .\code\data\output\models\*
mkdir .\code\data\output\models -p
xcopy /E /I /Y .\code\tmp\models .\code\data\output\models
rmdir /s /q .\code\tmp