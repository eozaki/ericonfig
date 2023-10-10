curl -s http://192.168.1.78:30000/eozaki/ericonfig/archive/main.zip -o main.zip
rm -rf ericonfig
unzip main.zip
rm main.zip
cd ericonfig
echo $PWD
./environment_script.sh
