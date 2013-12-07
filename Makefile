TMP_DIR=files
TMP_ARCHIVE_DIR=$(TMP_DIR)/filiados
ARCHIVE_NAME=$(CURDIR)/filiados.tar.bz2
URL_LIST=$(CURDIR)/url_list.txt
TIMESTAMP=$(CURDIR)/timestamp

.PHONY: all build extract tmp_dir timestamp

all: download timestamp build

download: tmp_dir url_list.txt
	cd $(TMP_DIR) && cat $(URL_LIST) | xargs curl --remote-name-all -z "$(shell cat $(TIMESTAMP))" --progress-bar

tmp_dir:
	mkdir -p $(TMP_DIR) $(TMP_ARCHIVE_DIR)

url_list.txt:
	python url_list.py > $(URL_LIST)

timestamp:
	date --rfc-2822 > $(TIMESTAMP)

build: extract
	tar -C $(TMP_DIR) -cjf $(ARCHIVE_NAME) $(shell basename $(TMP_ARCHIVE_DIR))

extract: tmp_dir
	-test -e $(ARCHIVE_NAME) && tar -C $(TMP_DIR) -xjf $(ARCHIVE_NAME)
	ls $(TMP_DIR)/*.zip | xargs -n1 unzip -u -d $(TMP_ARCHIVE_DIR) -o
