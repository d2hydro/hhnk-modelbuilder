mkdir .\code\tmp\models
python .\code\modelbuilder\tools\threedi-export\export_threedi.py .\code\tmp\models\bwn_%2.sqlite
rem python .\code\modelbuilder\tools\modelchecker.py .\code\tmp\models\bwn_%2.sqlite
rmdir /s /q \\corp.hhnk.nl\data\Hydrologen_data\Data\modelbuilder\data\output\models
mkdir .\code\data\output\models
xcopy /E /I /Y .\code\tmp\models \\corp.hhnk.nl\data\Hydrologen_data\Data\modelbuilder\data\output\models
rmdir /s /q .\code\tmp