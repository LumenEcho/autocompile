run: run.sh
	@if !d ocker -v ; then \
	    echo "Installing docker"; \
	    sudo apt install docker.io; \
	fi;
	sudo chmod 755 run.sh
	read -p "Please enter the path of the file you wish to use Run on(It is recommended to just run the run.sh script instead of using this tool): " codePath; \
	./run.sh $$codePath