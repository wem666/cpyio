all: cpyio

cpyio: cpyio.sh
	cp cpyio.sh cpyio
	chmod +x cpyio

clean:
	rm -f cpyio
