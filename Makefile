RAMCLOUD_DIR := ../../RAMCloud-profiling
RAMCLOUD_OBJ_DIR := $(RAMCLOUD_DIR)/obj.master

TARGETS :=  TableDownloader \
            TableUploader \
            SnapshotLoader \
            TimeOp \
						TimeReads \
						TimeMultiReads \
						TimeTransactionsAsyncReads \
            TableEnumeratorTestCase \
						TimeTraceTxReadOp \
            TransactionsTestCase \
            GetStats \
						GetMetrics \
						rcstat \
						TableImageSplitter

all: $(TARGETS)

%: src/main/cpp/%.cc
	g++ -o $@ $^ $(RAMCLOUD_OBJ_DIR)/OptionParser.o -g -std=c++0x -I$(RAMCLOUD_DIR)/src -I$(RAMCLOUD_OBJ_DIR) -L$(RAMCLOUD_OBJ_DIR) -lramcloud -lpcrecpp -lboost_program_options -lprotobuf -lrt -lboost_filesystem -lboost_system -lpthread -lssl -lcrypto 

clean:
	rm -f $(TARGETS)
