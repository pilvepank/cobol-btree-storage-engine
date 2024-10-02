all:
	cobc -free -x -Wall -Icopybooks src/btree_engine.cbl -o btree_engine
	cobc -free -x -Wall -Icopybooks tests/btree_test.cbl -o btree_test
test:
	./btree_test
clean:
	rm -f btree_engine btree_test *.exe *.o
