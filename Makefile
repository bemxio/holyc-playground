# constants
CC = hcc

SRC_DIR = src
BUILD_DIR = build

SOURCES = $(wildcard $(SRC_DIR)/*.HC)
TARGETS = $(patsubst $(SRC_DIR)/%.HC,$(BUILD_DIR)/%,$(SOURCES))

# targets
.PRECIOUS: $(BUILD_DIR)/%

all: $(TARGETS)

clean:
	$(RM) -r $(BUILD_DIR)

# rules
%: $(BUILD_DIR)/%
	./$<

$(BUILD_DIR)/%: $(SRC_DIR)/%.HC | $(BUILD_DIR)
	$(CC) $^ -o $@

$(BUILD_DIR):
	mkdir -p $@