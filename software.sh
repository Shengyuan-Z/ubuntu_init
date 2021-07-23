# vscode
snap install --classic code

# vlc
snap vlc

# chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
apt install ./google-chrome-stable_current_amd64.deb
rm ./google-chrome-stable_current_amd64.deb

# Sougou Pinyin
apt install fcitx -y
wget https://ime.sogouimecdn.com/202107231643/5985ce70367b8e91fd05ca101f2c86da/dl/index/1612260778/sogoupinyin_2.4.0.3469_amd64.deb
apt install ./https://ime.sogouimecdn.com/202107231643/5985ce70367b8e91fd05ca101f2c86da/dl/index/1612260778/sogoupinyin_2.4.0.3469_amd64.deb
rm ./https://ime.sogouimecdn.com/202107231643/5985ce70367b8e91fd05ca101f2c86da/dl/index/1612260778/sogoupinyin_2.4.0.3469_amd64.deb
