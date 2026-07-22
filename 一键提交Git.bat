@echo off
chcp 65001 >nul
echo 正在自动提交所有改动...
:: 刷新环境变量找到Git
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
:: 进入项目目录
cd /d D:\Aidrama
:: 添加所有改动
git add .
:: 自动用当前时间作为提交信息
git commit -m "auto: 自动提交 %date:~0,4%-%date:~5,2%-%date:~8,2% %time:~0,2%:%time:~3,2% 的改动"
:: 如果配置了远程仓库就自动推送
git push
echo.
echo ✅ 所有改动已提交！如果配置了远程仓库已自动推送
pause