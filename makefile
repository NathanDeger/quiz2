# Make file Quiz 2
# Nathan DeGeronimo

CXX = gcc

CXXFLAGS = -Wall -g




all: build doczip 
	

build: collegemain.o college.o course.o 
	$(CXX) $(CXXFLAGS) -o myexe college.o collegemain.o course.o 
 


doc: html/index.html
	

html/index.html: collegemain.cc college.cc course.cc
	ifneq("$(wildcard config)","")
		doxygen -u config

	else
		doxygen -g config

	endif
		doxygen config
	


collegemain.o: collegemain.cc course.h node.h college.h
	$(CXX) $(CXXFLAGS) -c collegemain.cc

college.o: college.cc college.h node.h course.h
	$(CXX) $(CXXFLAGS) -c college.cc

course.o: course.cc course.h 
	$(CXX) $(CXXFLAGS) -c course.cc

node.o: node.h course.h

tarray.o: tarray.h


doczip: doc.tgz
	

doc.tgz: html/index.html
	tar -czvf doc.tzg html/


clean:
	rm -rf *.o *~ *.tgz *#  a.out html/ config config.bak






