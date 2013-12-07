TMP_DIR=files
ARCHIVE_DIR=filiados
URL_LIST=$(CURDIR)/url_list.txt
TIMESTAMP=$(CURDIR)/timestamp

.PHONY: all build extract tmp_dir timestamp

all: download timestamp extract

download: tmp_dir url_list.txt
	cd $(TMP_DIR) && cat $(URL_LIST) | xargs curl --remote-name-all -z "$(shell cat $(TIMESTAMP))" --progress-bar

tmp_dir:
	mkdir -p $(TMP_DIR)

url_list.txt:
	python url_list.py > $(URL_LIST)

timestamp:
	date --rfc-2822 > $(TIMESTAMP)

extract: tmp_dir
	ls $(TMP_DIR)/*.zip | xargs -n1 unzip -u -d $(ARCHIVE_DIR) -o
