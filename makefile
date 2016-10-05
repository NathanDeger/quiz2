# Make file Quiz 2
# Nathan DeGeronimo


all: build doczip

build:
	gcc wc.c -o mywc
	
doc: html/index.html

html/index.html: wc.c
ifneq("$(wildcard config)","")
	doxygen -u config

else
	doxygen -g config

endif
	doxygen config
	
mywc:
	gcc wc.c -o mywc
	
doczip: doc.tgz
	
doc.tgz: html/index.html
	tar -czvf doc.tzg html/
	
clean:
	rm -rf *.o *~ *.tgz *#  a.out html/ config config.bak