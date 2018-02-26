all:
	mkdir -p $(HOME)/.local/etc
	cp -f go-apt-cacher.toml $(HOME)/.local/etc/
	mkdir -p $(HOME)/.config/systemd/user/
	cp -f go-apt-cacher.service $(HOME)/.config/systemd/user/
	systemctl --user enable go-apt-cacher
