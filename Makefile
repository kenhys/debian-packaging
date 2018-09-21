all:

goapt:
	mkdir -p $(HOME)/.local/etc
	cp -f go-apt-cacher.toml $(HOME)/.local/etc/
	mkdir -p $(HOME)/.config/systemd/user/
	cp -f go-apt-cacher.service $(HOME)/.config/systemd/user/
	systemctl --user enable go-apt-cacher

image:
	docker build -t sidja .

tmpfs:
	sudo mount -t tmpfs -o size=4g tmpfs /var/cache/pbuilder/build

acng:
	/usr/sbin/apt-cacher-ng -c etc/apt-cacher-ng ForeGround=1
